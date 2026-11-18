import express from 'express';
import path from 'path';
import cors from 'cors';
import helmet from 'helmet';
import { createServer as createViteServer } from 'vite';

import { config } from './server/src/config/env.js';
import { initDatabase } from './server/src/config/database.js';
import { setupSwagger } from './server/src/config/swagger.js';
import { logger } from './server/src/utils/logger.js';
import { errorHandler } from './server/src/middleware/errorHandler.js';
import { apiRateLimiter } from './server/src/middleware/rateLimiter.js';

import authRoutes from './server/src/routes/authRoutes.js';
import userRoutes from './server/src/routes/userRoutes.js';
import projectRoutes from './server/src/routes/projectRoutes.js';
import researcherRoutes from './server/src/routes/researcherRoutes.js';
import fundingRoutes from './server/src/routes/fundingRoutes.js';
import publicationRoutes from './server/src/routes/publicationRoutes.js';
import reportRoutes from './server/src/routes/reportRoutes.js';
import logRoutes from './server/src/routes/logRoutes.js';

const app = express();
const PORT = 3000;

// Trust proxy for rate limiter when running behind reverse proxy
app.set('trust proxy', 1);

// Security & Body Parsing Middlewares
app.use(helmet({ contentSecurityPolicy: false }));
app.use(cors({ origin: true, credentials: true }));
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true, limit: '10mb' }));

// Global Rate Limiter
app.use('/api', apiRateLimiter);

// API Routes
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/projects', projectRoutes);
app.use('/api/researchers', researcherRoutes);
app.use('/api/funding', fundingRoutes);
app.use('/api/publications', publicationRoutes);
app.use('/api/reports', reportRoutes);
app.use('/api/logs', logRoutes);

// Health Check Endpoint
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', service: 'RPMP API', timestamp: new Date().toISOString() });
});

// Swagger OpenAPI Documentation
setupSwagger(app);

// Centralized Error Handler
app.use(errorHandler);

async function startServer() {
  await initDatabase();

  // Vite Middleware for Development / Static serving for Production
  if (process.env.NODE_ENV !== 'production') {
    const vite = await createViteServer({
      server: { middlewareMode: true, hmr: false, ws: false },
      appType: 'spa',
    });
    app.use(vite.middlewares);
  } else {
    const distPath = path.join(process.cwd(), 'dist');
    app.use(express.static(distPath));
    app.get('*', (req, res) => {
      res.sendFile(path.join(distPath, 'index.html'));
    });
  }

  const server = app.listen(PORT, '0.0.0.0', () => {
    logger.info(`RPMP Server running on http://0.0.0.0:${PORT}`);
    logger.info(`Swagger API Docs available at http://0.0.0.0:${PORT}/api-docs`);
  });

  server.on('error', (err: any) => {
    logger.error(`HTTP Server failed to bind port ${PORT}: ${err?.message || err}`);
    process.exit(1);
  });
}

startServer().catch((err) => {
  logger.error(`Fatal startup error: ${err?.message || err}`);
  process.exit(1);
});

export default app;

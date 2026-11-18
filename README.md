# Research Project Management Portal — RPMP (SQLite Edition)

An institutional, enterprise-grade academic research management system designed for universities, laboratories, and research consortia. RPMP replaces manual tracking spreadsheets with a centralized, role-based platform for managing research projects, team researchers, grant funding disbursements, peer-reviewed publications, audit logs, and compliance report generation.

---

## 🌟 Key Features

- **Zero-Setup SQLite Database:** Runs locally in Visual Studio Code without requiring PostgreSQL installation or database servers.
- **Role-Based Access Control (RBAC):** Distinct workflows and access levels for **ADMIN** (full system governance) and **RESEARCHER** (assigned workspace & paper tracking).
- **Project Lifecycle Management:** Comprehensive CRUD operations, status tracking (`PLANNED`, `ONGOING`, `ON_HOLD`, `COMPLETED`, `CANCELLED`), timelines, and milestone tracking.
- **Researchers & Faculty Registry:** Profile records for principal investigators, postdoctoral fellows, and team members with project assignment tracking.
- **Grants & Funding Ledger:** Track institutional grants, industry sponsorships, seed funding disbursements, and project-level financial totals.
- **Publications Library:** Central repository for peer-reviewed papers, conference proceedings, authors list, and project associations.
- **Compliance & Analytics Reporting:** Export data to PDF compliance reports, CSV spreadsheets, or view live JSON summaries.
- **Security & Audit Logs:** Real-time logging of user actions, entity modifications, IP addresses, and operational telemetry.
- **OpenAPI / Swagger Documentation:** Integrated interactive API specification available at `/api-docs`.

---

## 🛠️ Technology Stack

### Frontend
- **Framework:** React 18+ with Vite
- **Styling:** Tailwind CSS v4 with custom design tokens & CSS variables
- **Icons:** Lucide React
- **Data Visualization:** Recharts
- **Notifications:** React Hot Toast
- **Routing:** React Router DOM v7

### Backend
- **Runtime:** Node.js ES6+ with Express.js
- **Database:** SQLite3 via `better-sqlite3` (`server/database/rpmp.db`)
- **Authentication:** JSON Web Tokens (JWT) & `bcryptjs` password hashing
- **Security:** Helmet, CORS, and Express Rate Limiter
- **Documentation:** Swagger UI Express & OpenAPI 3.0
- **Logging:** Winston Logger
- **Testing:** Mocha, Chai, & Supertest

---

## 📁 Repository Directory Structure

```
rpmp-portal/
├── server/
│   ├── database/
│   │   └── rpmp.db             # Auto-generated SQLite database
│   └── src/
│       ├── config/             # Database (SQLite), Swagger, & Env configuration
│       ├── controllers/        # RESTful route controllers
│       ├── middleware/         # Auth, Authorization, Rate Limiting, Audit Logging
│       ├── routes/             # API route handlers
│       ├── services/           # PDF & CSV Report generation logic
│       ├── tests/              # Supertest & Mocha API integration tests
│       ├── utils/              # Winston logger & helpers
│       └── validators/         # Request input validation schemas
├── src/
│   ├── api/                    # Axios client interceptor
│   ├── components/             # Reusable UI components & layouts
│   ├── context/                # Auth & Theme React contexts
│   ├── pages/                  # Application view pages
│   ├── styles/                 # Design tokens & global CSS
│   ├── types/                  # Global TypeScript interfaces
│   ├── App.tsx                 # Application router & providers
│   └── main.tsx                # Entry point
├── server.ts                   # Express + Vite hybrid dev/prod entry point
├── metadata.json               # Application metadata
└── package.json                # Dependencies & build scripts
```

---

## 🔑 Default Login Credentials

You can use the built-in quick demo login buttons on the sign-in screen or manually enter these credentials:

| Role | Email | Password | Access Level |
|---|---|---|---|
| **Default Admin** | `admin@rpmp.lk` | `Admin@123` | System-wide full CRUD, User Management, Audit Logs |
| **Faculty Admin** | `admin@rpmp.edu` | `Admin123!` | Secondary Admin account |
| **Researcher** | `researcher@rpmp.edu` | `Research123!` | View assigned projects, link publications, export reports |

---

## 🚀 Running in Visual Studio Code (Without PostgreSQL)

### Step 1: Clone or Open Project in VS Code
Open VS Code, press `Ctrl + ~` (or `Cmd + ~` on macOS) to open the built-in terminal, and navigate to the project root:

```bash
cd rpmp-portal
```

### Step 2: Install Dependencies
Run npm install to install Express, React, Vite, and `better-sqlite3`:

```bash
npm install
```

### Step 3: Configure Environment Variables
Copy `.env.example` to `.env` (or create `.env`):

```bash
cp .env.example .env
```

`.env` configuration example:
```env
PORT=3000
NODE_ENV=development
JWT_SECRET=rpmp_secure_jwt_token_secret_key_2026
JWT_EXPIRES_IN=24h
```

### Step 4: Run Development Server
Start the unified full-stack dev server:

```bash
npm run dev
```

*The server will automatically create `server/database/rpmp.db`, run table schema initialization, and populate default seed data including `admin@rpmp.lk` / `Admin@123`.*

- **Web Application App:** `http://localhost:3000`
- **Interactive Swagger API Docs:** `http://localhost:3000/api-docs`

---

## 🧪 Testing

Run the automated API test suite against the SQLite database:

```bash
npm test
```

Run TypeScript compilation check:

```bash
npm run lint
```

---

## 🔧 Troubleshooting Guide

| Issue | Root Cause | Solution |
|---|---|---|
| **SQLite File Lock / Access Error** | Another Node process or VS Code extension is locking `rpmp.db`. | Stop running Node server processes (`lsof -ti:3000 | xargs kill -9` or kill Node in Task Manager). |
| **JWT Token Invalid / Expired** | Mismatched `JWT_SECRET` or token expired after 24h. | Clear browser `localStorage` or click **Sign Out**, then re-authenticate using `admin@rpmp.lk` / `Admin@123`. |
| **Port 3000 In Use** | Another process is occupying port 3000. | Stop the process or change the `PORT` variable in `.env`. |
| **`better-sqlite3` Build Warning** | Missing C++ build tools on Windows. | `better-sqlite3` includes prebuilt binaries for common platforms. If needed, install `npm install --global windows-build-tools` or use Node 18/20 LTS. |

---

## ✅ Final Verification Checklist

- [x] **Zero External Database**: Operates entirely on embedded SQLite database (`server/database/rpmp.db`).
- [x] **Backend REST API**: Complete CRUD routes for Auth, Users, Projects, Researchers, Funding, Publications, Logs, and Reports.
- [x] **Security**: JWT Authentication, bcrypt password hashing, Role-Based Access Control (Admin vs Researcher), Helmet security headers, CORS, Rate Limiting.
- [x] **Auto-Initialization & Seeding**: Auto-creates tables and seeds `admin@rpmp.lk` (`Admin@123`) on startup.
- [x] **Validation & Logging**: Express Validator input constraints and Winston structured logging.
- [x] **Documentation**: Interactive OpenAPI / Swagger UI at `/api-docs`.
- [x] **Frontend UI**: Responsive React + Tailwind CSS dashboard with dark/light themes, modal forms, live search & filtering, real API integration, and PDF/CSV reporting.
- [x] **Automated Testing**: Integration test suite verifying API endpoints and RBAC constraints.

---

## 📄 License

This project is licensed under the MIT License — free for academic and commercial research management deployment.

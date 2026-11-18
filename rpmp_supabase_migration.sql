-- RPMP SQLite to Supabase PostgreSQL import
-- WARNING: Contains user emails and password hashes. Keep private.
-- Run only on an EMPTY set of RPMP tables; review before use.
-- Contains demo accounts seeded with documented default credentials. Reset them before deployment.

BEGIN;

DO $$
BEGIN
  IF (SELECT COUNT(*) FROM public."users") > 0 OR (SELECT COUNT(*) FROM public."projects") > 0 OR (SELECT COUNT(*) FROM public."researchers") > 0 OR (SELECT COUNT(*) FROM public."funding") > 0 OR (SELECT COUNT(*) FROM public."publications") > 0 OR (SELECT COUNT(*) FROM public."activity_logs") > 0 THEN
    RAISE EXCEPTION 'Migration cancelled: one or more RPMP destination tables already contain records. No data was imported.';
  END IF;
END $$;

-- users: 4 records
INSERT INTO public."users" ("user_id", "uid", "name", "email", "password_hash", "role", "is_active", "created_at", "updated_at") VALUES (1, NULL, 'Default System Admin', 'admin@rpmp.lk', '$2b$10$sZm7W69kMWNsGSYzv3ZjteLxYdQSUUJ0c3OivWHsrX.kkVcu2cQ62', 'ADMIN', TRUE, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."users" ("user_id", "uid", "name", "email", "password_hash", "role", "is_active", "created_at", "updated_at") VALUES (2, NULL, 'Dr. Eleanor Vance', 'admin@rpmp.edu', '$2b$10$0gjVUKLfokUsUPkR5IhbVem4PmVTapW1dyJUZssILj7zHBE3yWCTa', 'ADMIN', TRUE, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."users" ("user_id", "uid", "name", "email", "password_hash", "role", "is_active", "created_at", "updated_at") VALUES (3, NULL, 'Dr. Marcus Brody', 'researcher@rpmp.edu', '$2b$10$CD7Jqq.UCOP4G4jPUh.Mv.Xq4kOyTxN9fqoreQKoFFJfm2k3X8K/C', 'RESEARCHER', TRUE, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."users" ("user_id", "uid", "name", "email", "password_hash", "role", "is_active", "created_at", "updated_at") VALUES (4, NULL, 'Dr. Sarah Chen', 'dr.smith@rpmp.edu', '$2b$10$eFWf9Q9aHX27h9RPWvj36.Oq5U6zKEXORLpPWgUUXFDWEuJ5tub1K', 'RESEARCHER', TRUE, '2026-11-16 17:20:17', '2026-11-16 17:20:17');

-- projects: 6 records
INSERT INTO public."projects" ("project_id", "title", "description", "start_date", "end_date", "status", "created_by", "created_at", "updated_at") VALUES (1, 'Quantum Computing & Cryptography Neural Networks', 'Investigating quantum-resistant cryptographic primitives for next-gen distributed networks.', '2026-01-15', '2027-06-30', 'ONGOING', 1, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."projects" ("project_id", "title", "description", "start_date", "end_date", "status", "created_by", "created_at", "updated_at") VALUES (2, 'AI-Driven Climate Change Prediction Model', 'Developing high-resolution machine learning models to forecast localized microclimate variances.', '2025-09-01', '2026-12-31', 'ONGOING', 1, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."projects" ("project_id", "title", "description", "start_date", "end_date", "status", "created_by", "created_at", "updated_at") VALUES (3, 'Bio-compatible Nanomaterials for Targeted Drug Delivery', 'Synthesis of functionalized lipid nanoparticles for oncology therapeutic delivery.', '2026-03-01', '2026-11-30', 'PLANNED', 3, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."projects" ("project_id", "title", "description", "start_date", "end_date", "status", "created_by", "created_at", "updated_at") VALUES (4, 'Autonomous Swarm Robotics in Disaster Recovery', 'Multi-agent pathfinding algorithms for emergency search and rescue drone swarms.', '2024-05-10', '2025-11-20', 'COMPLETED', 1, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."projects" ("project_id", "title", "description", "start_date", "end_date", "status", "created_by", "created_at", "updated_at") VALUES (5, 'Grid-Scale Solid State Energy Storage', 'Electro-chemical optimization of solid-state lithium ceramic batteries.', '2025-02-01', '2026-08-15', 'ON_HOLD', 4, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."projects" ("project_id", "title", "description", "start_date", "end_date", "status", "created_by", "created_at", "updated_at") VALUES (6, 'bij', 'hibdughu9', '2026-11-25', '2026-12-05', 'ONGOING', 1, '2026-11-16 19:19:17', '2026-11-16 19:19:17');

-- researchers: 5 records
INSERT INTO public."researchers" ("researcher_id", "name", "email", "project_id", "role_or_position", "user_id", "created_at", "updated_at") VALUES (1, 'Dr. Marcus Brody hulk', 'researcher@rpmp.edu', 1, 'Principal Investigator', 3, '2026-11-16 17:20:17', '2026-11-16 19:04:00');
INSERT INTO public."researchers" ("researcher_id", "name", "email", "project_id", "role_or_position", "user_id", "created_at", "updated_at") VALUES (2, 'Dr. Sarah Chen', 'dr.smith@rpmp.edu', 2, 'Lead Data Scientist', 4, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."researchers" ("researcher_id", "name", "email", "project_id", "role_or_position", "user_id", "created_at", "updated_at") VALUES (3, 'Prof. Alan Turing', 'alan.turing@rpmp.edu', 1, 'Quantum Hardware Specialist', NULL, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."researchers" ("researcher_id", "name", "email", "project_id", "role_or_position", "user_id", "created_at", "updated_at") VALUES (4, 'Dr. Rosalind Franklin', 'rosalind.f@rpmp.edu', 3, 'Senior Bio-Chemist', NULL, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."researchers" ("researcher_id", "name", "email", "project_id", "role_or_position", "user_id", "created_at", "updated_at") VALUES (5, 'Elena Rostova', 'elena.rostova@rpmp.edu', 4, 'Robotics Control Engineer', NULL, '2026-11-16 17:20:17', '2026-11-16 17:20:17');

-- funding: 5 records
INSERT INTO public."funding" ("fund_id", "source", "amount", "project_id", "funding_date", "description", "created_at", "updated_at") VALUES (1, 'National Science Foundation (NSF)', 450000.0, 1, '2026-01-20', 'Phase I Research Grant for Quantum Cryptography', '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."funding" ("fund_id", "source", "amount", "project_id", "funding_date", "description", "created_at", "updated_at") VALUES (2, 'Department of Energy (DOE)', 620000.0, 2, '2025-09-15', 'Climate Simulation High Performance Computing Grant', '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."funding" ("fund_id", "source", "amount", "project_id", "funding_date", "description", "created_at", "updated_at") VALUES (3, 'Global Health Innovation Fund', 300000.0, 3, '2026-02-10', 'Nanotechnology Biomaterial Synthesis Seed Fund', '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."funding" ("fund_id", "source", "amount", "project_id", "funding_date", "description", "created_at", "updated_at") VALUES (4, 'Advanced Research Projects Agency (ARPA)', 850000.0, 4, '2024-05-15', 'Autonomous Systems Emergency Swarm Grant', '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."funding" ("fund_id", "source", "amount", "project_id", "funding_date", "description", "created_at", "updated_at") VALUES (5, 'Clean Energy Alliance', 250000.0, 5, '2025-02-10', 'Battery Materials Research Grant', '2026-11-16 17:20:17', '2026-11-16 17:20:17');

-- publications: 4 records
INSERT INTO public."publications" ("pub_id", "title", "authors", "publication_date", "project_id", "created_at", "updated_at") VALUES (1, 'Post-Quantum Lattice Cryptography in Distributed Mesh Networks', 'Marcus Brody, Alan Turing, Eleanor Vance', '2026-05-12', 1, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."publications" ("pub_id", "title", "authors", "publication_date", "project_id", "created_at", "updated_at") VALUES (2, 'Deep Spatio-Temporal Convolutional Networks for Microclimate Forecasting', 'Sarah Chen, Eleanor Vance', '2026-02-18', 2, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."publications" ("pub_id", "title", "authors", "publication_date", "project_id", "created_at", "updated_at") VALUES (3, 'Obstacle Avoidance and Consensus in Decentralized Drone Swarms', 'Elena Rostova, Marcus Brody', '2025-10-05', 4, '2026-11-16 17:20:17', '2026-11-16 17:20:17');
INSERT INTO public."publications" ("pub_id", "title", "authors", "publication_date", "project_id", "created_at", "updated_at") VALUES (4, 'Solid-Electrolyte Interphase Stability in Ceramic Batteries', 'Sarah Chen', '2025-07-22', 5, '2026-11-16 17:20:17', '2026-11-16 17:20:17');

-- activity_logs: 12 records
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (1, '2026-11-16 17:20:17', 1, 'USER_LOGIN', 'USER', 1, 'User admin@rpmp.lk logged in successfully', 'SUCCESS', '127.0.0.1');
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (2, '2026-11-16 17:20:17', 1, 'CREATE_PROJECT', 'PROJECT', 1, 'Created project Quantum Computing & Cryptography', 'SUCCESS', '127.0.0.1');
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (3, '2026-11-16 17:20:17', 3, 'CREATE_PUBLICATION', 'PUBLICATION', 1, 'Created publication Post-Quantum Lattice Cryptography', 'SUCCESS', '127.0.0.1');
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (4, '2026-11-16 17:44:19', 2, 'USER_LOGIN', 'USER', 2, 'User admin@rpmp.edu logged in successfully', 'SUCCESS', '127.0.0.1');
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (5, '2026-11-16 17:44:19', 1, 'USER_LOGIN', 'USER', 1, 'User admin@rpmp.lk logged in successfully', 'SUCCESS', '127.0.0.1');
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (6, '2026-11-16 19:03:07', 2, 'USER_LOGIN', 'USER', 2, 'User admin@rpmp.edu logged in successfully', 'SUCCESS', '127.0.0.1');
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (7, '2026-11-16 19:04:00', 2, 'UPDATE_RESEARCHER', 'RESEARCHER', 1, 'Updated researcher Dr. Marcus Brody hulk', 'SUCCESS', '127.0.0.1');
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (8, '2026-11-16 19:05:31', 2, 'GENERATE_REPORT', 'REPORT', NULL, 'Generated Projects Report (Format: JSON)', 'SUCCESS', '127.0.0.1');
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (9, '2026-11-16 19:17:23', 1, 'USER_LOGIN_FAILED', 'USER', 1, 'Invalid password for user admin@rpmp.lk', 'FAILURE', '127.0.0.1');
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (10, '2026-11-16 19:17:36', 1, 'USER_LOGIN_FAILED', 'USER', 1, 'Invalid password for user admin@rpmp.lk', 'FAILURE', '127.0.0.1');
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (11, '2026-11-16 19:17:43', 1, 'USER_LOGIN', 'USER', 1, 'User admin@rpmp.lk logged in successfully', 'SUCCESS', '127.0.0.1');
INSERT INTO public."activity_logs" ("log_id", "timestamp", "user_id", "action_type", "entity_type", "entity_id", "description", "status", "ip_address") VALUES (12, '2026-11-16 19:19:17', 1, 'CREATE_PROJECT', 'PROJECT', 6, 'Created project: bij', 'SUCCESS', '127.0.0.1');

SELECT setval(pg_get_serial_sequence('public.users', 'user_id'), COALESCE((SELECT MAX("user_id") FROM public."users"), 1), (SELECT COUNT(*) > 0 FROM public."users"));
SELECT setval(pg_get_serial_sequence('public.projects', 'project_id'), COALESCE((SELECT MAX("project_id") FROM public."projects"), 1), (SELECT COUNT(*) > 0 FROM public."projects"));
SELECT setval(pg_get_serial_sequence('public.researchers', 'researcher_id'), COALESCE((SELECT MAX("researcher_id") FROM public."researchers"), 1), (SELECT COUNT(*) > 0 FROM public."researchers"));
SELECT setval(pg_get_serial_sequence('public.funding', 'fund_id'), COALESCE((SELECT MAX("fund_id") FROM public."funding"), 1), (SELECT COUNT(*) > 0 FROM public."funding"));
SELECT setval(pg_get_serial_sequence('public.publications', 'pub_id'), COALESCE((SELECT MAX("pub_id") FROM public."publications"), 1), (SELECT COUNT(*) > 0 FROM public."publications"));
SELECT setval(pg_get_serial_sequence('public.activity_logs', 'log_id'), COALESCE((SELECT MAX("log_id") FROM public."activity_logs"), 1), (SELECT COUNT(*) > 0 FROM public."activity_logs"));

COMMIT;

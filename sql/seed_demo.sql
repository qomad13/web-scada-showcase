-- Синтетический seed для демо

-- Catalog DB data (demo)
INSERT INTO catalog_user (username, password_hash, role, is_active)
VALUES ('demo_support', '$2b$10$abcdefghijklmnopqrstuv', 'support', 1)
ON DUPLICATE KEY UPDATE username = username;

INSERT INTO uid (code, name, station_type, max_stations, is_active)
VALUES ('00000000-0000-0000-0000-00000000DEMO', 'Demo UID', 'demo-station', 10, 1)
ON DUPLICATE KEY UPDATE name = name;

INSERT INTO project (slug, name, owner_super_admin_id, telegram_enabled)
VALUES ('demo-project', 'Demo Project', 1, 0)
ON DUPLICATE KEY UPDATE name = name;

INSERT INTO uid_assignment (uid_id, super_admin_id)
VALUES (1, 1)
ON DUPLICATE KEY UPDATE uid_id = uid_id;

INSERT INTO uid_project_map (uid_id, project_id)
VALUES (1, 1)
ON DUPLICATE KEY UPDATE uid_id = uid_id;

-- Project DB data (demo)
INSERT INTO User (username, password_hash, role, is_active, pumpControlAccess)
VALUES ('demo_admin', '$2b$10$abcdefghijklmnopqrstuv', 'admin', 1, 1)
ON DUPLICATE KEY UPDATE username = username;

INSERT INTO SetGroup (name) VALUES ('Default Group') ON DUPLICATE KEY UPDATE name = name;
INSERT INTO StationSet (name) VALUES ('Demo Stations') ON DUPLICATE KEY UPDATE name = name;

INSERT INTO UserSetGroup (user_id, set_group_id) VALUES (1, 1)
ON DUPLICATE KEY UPDATE user_id = user_id;

-- Демонстрационные данные трендов/событий
INSERT INTO scd_event (station_num, event_code, severity, message, is_active)
VALUES (1, 1001, 'WARNING', 'Demo warning event', 1);

INSERT INTO trend_data (station_num, tag, value)
VALUES (1, 'pressure', 1.23), (1, 'temperature', 23.5);

INSERT INTO station_last_values (station_num, tag, value)
VALUES (1, 'pressure', 1.23), (1, 'temperature', 23.5)
ON DUPLICATE KEY UPDATE value = VALUES(value), ts = CURRENT_TIMESTAMP;


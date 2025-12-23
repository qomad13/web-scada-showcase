-- Catalog schema (без данных)

CREATE TABLE catalog_user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(64) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('support','superadmin') NOT NULL,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE uid (
  id INT AUTO_INCREMENT PRIMARY KEY,
  code CHAR(36) NOT NULL UNIQUE,
  name VARCHAR(128) NOT NULL,
  station_type VARCHAR(64) NULL,
  max_stations INT NULL,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE project (
  id INT AUTO_INCREMENT PRIMARY KEY,
  slug VARCHAR(64) NOT NULL UNIQUE,
  name VARCHAR(128) NOT NULL,
  owner_super_admin_id INT NOT NULL,
  telegram_enabled TINYINT(1) NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_project_owner FOREIGN KEY (owner_super_admin_id) REFERENCES catalog_user(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE uid_assignment (
  id INT AUTO_INCREMENT PRIMARY KEY,
  uid_id INT NOT NULL,
  super_admin_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uniq_uid_owner (uid_id, super_admin_id),
  CONSTRAINT fk_uid_assignment_uid FOREIGN KEY (uid_id) REFERENCES uid(id) ON DELETE CASCADE,
  CONSTRAINT fk_uid_assignment_user FOREIGN KEY (super_admin_id) REFERENCES catalog_user(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE uid_project_map (
  id INT AUTO_INCREMENT PRIMARY KEY,
  uid_id INT NOT NULL,
  project_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uniq_uid_project (uid_id, project_id),
  CONSTRAINT fk_uid_project_map_uid FOREIGN KEY (uid_id) REFERENCES uid(id) ON DELETE CASCADE,
  CONSTRAINT fk_uid_project_map_project FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


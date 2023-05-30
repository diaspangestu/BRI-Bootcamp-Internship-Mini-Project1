USE bootcampbri_minpro1;

# Table Actors
CREATE TABLE actors (
    id BIGINT UNSIGNED NOT NULL,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(30) NOT NULL,
    role_id INT UNSIGNED NOT NULL,
    is_verified ENUM('true', 'false'),
    is_active ENUM('true', 'false'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

# Table Customer
CREATE TABLE customer (
    id BIGINT UNSIGNED NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    avatar VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

# Table Role
CREATE TABLE role (
    id INT UNSIGNED NOT NULL,
    role_name VARCHAR(15),
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE register_approval (
    id BIGINT UNSIGNED NOT NULL,
    admin_id BIGINT UNSIGNED NOT NULL,
    super_admin_id BIGINT UNSIGNED NOT NULL,
    status VARCHAR(25),
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESC actors;
DESC customer;
DESC role;
DESC register_approval;

# Alter Table
ALTER TABLE actors
ADD FOREIGN KEY (role_id) REFERENCES role(id);

ALTER TABLE register_approval
ADD FOREIGN KEY (admin_id) REFERENCES actors(id),
ADD FOREIGN KEY (super_admin_id) REFERENCES actors(id);

# Insert Data
INSERT INTO role (id, role_name)
VALUES (1, 'superadmin'),
       (2, 'admin');

INSERT INTO actors (id, username, password, role_id, is_verified, is_active)
VALUES (1, 'superadmin', 'password123', 1, true, true);

# Select Data
SELECT * FROM role;
SELECT * FROM actors;

# Join
SELECT
    a.username,
    r.role_name,
    a.is_verified,
    a.is_active
FROM actors AS a
INNER JOIN role AS r ON a.role_id = r.id;
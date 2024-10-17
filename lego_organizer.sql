-- Create database for LEGO Organizer
CREATE DATABASE lego_organizer;

-- Use the newly created database
USE lego_organizer;

-- Table for collectors (users who manage sets)
CREATE TABLE collectors (
    collector_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    is_admin BOOLEAN DEFAULT 0, -- Allows for adding other collectors
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for LEGO sets
CREATE TABLE sets (
    set_id INT AUTO_INCREMENT PRIMARY KEY,
    set_name VARCHAR(255) NOT NULL,
    theme VARCHAR(255),
    release_date DATE,
    set_image_url VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    collector_id INT,
    FOREIGN KEY (collector_id) REFERENCES collectors(collector_id) ON DELETE SET NULL
);

-- Table for public admired users
CREATE TABLE admired_users (
    admired_user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    query_message TEXT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for interactions (admired user to collector)
CREATE TABLE admired_queries (
    query_id INT AUTO_INCREMENT PRIMARY KEY,
    admired_user_id INT,
    collector_id INT,
    message TEXT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (admired_user_id) REFERENCES admired_users(admired_user_id) ON DELETE CASCADE,
    FOREIGN KEY (collector_id) REFERENCES collectors(collector_id) ON DELETE CASCADE
);

-- Optional: Table for external links to sell sets on eBay
CREATE TABLE set_sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    set_id INT,
    ebay_link VARCHAR(255),
    sale_status ENUM('Available', 'Sold') DEFAULT 'Available',
    FOREIGN KEY (set_id) REFERENCES sets(set_id) ON DELETE CASCADE
);

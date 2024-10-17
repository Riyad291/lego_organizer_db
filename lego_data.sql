-- Insert sample data into collectors
INSERT INTO collectors (username, email, password_hash, phone, is_admin) 
VALUES ('john_doe', 'john@example.com', 'hashpassword123', '1234567890', TRUE);

-- Insert sample LEGO sets
INSERT INTO sets (set_name, theme, release_date, set_image_url, description, price, collector_id)
VALUES 
('Millennium Falcon', 'Star Wars', '2020-05-01', 'url_to_image', 'The iconic ship from Star Wars.', 799.99, 1),
('Hogwarts Castle', 'Harry Potter', '2018-08-01', 'url_to_image', 'Detailed LEGO model of Hogwarts Castle.', 399.99, 1);

-- Insert sample admired user
INSERT INTO admired_users (name, email, query_message) 
VALUES ('Jane Doe', 'jane@example.com', 'I love the Millennium Falcon set! Can I get more info?');

-- Insert sample query from admired user to collector
INSERT INTO admired_queries (admired_user_id, collector_id, message)
VALUES (1, 1, 'I am interested in the Star Wars sets. Can we chat?');

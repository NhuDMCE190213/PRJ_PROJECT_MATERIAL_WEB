CREATE TABLE Users (
    username VARCHAR(50) PRIMARY KEY,
    full_name NVARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(20) -- 'admin' hoặc 'customer'
);

INSERT INTO Users (username, full_name, email, password, role)
VALUES 
('admin01', N'Admin', 'admin@example.com', 'admin123', 'admin'), -- 'tk admin'
('huy123', N'Huy Tiêu', 'huy@example.com', '123456', 'customer'); -- 'tk customer'

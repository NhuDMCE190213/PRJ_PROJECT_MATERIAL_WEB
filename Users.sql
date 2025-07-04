use vlxd
go

CREATE TABLE [User] (
    id INT IDENTITY(1,1) PRIMARY KEY,        
    username VARCHAR(50) NOT NULL UNIQUE,    -- Tên đăng nhập không được trùng
    fullName NVARCHAR(100) NOT NULL,          
    email VARCHAR(100) NOT NULL,              
    password VARCHAR(100) NOT NULL,           
    role VARCHAR(20) DEFAULT 'Customer'      -- Vai trò: 'Admin' hoặc 'Customer'
);

INSERT INTO Users (username, full_name, email, password, role)
VALUES 
('admin01', N'Admin', 'admin@example.com', 'admin123', 'admin'), -- 'tk admin'
('huy123', N'Huy Tiêu', 'huy@example.com', '123456', 'customer'); -- 'tk customer'




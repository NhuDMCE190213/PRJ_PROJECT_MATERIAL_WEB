USE vlxd;
GO


IF OBJECT_ID('order_items', 'U') IS NOT NULL
    DROP TABLE order_items;
    
IF OBJECT_ID('orders', 'U') IS NOT NULL
    DROP TABLE orders;

CREATE TABLE orders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATETIME DEFAULT GETDATE(),
    total_amount INT,
    status NVARCHAR(50) DEFAULT N'Đang xử lý',
    FOREIGN KEY (user_id) REFERENCES [User](id)
);

CREATE TABLE order_items (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_time INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

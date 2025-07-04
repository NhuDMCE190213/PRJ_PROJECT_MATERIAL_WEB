CREATE TABLE orders (
    id INT IDENTITY PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATETIME DEFAULT GETDATE(),
    total_amount INT,
    FOREIGN KEY (user_id) REFERENCES Users(username)
);

CREATE TABLE order_items (
    id INT IDENTITY PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_time INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

USE vlxd;
GO

-- Xóa bảng nếu đã tồn tại
IF OBJECT_ID('theReview', 'U') IS NOT NULL
    DROP TABLE theReview;
GO

-- Tạo bảng theReview
CREATE TABLE theReview (
    UserID INT NOT NULL,
    productID INT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 0 AND rating <= 5),
    review NVARCHAR(MAX),

    -- Khóa chính kết hợp
    PRIMARY KEY (UserID, productID),

    -- Khóa ngoại
    FOREIGN KEY (UserID) REFERENCES user_login(UserID),
    FOREIGN KEY (productID) REFERENCES products(id)
);

-- Giả sử bạn đã có user_login với UserID 1, 2, 3
-- Các productID chọn theo bảng ảnh: 1 (Gạch đỏ), 3 (Xi măng Hà Tiên), 4 (Cát vàng)

INSERT INTO dbo.theReview (UserID, productID, rating, review)
VALUES 
(1, 1, 5, N'Gạch đỏ rất chắc chắn, phù hợp xây nhà.'),
(2, 3, 4, N'Xi măng tốt, độ bám dính cao.'),
(3, 4, 3, N'Cát vàng hơi bụi, nhưng vẫn ổn.'),
(1, 2, 2, N'Gạch block dễ vỡ khi vận chuyển.'),
(2, 1, 5, N'Hài lòng với chất lượng gạch đỏ.');


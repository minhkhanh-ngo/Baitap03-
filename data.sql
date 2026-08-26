IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ShoppingServiceMVC')
BEGIN
    CREATE DATABASE ShoppingServiceMVC;
END;
GO

USE ShoppingServiceMVC;
GO

DROP TABLE IF EXISTS dbo.Category;
GO

CREATE TABLE dbo.Category (
    cate_id INT IDENTITY(1,1) NOT NULL,
    cate_name NVARCHAR(255) NOT NULL,
    icons NVARCHAR(255) NULL,
    status INT NULL,
    CONSTRAINT PK_Category PRIMARY KEY (cate_id)
);
GO

INSERT INTO dbo.Category (cate_name, icons, status) VALUES 
(N'Điện thoại', N'phone-icon.png', 1),
(N'Laptop', N'laptop-icon.png', 1),
(N'Phụ kiện', N'accessory-icon.png', 1);
GO

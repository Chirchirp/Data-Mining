--Creating the Database using SQL Server Management Studio(SSMS)

CREATE DATABASE Bookstore;
go


--Creating Tables
USE Bookstore;

CREATE TABLE Books(
	ISNB VARCHAR (255) PRIMARY KEY NOT NULL,
	Title VARCHAR (255) NOT NULL,
	Author VARCHAR (255) NOT NULL,
	Price FLOAT NOT NULL
);
GO

CREATE TABLE Customer (
    Customer_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Address VARCHAR(255)
);
GO

CREATE TABLE Orders (
	Order_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Customer_id INT NOT NULL,
    Customer VARCHAR(255) NOT NULL,
    Status VARCHAR(255)
	FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);
GO

CREATE TABLE Inventory(
    Inventory_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Order_id INT NOT NULL,
    Customer VARCHAR(255),
    Books VARCHAR(255),
    Status VARCHAR(255),
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);
GO


CREATE TABLE Payment_info (
    Card_number BIGINT PRIMARY KEY NOT NULL,
    Customer_id INT NOT NULL,
    Expiry_date DATE NOT NULL,
    CVV INT NOT NULL,
    Billing_add INT,
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);
GO

CREATE TABLE Shopping_Cart (
    Cart_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Customer_id INT NOT NULL,
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);
GO


CREATE TABLE Shopping_Cart_Items (
    Cart_id INT NOT NULL,
    ISBN VARCHAR(255) NOT NULL,
    PRIMARY KEY (Cart_id, ISBN),
    FOREIGN KEY (Cart_id) REFERENCES Shopping_Cart(Cart_id),
    FOREIGN KEY (ISBN) REFERENCES Books(ISNB)
);
GO

DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

-- Create tables

CREATE TABLE authors
(
    author_id  INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    first_name VARCHAR(20)                        NOT NULL,
    last_name  VARCHAR(20)                        NOT NULL,
    birth_date DATE                               NOT NULL
);

CREATE TABLE languages
(
    language_id   INTEGER AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(20) NOT NULL
);

CREATE TABLE book
(
    isbn             BIGINT(13) PRIMARY KEY NOT NULL CHECK ( LENGTH(isbn) = 13 AND isbn REGEXP '^[0-9]+$'),
    title            VARCHAR(100)           NOT NULL,
    price            DECIMAL(4, 2)          NOT NULL,
    publication_date TIMESTAMP,
    author_id        INTEGER,
    language_id      INTEGER,

    FOREIGN KEY (author_id) REFERENCES authors (author_id),
    FOREIGN KEY (language_id) REFERENCES languages (language_id)

);

CREATE TABLE bookstore
(
    store_id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name     VARCHAR(50)                        NOT NULL,
    city     VARCHAR(50)                        NOT NULL
);

CREATE TABLE inventory
(
    store_id INTEGER,
    isbn     BIGINT,
    amount   INTEGER,
    PRIMARY KEY (store_id, isbn),
    FOREIGN KEY (store_id) REFERENCES bookstore (store_id),
    FOREIGN KEY (isbn) REFERENCES book (isbn)
);

-- Inserts
INSERT INTO authors (first_name, last_name, birth_date)
VALUES ('David', 'Goggins', '1972-01-15'),
       ('Robert', 'Greeen', '1990-03-20'),
       ('Curtis', 'Jackson', '2001-09-10');


INSERT INTO languages (language_name)
VALUES ('Svenska'),
       ('Engelska'),
       ('Franska'),
       ('Spanska');

INSERT INTO book (isbn, title, price, publication_date, author_id, language_id)
VALUES ('1234567820111', 'Never Finished', 25.99, '2022-05-10', 1, 2),
       ('9076523256987', 'Mastery', 30.99, '2021-11-15', 2, 2),
       ('1224367891534', 'The 50th Law ', 12.99, '2021-09-11', 3, 1),
       ('1224363891238', 'Power ', 47.99, '2017-02-11', 2, 2);

INSERT INTO bookstore (name, city)
VALUES ('Spongs', 'Stockholm'),
       ('Adlibris', 'Göteborg'),
       ('Books n Stuff', 'Karlskoga');


INSERT INTO inventory (store_id, isbn, amount)
VALUES (1, '1234567820111', 50),
       (1, '9076523256987', 30),
       (2, '9076523256987', 30),
       (3, '9076523256987', 20),
       (3, '1224367891534', 30),
       (2, '1224367891534', 30);
;

-- Select View
CREATE VIEW bookstore_view AS
SELECT CONCAT(first_name, ' ', last_name) AS name,

       CONCAT(
               LEFT(CURRENT_DATE - birth_date, 2), 'år') AS age,

       CONCAT(
               (SELECT COUNT(DISTINCT title) FROM book WHERE author_id = authors.author_id), 'st') AS book_title_count,


       CONCAT(
               (SELECT SUM(inventory.amount * book.price) 'kr'
                FROM inventory
                         JOIN book ON inventory.isbn = book.isbn
                WHERE book.author_id = authors.author_id), 'kr') AS inventory_value
FROM authors;

SELECT * FROM bookstore_view










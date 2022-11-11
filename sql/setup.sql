-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS author CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS books_authors;

CREATE TABLE authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL,
    dob DATE,
    pod VARCHAR
);

CREATE TABLE books (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR NOT NULL,
    released INT NOT NULL
);

CREATE TABLE books_authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    authors_id INT,
    books_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (books_id) REFERENCES books(id)
);

INSERT INTO authors (name, dob, pob)

('James Allen','11-28-1864','England'),1
('Bell Hooks','9-25-1952','Kentucky'),2
('Paulo Coelho',' 8-24-1947','Brazil'),3
('Robert Greene','5-12-1959','LA'),4
('Bessel Van Der Kolk','7-16-1943','Germany');5

INSERT INTO books (title, released)

VALUES
    ('As a Man Thinketh', 1903),1
    ('As You Think', 1903),2
    (' All About Love', 2000),3
    ('Communion', 2002),4
    ('The Alchemist', 1998),5
    ('48 Laws of Power', 1998),6
    (' The Body Keeps Score', 2014);7

INSERT INTO books_authors (author_id, books_id)

VALUES
    (1,1),
    (1,2),
    (2,3),
    (2,4),
    (3,5),
    (4,6),
    (5,7);


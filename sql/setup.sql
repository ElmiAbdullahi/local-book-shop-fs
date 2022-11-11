-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS author CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS books_authors;

CREATE TABLE authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL,
    dob DATE,
    pob VARCHAR
);

CREATE TABLE books (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR NOT NULL,
    released INT NOT NULL
);

CREATE TABLE books_authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    authors_id BIGINT,
    books_id BIGINT,
    FOREIGN KEY (authors_id) REFERENCES authors(id),
    FOREIGN KEY (books_id) REFERENCES books(id)
);

INSERT INTO authors (name, dob, pob)

VALUES

('James Allen','11-28-1864','England'),
('Bell Hooks','9-25-1952','Kentucky'),
('Paulo Coelho',' 8-24-1947','Brazil'),
('Robert Greene','5-12-1959','LA'),
('Bessel Van Der Kolk','7-16-1943','Germany');

INSERT INTO books (title, released)

VALUES
    ('As a Man Thinketh', 1903),
    ('As You Think', 1903),
    (' All About Love', 2000),
    ('Communion', 2002),
    ('The Alchemist', 1998),
    ('48 Laws of Power', 1998),
    (' The Body Keeps Score', 2014);

INSERT INTO books_authors (authors_id, books_id)

VALUES
    (1,1),
    (1,2),
    (2,3),
    (2,4),
    (3,5),
    (4,6),
    (5,7);
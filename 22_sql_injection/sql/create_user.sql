CREATE TABLE
    IF NOT EXISTS users (
        id INTEGER PRIMARY KEY,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL CHECK (length(password) >= 10)
    );

INSERT INTO
    users (id, username, password)
VALUES
    (1,'alice', 'supersecret1'),
    (2,'bob_the_builder', 'construction99'),
    (3,'charlie123', 'verylongpass123'),
    (4,'diana_user', 'mypasswordislong'),
    (5,'erik_sweden', 'swedishpass123');

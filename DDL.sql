--DDL Data Definition Language
/* 
    주
    석
 */
DROP TABLE classmates;
CREATE TABLE classmates (
    name TEXT,
    age INT,
    address TEXT
);

CREATE TABLE tests(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

INSERT INTO tests VALUES(1, '홍길동'), (2, '김철수');
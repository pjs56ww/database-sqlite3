--DML, Date Manipulation Language
INSERT INTO classmates(name, age)
VALUES('홍길동', 23);

SELECT * FROM classmates;

INSERT INTO classmates
    VALUES('김철수', 30, '대전'), ('박나래', 31, '서울');

-- SQLite 는 PK 를 지정하지 않으면 rowid 를 자동으로 정의
SELECT rowid, * FROM classmates;

DROP TABLE classmates;

CREATE TABLE classmates(
    -- id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL,
    address TEXT NOT NULL
    );

-- classmates 에서 id, name column 만 가지고 오기
SELECT rowid, name FROM classmates;

-- classmates 에서 id, name column 값을 1개만 가지고 오기
SELECT rowid, name FROM classmates LIMIT 2;

-- classmates 에서 id, name column 값을 3번째에 있는 값 1개만 가지고 오기
SELECT rowid, name FROM classmates LIMIT 1 OFFSET 2;

-- classmates 에서 id, name column 값 중에 주소가 서울인 사람만 가져온다면?
SELECT rowid, name FROM classmates WHERE address='서울';

-- classmates 에서 age 값 전체를 중복없이 가져온다면?
SELECT DISTINCT age FROM classmates;

-- classmates 에서 id가 4인 data를 삭제하기
DELETE FROM classmates WHERE rowid=4;

CREATE TABLE bands (
    id INTEGER PRIMARY KEY,
    name TEXT,
    debut INTEGER
);

-- classmates 테이블에 id 가 3인 레코드를 수정하기
-- 이름을 홍길동으로, 주소를 제주도
UPDATE classmates
    SET name='홍길동', address='제주'
    WHERE rowid=3;

-- ctrl + shift + p, sqlite: open database

-- users에서 age가 30 이상인 사람만 가져온다면?
SELECT * FROM users WHERE age>=30;

-- users에서 age가 30 이상인 사람 성과 이름만 가져온다면?
SELECT first_name, last_name FROM users WHERE age>=30;

-- users에서 age가 30 이상이고 성이 김인사람 사람 성과 나이만 가져온다면?
SELECT last_name, age FROM users WHERE age>=30 AND last_name='김';

-- users 테이블의 레코드 총 개수는?
SELECT COUNT(*) FROM users;

-- 30살 이상인 사람들의 평균 나이는?
SELECT AVG(age) FROM users WHERE age>=30;

-- users에서 계좌 잔액(balance)이 가장 높은 사람과 액수는?
SELECT first_name, last_name, MAX(balance) FROM users;

-- users에서 30살 이상인 사람의 계좌 평균 잔액은?
SELECT AVG(balance) FROM users WHERE age>=30;

-- users에서 20대인 사람은?
SELECT * FROM users WHERE age LIKE '2_';

-- users에서 지역번호가 02 인 사람만?
SELECT * FROM users WHERE phone LIKE '02%';

-- users에서 이름이 '준'으로 끝나는 사람만?
SELECT * FROM users WHERE first_name LIKE '%준';

-- users에서 중간 번호가 5114 인 사람만?
SELECT * FROM users WHERE phone LIKE '%5114%';

-- users에서 나이순으로 오름차순 정렬하여 상위 10개만 뽑아보면?
SELECT * FROM users ORDER BY age ASC LIMIT 10;

-- 반대로 10개?
SELECT * FROM users ORDER BY age DESC LIMIT 10;

-- users에서 나이순, 성 순으로 오름차순 정렬하여 상위 10개만 뽑아보면?
SELECT * FROM users ORDER BY age, last_name ASC LIMIT 10;

-- users에서 계좌잔액순으로 내림차순 정렬하여 해당하는 사람의 성과 이름을 10개만 뽑아보면?
SELECT last_name, first_name FROM users ORDER BY balance DESC LIMIT 10;


-- Table 명 바꾸기
ALTER TABLE articles
RENAME TO news;


-- Column 추가
-- 1번 NOT NULL을 뺀다
ALTER TABLE news
ADD COLUMN create_at DATETIME;

INSERT INTO news
VALUES ('title', 'content', datetime('now', 'localtime'));

-- 2번 DEFAULT 값을 넣는다.
ALTER TABLE news
ADD COLUMN subtitle TEXT NOT NULL DEFAULT 1;

INSERT INTO news
VALUES ('title', 'content', datetime('now', 'localtime'), 'subtitle');


-- datatype 변경하는 법
ALTER TABLE users RENAME TO _users;

CREATE TABLE IF NOT EXISTS "users"(
"id" INTEGER PRIMARY KEY AUTOINCREMENT,
"first_name" TEXT,
"last_name" TEXT,
"age" INTEGER,
"country" TEXT,
"phone" TEXT,
"balance" INTEGER
);


INSERT INTO users SELECT * FROM users;

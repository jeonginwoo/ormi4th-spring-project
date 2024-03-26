DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS comment;

CREATE TABLE users
(
    user_id  BIGINT auto_increment,
    email    VARCHAR(30),
    password VARCHAR(30),
    nickname VARCHAR(30),
    auth_id  INTEGER,
    PRIMARY KEY (user_id)
);

CREATE TABLE board
(
    board_id    BIGINT auto_increment,
    type        VARCHAR(30),
    team        VARCHAR(30),
    title       VARCHAR(300),
    content     VARCHAR(3000),
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    user_id     INTEGER,
    PRIMARY KEY (board_id)
);

CREATE TABLE comment
(
    comment_id  BIGINT auto_increment,
    content     VARCHAR(1000),
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    user_id     INTEGER,
    board_id    INTEGER,
    PRIMARY KEY (comment_id)
);

INSERT INTO users (email, password, nickname) VALUES ('email1', 'password1', 'nickname1');
INSERT INTO users (email, password, nickname) VALUES ('email2', 'password2', 'nickname2');
INSERT INTO users (email, password, nickname) VALUES ('email3', 'password3', 'nickname3');

INSERT INTO board (type, team, title, content, created_at, modified_at, user_id) VALUES ('general', '팀1', '제목1', '내용1', now(), now(), 1);
INSERT INTO board (type, team, title, content, created_at, modified_at, user_id) VALUES ('general', '팀1', '제목2', '내용2', now(), now(), 2);
INSERT INTO board (type, team, title, content, created_at, modified_at, user_id) VALUES ('general', '팀2', '제목3', '내용3', now(), now(), 2);
INSERT INTO board (type, team, title, content, created_at, modified_at, user_id) VALUES ('general', '팀2', '제목4', '내용4', now(), now(), 2);
INSERT INTO board (type, team, title, content, created_at, modified_at, user_id) VALUES ('announcement', null, '제목5', '내용5', now(), now(), 3);

INSERT INTO comment (content, created_at, modified_at, board_id, user_id) VALUES ('게시글1에 유저2 댓글', now(), now(), 1, 2);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id) VALUES ('게시글1에 유저3 댓글', now(), now(), 1, 3);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id) VALUES ('게시글2에 유저1 댓글', now(), now(), 2, 1);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id) VALUES ('게시글2에 유저1 댓글2', now(), now(), 2, 1);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id) VALUES ('게시글2에 유저3 댓글', now(), now(), 2, 3);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id) VALUES ('게시글3에 유저1 댓글', now(), now(), 3, 1);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id) VALUES ('게시글3에 유저3 댓글', now(), now(), 3, 3);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id) VALUES ('게시글4에 유저1 댓글', now(), now(), 4, 1);

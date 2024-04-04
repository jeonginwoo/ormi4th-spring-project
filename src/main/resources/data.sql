DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS likes;

CREATE TABLE users
(
    user_id  BIGINT AUTO_INCREMENT,
    email    VARCHAR(30),
    password VARCHAR(100),
    nickname VARCHAR(30),
    auth_id  BIGINT,
    role     VARCHAR(20),
    PRIMARY KEY (user_id)
);

CREATE TABLE board
(
    board_id    BIGINT AUTO_INCREMENT,
    type        VARCHAR(30),
    team        VARCHAR(30),
    title       VARCHAR(300),
    content     VARCHAR(3000),
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    user_id     BIGINT,
    hits        BIGINT,
    PRIMARY KEY (board_id)
);

CREATE TABLE comment
(
    comment_id  BIGINT AUTO_INCREMENT,
    content     VARCHAR(1000),
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    user_id     BIGINT,
    board_id    BIGINT,
    parent_id   BIGINT,
    PRIMARY KEY (comment_id)
);

CREATE TABLE likes
(
    user_id         BIGINT,
    content_id      BIGINT,
    content_type    VARCHAR(10),
    PRIMARY KEY (user_id, content_id, content_type)
);

INSERT INTO users (email, password, nickname) VALUES ('email1', 'password1', 'nickname1');
INSERT INTO users (email, password, nickname) VALUES ('email2', 'password2', 'nickname2');
INSERT INTO users (email, password, nickname) VALUES ('email3', 'password3', 'nickname3');

INSERT INTO board (type, team, title, content, created_at, modified_at, user_id, hits) VALUES ('user', '팀1', '제목1', '내용1', now(), now(), 1, 0);
INSERT INTO board (type, team, title, content, created_at, modified_at, user_id, hits) VALUES ('user', '팀1', '제목2', '내용2', now(), now(), 2, 0);
INSERT INTO board (type, team, title, content, created_at, modified_at, user_id, hits) VALUES ('user', '팀2', '제목3', '내용3', now(), now(), 2, 0);
INSERT INTO board (type, team, title, content, created_at, modified_at, user_id, hits) VALUES ('user', '팀2', '제목4', '내용4', now(), now(), 2, 0);
INSERT INTO board (type, team, title, content, created_at, modified_at, user_id, hits) VALUES ('admin', null, '제목5', '내용5', now(), now(), 3, 0);

INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글1에 유저2 댓글', now(), now(), 1, 2, null);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글1에 유저3 댓글', now(), now(), 1, 3, null);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글2에 유저1 댓글', now(), now(), 2, 1, null);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글2에 유저1 댓글2', now(), now(), 2, 1, null);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글2에 유저3 댓글', now(), now(), 2, 3, null);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글3에 유저1 댓글', now(), now(), 3, 1, null);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글3에 유저3 댓글', now(), now(), 3, 3, null);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글4에 유저1 댓글', now(), now(), 4, 1, null);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글1 댓글1에 유저1 답글', now(), now(), 1, 1, 1);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글1 댓글1에 유저1 답글', now(), now(), 1, 1, 1);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글1 댓글1에 유저2 답글', now(), now(), 1, 2, 1);
INSERT INTO comment (content, created_at, modified_at, board_id, user_id, parent_id) VALUES ('게시글1 댓글1에 유저3 답글', now(), now(), 1, 3, 1);

INSERT INTO likes (user_id, content_id, content_type) VALUES (2, 2, 'board');
INSERT INTO likes (user_id, content_id, content_type) VALUES (2, 3, 'board');
INSERT INTO likes (user_id, content_id, content_type) VALUES (2, 4, 'board');
INSERT INTO likes (user_id, content_id, content_type) VALUES (3, 3, 'board');
INSERT INTO likes (user_id, content_id, content_type) VALUES (3, 4, 'board');
INSERT INTO likes (user_id, content_id, content_type) VALUES (3, 5, 'board');
INSERT INTO likes (user_id, content_id, content_type) VALUES (4, 1, 'comment');
INSERT INTO likes (user_id, content_id, content_type) VALUES (4, 2, 'comment');
INSERT INTO likes (user_id, content_id, content_type) VALUES (4, 9, 'comment');
INSERT INTO likes (user_id, content_id, content_type) VALUES (4, 10, 'comment');
INSERT INTO likes (user_id, content_id, content_type) VALUES (4, 12, 'comment');
INSERT INTO likes (user_id, content_id, content_type) VALUES (4, 1, 'board');

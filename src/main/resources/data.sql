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
    user_id      BIGINT,
    content_id   BIGINT,
    content_type VARCHAR(10),
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


DROP TABLE if exists team;
CREATE TABLE `team`
(
    `id`              bigint(11)   NOT NULL AUTO_INCREMENT,
    `name`            VARCHAR(20)  NULL,
    `location`        VARCHAR(10)  NULL,
    `stadium`         VARCHAR(30)  NULL,
    `foundation_year` YEAR         NULL,
    `emblem_path`     VARCHAR(200) NULL,
    `team_color`      VARCHAR(20)  NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE if exists player;
CREATE TABLE `player`
(
    `id`             bigint(11)   NOT NULL AUTO_INCREMENT,
    `team_id`        bigint(11)   NULL,
    `name`           VARCHAR(20)  NULL,
    `birth`          DATE         NULL,
    `position`       VARCHAR(10)  NULL,
    `hand`           VARCHAR(10)  NULL,
    `uniform_number` TINYINT      NULL,
    `photo_path`     VARCHAR(200) NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE if exists schedule;
CREATE TABLE `schedule`
(
    `id`           VARCHAR(30)  NOT NULL,
    `match_date`   TIMESTAMP    NULL,
    `away_team_id` bigint(11)   NULL,
    `home_team_id` bigint(11)   NULL,
    `stadium`      VARCHAR(30)  NULL,
    `broadcast`    VARCHAR(100) NULL,
    `status`       VARCHAR(20)  NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE if exists score_board;
CREATE TABLE `score_board`
(
    `id`         VARCHAR(30)  NOT NULL,
    `away_score` VARCHAR(100) NULL,
    `away_runs`  SMALLINT     NULL,
    `away_hits`  SMALLINT     NULL,
    `away_error` SMALLINT     NULL,
    `away_bb`    SMALLINT     NULL,
    `home_score` VARCHAR(100) NULL,
    `home_runs`  SMALLINT     NULL,
    `home_hits`  SMALLINT     NULL,
    `home_error` SMALLINT     NULL,
    `home_bb`    SMALLINT     NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE if exists batter_record;
CREATE TABLE `batter_record`
(
    `id`        VARCHAR(30) NOT NULL,
    `player_id` bigint(11)  NOT NULL,
    `team_id`   bigint(11)  NOT NULL,
    `position`  VARCHAR(10) NULL,
    `b_order`   INT,
    `ab`        INT         NULL,
    `hits`      INT         NULL,
    `doubles`   INT         NULL,
    `triples`   INT         NULL,
    `homeruns`  INT         NULL,
    `bb`        INT         NULL,
    `ibb`       INT         NULL,
    `hbp`       INT         NULL,
    `so`        INT         NULL,
    `sb`        INT         NULL,
    `cs`        INT         NULL,
    `runs`      INT         NULL,
    `rbi`       INT         NULL,
    `dp`        INT         NULL,
    `sc`        INT         NULL,
    `sf`        INT         NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE if exists pitcher_record;
CREATE TABLE `pitcher_record`
(
    `id`         VARCHAR(30) NOT NULL,
    `player_id`  bigint(11)  NOT NULL,
    `team_id`    bigint(11)  NOT NULL,
    `p_order`    INT,
    `starter`    INT         NULL DEFAULT 0,
    `decision`   VARCHAR(10) NULL,
    `innings`    DOUBLE      NULL DEFAULT 0,
    `runs`       INT         NULL DEFAULT 0,
    `earned_run` INT         NULL DEFAULT 0,
    `ab`         INT         NULL DEFAULT 0,
    `hits`       INT         NULL DEFAULT 0,
    `doubles`    INT         NULL DEFAULT 0,
    `triples`    INT         NULL DEFAULT 0,
    `homeruns`   INT         NULL DEFAULT 0,
    `bb`         INT         NULL DEFAULT 0,
    `ibb`        INT         NULL DEFAULT 0,
    `hbp`        INT         NULL DEFAULT 0,
    `so`         INT         NULL DEFAULT 0,
    `np`         INT         NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE if exists team_ranking;
CREATE TABLE `team_ranking`
(
    `id`      varchar(10) NOT NULL,
    `season`  year        not null,
    `rank`    tinyint     null,
    `team_id` bigint(11)  NOT NULL,
    `game`    smallint    null,
    `win`     smallint    null,
    `lose`    smallint    null,
    `draw`    smallint    null,

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE if exists batter_lineup;
CREATE TABLE `batter_lineup`
(
    `id`            VARCHAR(30) NOT NULL,
    `match_info_id` VARCHAR(30) NOT NULL,
    `order`         VARCHAR(10) NULL,
    `position_id`   int         NULL,
    `player_id`     bigint(11)  NOT NULL,
    `player_name`   VARCHAR(20) NOT NULL,
    `team_id`       bigint(11)  NOT NULL,

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE if exists pitcher_lineup;
CREATE TABLE `pitcher_lineup`
(
    `id`            VARCHAR(30) NOT NULL,
    `match_info_id` VARCHAR(30) NOT NULL,
    `order`         VARCHAR(10) NULL,
    `player_id`     bigint(11)  NOT NULL,
    `player_name`   VARCHAR(20) NOT NULL,
    `team_id`       bigint(11)  NOT NULL,
    `position_id`   int         NULL,

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE if exists position;
CREATE TABLE `position`
(
    `id`   tinyint     NOT NULL,
    `name` varchar(10) null,

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240323한화LG', '2024-03-23 14:00', '종료', '잠실', 'KBS2', '4', '2');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240323롯데SSG', '2024-03-23 14:00', '종료', '문학', 'SBS', '8', '10');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240323두산NC', '2024-03-23 14:00', '종료', '창원', '"KBS N SPORTS, SPOTV, SPOTV2"', '1', '9');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240323삼성KT', '2024-03-23 14:00', '종료', '수원', '"SBS SPORTS, MBC SPORTS+"', '3', '7');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240323키움KIA', '2024-03-23 14:00', '종료', '광주', 'MBC', '6', '5');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240324한화LG', '2024-03-24 14:00', '종료', '잠실', 'SBS SPORTS', '4', '2');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240324롯데SSG', '2024-03-24 14:00', '종료', '문학', 'KBS N SPORTS', '8', '10');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240324두산NC', '2024-03-24 14:00', '종료', '창원', 'SPOTV', '1', '9');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240324삼성KT', '2024-03-24 14:00', '종료', '수원', 'SPOTV2', '3', '7');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240324키움KIA', '2024-03-24 14:00', '우천 취소', '광주', 'MBC SPORTS+', '6', '5');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240326삼성LG', '2024-03-26 18:30', 'vs', '잠실', 'MBC SPORTS+', '3', '2');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240326한화SSG', '2024-03-26 18:30', 'vs', '문학', 'SBS SPORTS', '4', '10');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240326키움NC', '2024-03-26 18:30', 'vs', '창원', 'SPOTV2', '6', '9');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240326두산KT', '2024-03-26 18:30', 'vs', '수원', 'TVING', '1', '7');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240326롯데KIA', '2024-03-26 18:30', 'vs', '광주', 'SPOTV', '8', '5');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240327삼성LG', '2024-03-27 18:30', 'vs', '잠실', 'MBC SPORTS+', '3', '2');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240327한화SSG', '2024-03-27 18:30', 'vs', '문학', 'SBS SPORTS', '4', '10');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240327키움NC', '2024-03-27 18:30', 'vs', '창원', 'SPOTV2', '6', '9');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240327두산KT', '2024-03-27 18:30', 'vs', '수원', 'TVING', '1', '7');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240327롯데KIA', '2024-03-27 18:30', 'vs', '광주', 'SPOTV', '8', '5');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240328삼성LG', '2024-03-28 18:30', 'vs', '잠실', 'MBC SPORTS+', '3', '2');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240328한화SSG', '2024-03-28 18:30', 'vs', '문학', 'SBS SPORTS', '4', '10');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240328키움NC', '2024-03-28 18:30', 'vs', '창원', 'SPOTV2', '6', '9');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240328두산KT', '2024-03-28 18:30', 'vs', '수원', 'TVING', '1', '7');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240328롯데KIA', '2024-03-28 18:30', 'vs', '광주', 'SPOTV', '8', '5');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240329KIA두산', '2024-03-29 18:30', 'vs', '잠실', 'SPOTV2', '5', '1');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240329NC롯데', '2024-03-29 18:30', 'vs', '사직', 'SBS SPORTS', '9', '8');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240329SSG삼성', '2024-03-29 18:30', 'vs', '대구', 'MBC SPORTS+', '10', '3');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240329LG키움', '2024-03-29 18:30', 'vs', '고척', 'TVING', '2', '6');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240329KT한화', '2024-03-29 18:30', 'vs', '대전', 'SPOTV', '7', '4');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240330KT한화', '2024-03-30 14:00', 'vs', '대전', 'SBS', '7', '4');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240330KIA두산', '2024-03-30 17:00', 'vs', '잠실', 'SPOTV2', '5', '1');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240330NC롯데', '2024-03-30 17:00', 'vs', '사직', 'SBS SPORTS', '9', '8');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240330SSG삼성', '2024-03-30 17:00', 'vs', '대구', '"MBC SPORTS+, KBS N SPORTS"', '10', '3');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240330LG키움', '2024-03-30 17:00', 'vs', '고척', 'SPOTV', '2', '6');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240331KIA두산', '2024-03-31 14:00', 'vs', '잠실', 'SPOTV2', '5', '1');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240331NC롯데', '2024-03-31 14:00', 'vs', '사직', 'SBS SPORTS', '9', '8');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240331SSG삼성', '2024-03-31 14:00', 'vs', '대구', 'MBC SPORTS+', '10', '3');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240331LG키움', '2024-03-31 14:00', 'vs', '고척', 'TVING', '2', '6');
INSERT INTO `schedule` (`id`, `match_date`, `status`, `stadium`, `broadcast`, `away_team_id`, `home_team_id`) VALUES ('20240331KT한화', '2024-03-31 14:00', 'vs', '대전', 'SPOTV', '7', '4');


INSERT INTO `position` (`id`, `name`)
VALUES (1, '투수'),
       (2, '포수'),
       (3, '1루수'),
       (4, '2루수'),
       (5, '3루수'),
       (6, '유격수'),
       (7, '좌익수'),
       (8, '중견수'),
       (9, '우익수'),
       (10, '지명타자'),
       (11, '대타');


INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('1', '10', '최지훈', '1997-07-23', '외야수', '우투좌타', '54', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('2', '10', '한유섬', '1989-08-09', '외야수', '우투좌타', '35', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('3', '10', '박성한', '1998-03-30', '내야수', '우투좌타', '2', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('4', '10', '김성현', '1987-03-09', '내야수', '우투우타', '6', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('5', '10', '조형우', '2002-04-04', '포수', '우투우타', '20', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('6', '10', '최정', '1987-02-28', '내야수', '우투우타', '14', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('7', '10', '에레디아', '1991-01-31', '외야수', '좌투우타', '27', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('8', '10', '이지영', '1986-02-27', '포수', '우투우타', '59', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('9', '10', '안상현', '1997-01-27', '내야수', '우투우타', '10', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('10', '10', '추신수', '1982-07-13', '외야수', '좌투좌타', '17', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('11', '10', '고명준', '2002-07-08', '내야수', '우투우타', '18', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('12', '10', '박지환', '2005-07-12', '내야수', '우투우타', '93', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('13', '10', '하재훈', '1990-10-29', '외야수', '우투우타', '13', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('14', '10', '최경모', '1996-06-17', '내야수', '우투우타', '52', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('15', '10', '오태곤', '1991-11-18', '내야수', '우투우타', '37', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('16', '10', '전의산', '2000-11-25', '내야수', '우투좌타', '56', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('17', '10', '김광현', '1988-07-22', '투수', '좌투좌타', '29', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('18', '10', '오원석', '2001-04-23', '투수', '좌투좌타', '47', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('19', '10', '고효준', '1983-02-08', '투수', '좌투좌타', '15', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('20', '10', '노경은', '1984-03-11', '투수', '우투우타', '38', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('21', '10', '문승원', '1989-11-28', '투수', '우투우타', '42', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('22', '10', '엘리아스', '1988-08-01', '투수', '좌투좌타', '55', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('23', '10', '이로운', '2004-09-11', '투수', '우투우타', '92', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('24', '9', '권희동', '1990-12-30', '외야수', '우투우타', '36', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('25', '9', '손아섭', '1988-03-18', '외야수', '우투좌타', '31', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('26', '9', '데이비슨', '1991-03-26', '내야수', '우투우타', '24', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('27', '9', '최정원', '2000-06-24', '내야수', '우투좌타', '14', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('28', '9', '박영빈', '1997-07-16', '외야수', '우투좌타', '9', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('29', '9', '천재환', '1994-04-01', '외야수', '우투우타', '23', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('30', '9', '박세혁', '1990-01-09', '포수', '우투좌타', '10', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('31', '9', '박민우', '1993-02-06', '내야수', '우투좌타', '2', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('32', '9', '김형준', '1999-11-02', '포수', '우투우타', '25', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('33', '9', '김주원', '2002-07-30', '내야수', '우투양타', '7', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('34', '9', '서호철', '1996-10-16', '내야수', '우투우타', '5', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('35', '9', '박건우', '1990-09-08', '외야수', '우투우타', '37', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('36', '9', '김성욱', '1993-05-01', '외야수', '우투우타', '38', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('37', '9', '하트', '1992-11-23', '투수', '좌투좌타', '30', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('38', '9', '임정호', '1990-04-16', '투수', '좌투좌타', '13', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('39', '9', '류진욱', '1996-10-10', '투수', '우투우타', '41', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('40', '9', '이용찬', '1989-01-02', '투수', '우투우타', '22', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('41', '9', '신민혁', '1999-02-04', '투수', '우투우타', '53', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('42', '9', '한재승', '2001-11-21', '투수', '우투우타', '55', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('43', '9', '서의태', '1997-09-05', '투수', '좌투좌타', '58', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('44', '9', '이준호', '2000-03-27', '투수', '우투우타', '27', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('45', '9', '김재열', '1996-01-02', '투수', '우투우타', '32', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('46', '2', '오지환', '1990-03-12', '내야수', '우투좌타', '10', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('47', '2', '신민재', '1996-01-21', '외야수', '우투좌타', '4', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('48', '2', '문성주', '1997-02-20', '외야수', '좌투좌타', '8', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('49', '2', '홍창기', '1993-11-21', '외야수', '우투좌타', '51', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('50', '2', '박해민', '1990-02-24', '외야수', '우투좌타', '17', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('51', '2', '구본혁', '1997-01-11', '내야수', '우투우타', '6', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('52', '2', '최승민', '1996-07-01', '외야수', '우투좌타', '62', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('53', '2', '박동원', '1990-04-07', '포수', '우투우타', '27', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('54', '2', '허도환', '1984-07-31', '포수', '우투우타', '30', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('55', '2', '김현종', '2004-08-04', '외야수', '우투우타', '66', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('56', '2', '김현수', '1988-01-12', '외야수', '우투좌타', '22', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('57', '2', '오스틴', '1993-10-14', '내야수', '우투우타', '23', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('58', '2', '문보경', '2000-07-19', '내야수', '우투좌타', '2', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('59', '2', '엔스', '1991-05-16', '투수', '좌투좌타', '34', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('60', '2', '김진성', '1985-03-07', '투수', '우투우타', '42', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('61', '2', '박명근', '2004-03-27', '투수', '우언우타', '39', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('62', '2', '이우찬', '1992-08-04', '투수', '좌투좌타', '21', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('63', '2', '임찬규', '1992-11-20', '투수', '우투우타', '1', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('64', '2', '백승현', '1995-05-26', '투수', '우투우타', '18', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('65', '2', '유영찬', '1997-03-07', '투수', '우투우타', '54', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('66', '2', '김유영', '1994-05-02', '투수', '좌투좌타', '0', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('67', '7', '천성호', '1997-10-30', '내야수', '우투좌타', '14', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('68', '7', '박경수', '1984-03-31', '내야수', '우투우타', '6', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('69', '7', '로하스', '1990-05-24', '외야수', '우투양타', '3', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('70', '7', '신본기', '1989-03-21', '내야수', '우투우타', '56', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('71', '7', '김준태', '1994-07-31', '포수', '우투좌타', '44', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('72', '7', '문상철', '1991-04-06', '내야수', '우투우타', '24', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('73', '7', '황재균', '1987-07-28', '내야수', '우투우타', '10', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('74', '7', '강백호', '1999-07-29', '내야수', '우투좌타', '50', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('75', '7', '배정대', '1995-06-12', '외야수', '우투우타', '27', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('76', '7', '안치영', '1998-05-29', '내야수', '우투좌타', '8', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('77', '7', '박병호', '1986-07-10', '내야수', '우투우타', '52', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('78', '7', '장성우', '1990-01-17', '포수', '우투우타', '22', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('79', '7', '김민혁', '1995-11-21', '외야수', '우투좌타', '53', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('80', '7', '정준영', '2004-01-26', '외야수', '좌투좌타', '58', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('81', '7', '김상수', '1990-03-23', '내야수', '우투우타', '7', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('82', '7', '쿠에바스', '1990-10-14', '투수', '우투우타', '32', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('83', '7', '우규민', '1985-01-21', '투수', '우언우타', '21', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('84', '7', '이상동', '1995-11-24', '투수', '우투우타', '37', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('85', '7', '주권', '1995-05-31', '투수', '우투우타', '38', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('86', '7', '손동현', '2001-01-23', '투수', '우투좌타', '41', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('87', '7', '박영현', '2003-10-11', '투수', '우투우타', '60', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('88', '7', '강건', '2004-07-12', '투수', '우투우타', '99', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('89', '7', '엄상백', '1996-10-04', '투수', '우언우타', '18', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('90', '7', '김민수', '1992-07-24', '투수', '우투우타', '26', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('91', '7', '성재헌', '1997-12-22', '투수', '좌투좌타', '95', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('92', '7', '김영현', '2002-08-18', '투수', '우투우타', '48', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('93', '5', '최형우', '1983-12-16', '외야수', '우투좌타', '34', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('94', '5', '김선빈', '1989-12-18', '내야수', '우투우타', '3', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('95', '5', '김태군', '1989-12-30', '포수', '우투우타', '42', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('96', '5', '소크라테스', '1992-09-06', '외야수', '좌투좌타', '30', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('97', '5', '최원준', '1997-03-23', '외야수', '우투좌타', '16', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('98', '5', '박찬호', '1995-06-05', '내야수', '우투우타', '1', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('99', '5', '김호령', '1992-04-30', '외야수', '우투우타', '27', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('100', '5', '한승택', '1994-06-21', '포수', '우투우타', '26', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('101', '5', '이창진', '1991-03-04', '외야수', '우투우타', '8', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('102', '5', '이우성', '1994-07-17', '외야수', '우투우타', '25', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('103', '5', '김도영', '2003-10-02', '내야수', '우투우타', '5', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('104', '5', '황대인', '1996-02-10', '내야수', '우투우타', '52', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('105', '5', '정해영', '2001-08-23', '투수', '우투우타', '62', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('106', '5', '크로우', '1994-09-09', '투수', '우투우타', '12', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('107', '5', '곽도규', '2004-04-12', '투수', '좌투좌타', '0', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('108', '5', '전상현', '1996-04-18', '투수', '우투우타', '51', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('109', '5', '최지민', '2003-09-10', '투수', '좌투좌타', '39', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('110', '4', '채은성', '1990-02-06', '외야수', '우투우타', '22', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('111', '4', '하주석', '1994-02-25', '내야수', '우투좌타', '16', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('112', '4', '페라자', '1998-11-10', '외야수', '우투양타', '30', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('113', '4', '최인호', '2000-01-30', '외야수', '우투좌타', '41', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('114', '4', '이원석', '1999-03-31', '외야수', '우투우타', '50', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('115', '4', '김태연', '1997-06-10', '내야수', '우투우타', '25', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('116', '4', '이도윤', '1996-10-07', '내야수', '우투좌타', '7', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('117', '4', '김강민', '1982-09-13', '외야수', '우투우타', '9', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('118', '4', '임종찬', '2001-09-28', '외야수', '우투좌타', '24', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('119', '4', '정은원', '2000-01-17', '내야수', '우투좌타', '43', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('120', '4', '최재훈', '1989-08-27', '포수', '우투우타', '13', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('121', '4', '노시환', '2000-12-03', '내야수', '우투우타', '8', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('122', '4', '이재원', '1988-02-24', '포수', '우투우타', '32', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('123', '4', '안치홍', '1990-07-02', '내야수', '우투우타', '3', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('124', '4', '문현빈', '2004-04-20', '외야수', '우투좌타', '64', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('125', '4', '류현진', '1987-03-25', '투수', '좌투우타', '99', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('126', '4', '이태양', '1990-07-03', '투수', '우투우타', '46', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('127', '4', '김기중', '2002-11-16', '투수', '좌투좌타', '15', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('128', '4', '한승혁', '1993-01-03', '투수', '우투우타', '26', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('129', '4', '이민우', '1993-02-09', '투수', '우투우타', '27', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('130', '4', '한승주', '2001-03-17', '투수', '우투우타', '59', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('131', '4', '페냐', '1990-02-25', '투수', '우투우타', '20', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('132', '4', '주현상', '1992-08-10', '투수', '우투우타', '66', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('133', '4', '김범수', '1995-10-03', '투수', '좌투좌타', '47', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('134', '4', '박상원', '1994-09-09', '투수', '우투우타', '58', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('135', '6', '최주환', '1988-02-28', '내야수', '우투좌타', '53', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('136', '6', '고영우', '2001-06-21', '내야수', '우투우타', '44', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('137', '6', '이형종', '1989-06-07', '외야수', '우투우타', '36', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('138', '6', '변상권', '1997-04-04', '외야수', '우투좌타', '56', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('139', '6', '주성원', '2000-08-30', '외야수', '우투우타', '25', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('140', '6', '김동헌', '2004-07-15', '포수', '우투우타', '22', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('141', '6', '송성문', '1996-08-29', '내야수', '우투좌타', '24', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('142', '6', '김휘집', '2002-01-01', '내야수', '우투우타', '33', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('143', '6', '김혜성', '1999-01-27', '내야수', '우투좌타', '3', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('144', '6', '이재상', '2005-04-17', '내야수', '우투우타', '5', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('145', '6', '임지열', '1995-08-22', '내야수', '우투우타', '29', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('146', '6', '도슨', '1995-05-19', '외야수', '우투좌타', '27', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('147', '6', '후라도', '1996-01-30', '투수', '우투우타', '75', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('148', '6', '손현기', '2005-10-22', '투수', '좌투좌타', '63', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('149', '6', '전준표', '2005-05-07', '투수', '우투우타', '62', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('150', '6', '김연주', '2004-02-27', '투수', '우투우타', '68', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('151', '3', '김지찬', '2001-03-08', '내야수', '우투좌타', '58', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('152', '3', '강민호', '1985-08-18', '포수', '우투우타', '47', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('153', '3', '오재일', '1986-10-29', '내야수', '좌투좌타', '44', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('154', '3', '김재성', '1996-10-30', '포수', '우투좌타', '2', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('155', '3', '김현준', '2002-10-11', '외야수', '좌투좌타', '41', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('156', '3', '김성윤', '1999-02-02', '외야수', '좌투좌타', '39', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('157', '3', '전병우', '1992-10-24', '내야수', '우투우타', '34', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('158', '3', '류지혁', '1994-01-13', '내야수', '우투좌타', '16', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('159', '3', '김영웅', '2003-08-24', '내야수', '우투좌타', '30', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('160', '3', '김재혁', '1999-12-26', '외야수', '우투우타', '8', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('161', '3', '안주형', '1993-08-14', '내야수', '우투좌타', '14', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('162', '3', '구자욱', '1993-02-12', '외야수', '우투좌타', '5', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('163', '3', '맥키넌', '1994-12-15', '내야수', '우투우타', '24', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('164', '3', '이성규', '1993-08-03', '외야수', '우투우타', '13', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('165', '3', '강한울', '1991-09-12', '내야수', '우투좌타', '6', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('166', '3', '김헌곤', '1988-11-09', '외야수', '우투우타', '32', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('167', '3', '레예스', '1996-11-02', '투수', '우투우타', '43', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('168', '3', '코너', '1996-01-24', '투수', '우투우타', '52', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('169', '3', '임창민', '1985-08-25', '투수', '우투우타', '45', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('170', '3', '김재윤', '1990-09-16', '투수', '우투우타', '62', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('171', '3', '오승환', '1982-07-15', '투수', '우투우타', '21', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('172', '3', '김태훈', '1992-03-02', '투수', '우투우타', '27', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('173', '3', '이재익', '1994-03-18', '투수', '좌투좌타', '1', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('174', '3', '장필준', '1988-04-08', '투수', '우투우타', '26', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('175', '3', '김대우', '1988-11-21', '투수', '우언우타', '17', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('176', '8', '고승민', '2000-08-11', '외야수', '우투좌타', '65', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('177', '8', '레이예스', '1994-10-05', '외야수', '우투양타', '29', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('178', '8', '윤동희', '2003-09-18', '외야수', '우투우타', '91', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('179', '8', '김민성', '1988-12-17', '내야수', '우투우타', '16', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('180', '8', '정보근', '1999-08-31', '포수', '우투우타', '42', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('181', '8', '황성빈', '1997-12-19', '외야수', '우투좌타', '0', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('182', '8', '최항', '1994-01-03', '내야수', '우투좌타', '14', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('183', '8', '장두성', '1999-09-16', '외야수', '우투좌타', '13', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('184', '8', '박승욱', '1992-12-04', '내야수', '우투좌타', '53', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('185', '8', '노진혁', '1989-07-15', '내야수', '우투좌타', '52', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('186', '8', '정훈', '1987-07-18', '내야수', '우투우타', '9', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('187', '8', '이주찬', '1998-09-21', '내야수', '우투우타', '63', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('188', '8', '오선진', '1989-07-07', '내야수', '우투우타', '6', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('189', '8', '전준우', '1986-02-25', '외야수', '우투우타', '8', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('190', '8', '나승엽', '2002-02-15', '내야수', '우투좌타', '51', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('191', '8', '유강남', '1992-07-15', '포수', '우투우타', '27', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('192', '8', '윌커슨', '1989-05-24', '투수', '우투우타', '46', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('193', '8', '최준용', '2001-10-10', '투수', '우투우타', '18', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('194', '8', '임준섭', '1989-07-16', '투수', '좌투좌타', '57', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('195', '8', '김상수', '1988-01-02', '투수', '우투우타', '24', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('196', '8', '최이준', '1999-04-10', '투수', '우투우타', '49', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('197', '8', '박세웅', '1995-11-30', '투수', '우투우타', '21', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('198', '8', '구승민', '1990-06-12', '투수', '우투우타', '22', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('199', '8', '박진', '1999-04-02', '투수', '우투우타', '44', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('200', '8', '우강훈', '2002-10-03', '투수', '우언우타', '64', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('201', '8', '전미르', '2005-08-15', '투수', '우투우타', '61', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('202', '8', '김원중', '1993-06-14', '투수', '우투좌타', '34', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('203', '1', '정수빈', '1990-10-07', '외야수', '좌투좌타', '31', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('204', '1', '허경민', '1990-08-26', '내야수', '우투우타', '13', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('205', '1', '양의지', '1987-06-05', '포수', '우투우타', '25', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('206', '1', '박준영', '1997-08-05', '내야수', '우투우타', '9', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('207', '1', '김민혁', '1996-05-03', '내야수', '우투우타', '10', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('208', '1', '이유찬', '1998-08-05', '내야수', '우투우타', '7', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('209', '1', '강승호', '1994-02-09', '내야수', '우투우타', '23', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('210', '1', '김대한', '2000-12-06', '외야수', '우투우타', '37', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('211', '1', '박계범', '1996-01-11', '내야수', '우투우타', '14', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('212', '1', '김인태', '1994-07-03', '외야수', '좌투좌타', '33', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('213', '1', '라모스', '1992-04-15', '외야수', '우투양타', '4', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('214', '1', '조수행', '1993-08-30', '외야수', '우투좌타', '51', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('215', '1', '양석환', '1991-07-15', '내야수', '우투우타', '53', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('216', '1', '김재환', '1988-09-22', '외야수', '우투좌타', '32', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('217', '1', '알칸타라', '1992-12-04', '투수', '우투우타', '43', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('218', '1', '김택연', '2005-06-03', '투수', '우투우타', '63', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('219', '1', '김명신', '1993-11-29', '투수', '우투우타', '46', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('220', '1', '박치국', '1998-03-10', '투수', '우언우타', '1', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('221', '1', '정철원', '1999-03-27', '투수', '우투우타', '65', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('222', '1', '브랜든', '1994-06-03', '투수', '좌투좌타', '48', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('223', '1', '최지강', '2001-07-23', '투수', '우투좌타', '42', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('224', '1', '이병헌', '2003-06-04', '투수', '좌투좌타', '29', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('225', '1', '박정수', '1996-01-29', '투수', '우언좌타', '12', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('226', '2', '켈리', '1989-10-04', '투수', '우투우타', '3', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('227', '3', '백정현', '1987-07-13', '투수', '좌투좌타', '29', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('228', '4', '김민우', '1995-07-25', '투수', '우투우타', '53', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('229', '10', '더거', '1995-07-03', '투수', '우투우타', '33', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('230', '10', '한두솔', '1997-01-15', '투수', '좌투좌타', '34', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('231', '10', '최민준', '1999-06-11', '투수', '우투우타', '67', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('232', '10', '조병현', '2002-05-08', '투수', '우투우타', '19', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('233', '6', '박수종', '1999-02-25', '외야수', '우투우타', '14', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('234', '6', '김윤하', '2005-03-07', '투수', '우투우타', '19', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('235', '6', '김재현', '1993-03-18', '포수', '우투우타', '32', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('236', '9', '도태훈', '1993-03-18', '내야수', '우투좌타', '16', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('237', '9', '김한별', '2001-01-18', '내야수', '우투우타', '68', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('238', '6', '헤이수스', '1996-12-10', '투수', '좌투좌타', '54', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('239', '6', '김동혁', '2001-12-27', '투수', '우언우타', '60', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('240', '9', '카스타노', '1994-09-17', '투수', '좌투좌타', '20', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('241', '9', '최성영', '1997-04-28', '투수', '좌투좌타', '26', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('242', '1', '곽빈', '1999-05-28', '투수', '우투우타', '47', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('243', '1', '이영하', '1997-11-01', '투수', '우투우타', '50', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('244', '7', '벤자민', '1993-07-26', '투수', '좌투좌타', '43', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('245', '5', '서건창', '1989-08-22', '내야수', '우투좌타', '58', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('246', '8', '반즈', '1995-10-01', '투수', '좌투좌타', '28', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('247', '5', '양현종', '1988-03-01', '투수', '좌투좌타', '54', '');
INSERT INTO `player` (`id`, `team_id`, `name`, `birth`, `position`, `hand`, `uniform_number`, `photo_path`) VALUES ('248', '5', '임기영', '1993-04-16', '투수', '우언우타', '17', '');


INSERT INTO `pitcher_record` (`player_id`, `id`, `team_id`, `p_order`, `innings`, `starter`, `runs`, `earned_run`, `ab`, `hits`, `doubles`, `triples`, `homeruns`, `bb`, `ibb`, `hbp`, `so`, `np`, `decision`)
VALUES ('217', '20240323두산1', '1', '1', '6', '1', '0', '0', '20', '2', '0', '1', '0', '0', '0', '0', '4', '66', ''),
       ('218', '20240323두산2', '1', '2', '1', '0', '2', '2', '5', '2', '1', '0', '0', '2', '0', '1', '1', '31', ''),
       ('219', '20240323두산3', '1', '3', '0', '0', '1', '1', '2', '1', '0', '0', '1', '0', '0', '0', '0', '12', ''),
       ('220', '20240323두산4', '1', '4', '1', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '2', '13', ''),
       ('221', '20240323두산5', '1', '5', '0.66', '0', '1', '1', '3', '1', '0', '0', '0', '1', '0', '2', '2', '24', 'L'),
       ('192', '20240323롯데1', '8', '1', '5', '1', '4', '4', '20', '6', '1', '0', '2', '1', '0', '1', '8', '85', 'L'),
       ('193', '20240323롯데2', '8', '2', '1.33', '0', '0', '0', '5', '1', '0', '0', '0', '0', '0', '0', '0', '16', ''),
       ('194', '20240323롯데3', '8', '3', '0', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '7', ''),
       ('195', '20240323롯데4', '8', '4', '1', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '0', '17', ''),
       ('196', '20240323롯데5', '8', '5', '0.66', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0', '0', '0', '9', ''),
       ('168', '20240323삼성1', '3', '1', '6', '1', '2', '1', '22', '4', '0', '0', '1', '0', '0', '1', '8', '87', ''),
       ('169', '20240323삼성2', '3', '2', '1', '0', '0', '0', '3', '0', '0', '0', '0', '1', '0', '0', '2', '20', ''),
       ('170', '20240323삼성3', '3', '3', '1', '0', '0', '0', '2', '0', '0', '0', '0', '3', '1', '0', '0', '19', ''),
       ('171', '20240323삼성4', '3', '4', '2', '0', '0', '0', '7', '1', '0', '0', '0', '0', '0', '0', '1', '19', 'W'),
       ('147', '20240323키움1', '6', '1', '4', '1', '7', '7', '22', '10', '2', '0', '1', '2', '0', '0', '1', '91', 'L'),
       ('148', '20240323키움2', '6', '2', '1', '0', '0', '0', '4', '1', '1', '0', '0', '0', '0', '0', '0', '19', ''),
       ('149', '20240323키움3', '6', '3', '2', '0', '0', '0', '7', '1', '0', '0', '0', '2', '0', '0', '0', '44', ''),
       ('150', '20240323키움4', '6', '4', '1', '0', '0', '0', '4', '1', '1', '0', '0', '1', '0', '0', '0', '16', ''),
       ('125', '20240323한화1', '4', '1', '3.66', '1', '5', '2', '18', '6', '0', '0', '0', '3', '0', '0', '0', '86', 'L'),
       ('126', '20240323한화2', '4', '2', '1.33', '0', '1', '1', '5', '1', '0', '0', '0', '0', '0', '0', '0', '16', ''),
       ('127', '20240323한화3', '4', '3', '0.66', '0', '0', '0', '3', '1', '0', '0', '0', '1', '0', '0', '1', '16', ''),
       ('128', '20240323한화4', '4', '4', '0.33', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '4', ''),
       ('129', '20240323한화5', '4', '5', '0.66', '0', '1', '1', '4', '2', '0', '0', '0', '1', '0', '0', '0', '22', ''),
       ('130', '20240323한화6', '4', '6', '1.33', '0', '1', '1', '4', '1', '0', '0', '0', '1', '0', '1', '0', '22', ''),
       ('106', '20240323KIA1', '5', '1', '5.66', '1', '5', '4', '23', '6', '0', '0', '1', '1', '0', '0', '5', '84', 'W'),
       ('107', '20240323KIA2', '5', '2', '0.33', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '6', 'HD'),
       ('108', '20240323KIA3', '5', '3', '1', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '1', '15', 'HD'),
       ('109', '20240323KIA4', '5', '4', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '9', 'HD'),
       ('105', '20240323KIA5', '5', '5', '1', '0', '0', '0', '3', '0', '0', '0', '0', '1', '0', '0', '1', '18', 'SV'),
       ('82', '20240323KT1', '7', '1', '5', '1', '1', '1', '19', '3', '0', '0', '1', '2', '0', '0', '7', '75', ''),
       ('83', '20240323KT2', '7', '2', '0.66', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '7', 'HD'),
       ('84', '20240323KT3', '7', '3', '0.33', '0', '1', '1', '2', '1', '0', '0', '0', '0', '0', '0', '0', '10', ''),
       ('85', '20240323KT4', '7', '4', '1', '0', '0', '0', '3', '1', '0', '0', '0', '0', '0', '0', '1', '14', ''),
       ('86', '20240323KT5', '7', '5', '1', '0', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '0', '18', ''),
       ('87', '20240323KT6', '7', '6', '1.33', '0', '4', '4', '7', '3', '0', '0', '0', '2', '1', '0', '1', '23', 'L'),
       ('88', '20240323KT7', '7', '7', '0.66', '0', '0', '0', '3', '1', '0', '0', '0', '1', '0', '0', '2', '18', ''),
       ('59', '20240323LG1', '2', '1', '6', '1', '2', '2', '23', '7', '2', '0', '0', '2', '0', '1', '4', '89', 'W'),
       ('60', '20240323LG2', '2', '2', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '2', '9', ''),
       ('61', '20240323LG3', '2', '3', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '7', ''),
       ('62', '20240323LG4', '2', '4', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '15', ''),
       ('37', '20240323NC1', '9', '1', '7', '1', '2', '2', '26', '5', '1', '1', '0', '0', '0', '0', '5', '91', ''),
       ('38', '20240323NC2', '9', '2', '0.66', '0', '1', '1', '2', '1', '0', '0', '0', '0', '0', '0', '0', '12', ''),
       ('39', '20240323NC3', '9', '3', '1', '0', '0', '0', '5', '2', '1', '0', '0', '0', '0', '0', '1', '24', ''),
       ('40', '20240323NC4', '9', '4', '0.33', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'W'),
       ('17', '20240323SSG1', '10', '1', '5', '1', '3', '3', '22', '6', '0', '0', '1', '2', '0', '0', '6', '96', 'W'),
       ('18', '20240323SSG2', '10', '2', '1', '0', '0', '0', '4', '1', '0', '0', '0', '2', '0', '0', '1', '26', 'HD'),
       ('19', '20240323SSG3', '10', '3', '0.66', '0', '0', '0', '3', '1', '0', '0', '0', '1', '0', '0', '2', '19', 'HD'),
       ('20', '20240323SSG4', '10', '4', '0.66', '0', '0', '0', '3', '1', '0', '0', '0', '1', '0', '0', '2', '19', 'HD'),
       ('21', '20240323SSG5', '10', '5', '1', '0', '0', '0', '2', '0', '0', '0', '0', '1', '0', '0', '0', '10', 'SV'),
       ('222', '20240324두산1', '1', '1', '5', '1', '0', '0', '17', '2', '0', '0', '0', '1', '0', '1', '4', '72', 'W'),
       ('223', '20240324두산2', '1', '2', '1', '0', '0', '0', '4', '1', '1', '0', '0', '0', '0', '1', '1', '23', 'HD'),
       ('220', '20240324두산3', '1', '3', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '6', ''),
       ('224', '20240324두산4', '1', '4', '0.66', '0', '1', '1', '3', '1', '0', '0', '0', '0', '0', '0', '1', '8', ''),
       ('225', '20240324두산5', '1', '5', '0', '0', '2', '1', '2', '2', '1', '0', '0', '0', '0', '0', '0', '5', ''),
       ('219', '20240324두산6', '1', '6', '0.33', '0', '0', '0', '2', '1', '0', '0', '0', '0', '0', '0', '1', '9', 'HD'),
       ('221', '20240324두산7', '1', '7', '1', '0', '0', '0', '3', '0', '0', '0', '0', '1', '0', '0', '1', '15', 'SV'),
       ('197', '20240324롯데1', '8', '1', '5', '1', '2', '2', '19', '5', '1', '0', '0', '2', '0', '0', '4', '97', ''),
       ('193', '20240324롯데2', '8', '2', '1', '0', '0', '0', '4', '0', '0', '0', '0', '1', '0', '0', '0', '22', ''),
       ('198', '20240324롯데3', '8', '3', '0.33', '0', '3', '3', '3', '3', '0', '0', '1', '1', '0', '0', '0', '15', ''),
       ('199', '20240324롯데4', '8', '4', '0.66', '0', '0', '0', '3', '1', '1', '0', '0', '0', '0', '0', '0', '7', ''),
       ('200', '20240324롯데5', '8', '5', '0', '0', '1', '1', '0', '0', '0', '0', '0', '2', '0', '1', '0', '13', ''),
       ('201', '20240324롯데6', '8', '6', '1', '0', '0', '0', '3', '0', '0', '0', '0', '1', '0', '0', '3', '22', ''),
       ('202', '20240324롯데7', '8', '7', '0', '0', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '3', 'L'),
       ('167', '20240324삼성1', '3', '1', '6', '1', '1', '1', '23', '6', '0', '0', '0', '0', '0', '1', '2', '84', 'W'),
       ('172', '20240324삼성2', '3', '2', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '6', ''),
       ('173', '20240324삼성3', '3', '3', '1', '0', '0', '0', '4', '2', '0', '0', '0', '0', '0', '0', '0', '17', ''),
       ('174', '20240324삼성4', '3', '4', '0.33', '0', '5', '5', '6', '5', '1', '0', '0', '0', '0', '0', '0', '27', ''),
       ('175', '20240324삼성5', '3', '5', '0.33', '0', '2', '2', '4', '3', '2', '0', '0', '0', '0', '0', '0', '11', ''),
       ('171', '20240324삼성6', '3', '6', '0.33', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5', 'SV'),
       ('131', '20240324한화1', '4', '1', '6.66', '1', '2', '2', '25', '6', '1', '0', '0', '1', '0', '0', '4', '95', 'W'),
       ('133', '20240324한화2', '4', '2', '0.33', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0', '0', '1', '15', 'HD'),
       ('132', '20240324한화3', '4', '3', '1', '0', '0', '0', '5', '2', '0', '0', '0', '0', '0', '0', '0', '16', ''),
       ('134', '20240324한화4', '4', '4', '1', '0', '2', '2', '4', '2', '1', '0', '0', '0', '0', '0', '1', '24', ''),
       ('89', '20240324KT1', '7', '1', '4', '1', '4', '4', '14', '6', '1', '0', '0', '5', '0', '0', '3', '81', 'L'),
       ('90', '20240324KT2', '7', '2', '1', '0', '0', '0', '4', '1', '0', '0', '0', '1', '0', '0', '0', '17', ''),
       ('85', '20240324KT3', '7', '3', '0.66', '0', '3', '3', '5', '3', '0', '0', '0', '0', '0', '0', '0', '11', ''),
       ('91', '20240324KT4', '7', '4', '1', '0', '2', '2', '6', '3', '2', '0', '1', '1', '0', '0', '1', '23', ''),
       ('92', '20240324KT5', '7', '5', '1.33', '0', '2', '2', '7', '4', '2', '0', '0', '0', '0', '0', '0', '18', ''),
       ('88', '20240324KT6', '7', '6', '1', '0', '0', '0', '3', '1', '0', '0', '0', '2', '0', '0', '0', '20', ''),
       ('63', '20240324LG1', '2', '1', '6', '1', '3', '3', '22', '7', '1', '0', '2', '1', '0', '0', '5', '93', 'L'),
       ('60', '20240324LG2', '2', '2', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '2', '13', ''),
       ('64', '20240324LG3', '2', '3', '0.66', '0', '3', '3', '2', '1', '0', '0', '0', '2', '1', '0', '0', '19', ''),
       ('65', '20240324LG4', '2', '4', '0.33', '0', '1', '1', '2', '1', '0', '0', '1', '0', '0', '0', '0', '9', ''),
       ('66', '20240324LG5', '2', '5', '1', '0', '1', '1', '5', '2', '1', '0', '0', '0', '0', '0', '0', '23', ''),
       ('41', '20240324NC1', '9', '1', '5', '1', '3', '3', '20', '6', '0', '0', '2', '1', '0', '0', '1', '80', 'L'),
       ('42', '20240324NC2', '9', '2', '1', '0', '0', '0', '3', '0', '0', '0', '0', '1', '0', '0', '1', '20', ''),
       ('43', '20240324NC3', '9', '3', '0', '0', '2', '2', '1', '1', '0', '0', '0', '1', '0', '0', '0', '8', ''),
       ('44', '20240324NC4', '9', '4', '1', '0', '0', '0', '3', '1', '0', '0', '0', '1', '0', '0', '0', '18', ''),
       ('45', '20240324NC5', '9', '5', '1', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '0', '22', ''),
       ('40', '20240324NC6', '9', '6', '1', '0', '1', '1', '4', '1', '0', '0', '1', '0', '0', '0', '2', '17', ''),
       ('22', '20240324SSG1', '10', '1', '6', '1', '0', '0', '21', '4', '1', '0', '0', '0', '0', '1', '5', '79', ''),
       ('19', '20240324SSG2', '10', '2', '0.66', '0', '0', '0', '2', '0', '0', '0', '0', '1', '0', '0', '2', '18', 'HD'),
       ('20', '20240324SSG3', '10', '3', '1', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '1', '0', '24', 'HD'),
       ('23', '20240324SSG4', '10', '4', '1', '0', '4', '0', '6', '2', '0', '0', '0', '1', '0', '0', '0', '24', ''),
       ('21', '20240324SSG5', '10', '5', '0.33', '0', '2', '2', '4', '3', '1', '0', '1', '1', '0', '0', '1', '33', 'W'),
       ('242', '20240326두산1', '1', '1', '5', '1', '3', '3', '21', '6', '1', '0', '0', '2', '0', '0', '9', '91', ''),
       ('243', '20240326두산2', '1', '2', '0.33', '0', '2', '1', '4', '3', '0', '0', '0', '0', '0', '0', '0', '19', ''),
       ('224', '20240326두산3', '1', '3', '0.66', '0', '0', '0', '2', '0', '0', '0', '0', '1', '0', '0', '1', '16', 'W'),
       ('223', '20240326두산4', '1', '4', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '1', '8', 'HD'),
       ('220', '20240326두산5', '1', '5', '1', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '1', '17', 'HD'),
       ('221', '20240326두산6', '1', '6', '1', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '2', '19', 'SV'),
       ('246', '20240326롯데1', '8', '1', '6', '1', '1', '1', '21', '4', '1', '0', '1', '3', '0', '0', '6', '91', ''),
       ('193', '20240326롯데2', '8', '2', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '1', '13', ''),
       ('198', '20240326롯데3', '8', '3', '0.33', '0', '1', '1', '2', '2', '0', '0', '0', '0', '0', '0', '0', '5', 'L'),
       ('201', '20240326롯데4', '8', '4', '0.66', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '6', ''),
       ('227', '20240326삼성1', '3', '1', '5.66', '1', '2', '2', '18', '5', '0', '1', '0', '5', '0', '0', '2', '86', ''),
       ('169', '20240326삼성2', '3', '2', '1.33', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '0', '11', 'HD'),
       ('170', '20240326삼성3', '3', '3', '1', '0', '1', '1', '4', '1', '0', '0', '1', '0', '0', '0', '0', '11', ''),
       ('171', '20240326삼성4', '3', '4', '0.66', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '8', 'L'),
       ('238', '20240326키움1', '6', '1', '3.33', '1', '5', '4', '16', '6', '2', '0', '1', '3', '0', '2', '6', '86', 'L'),
       ('239', '20240326키움2', '6', '2', '1.66', '0', '2', '2', '6', '1', '0', '0', '1', '1', '0', '0', '1', '34', ''),
       ('234', '20240326키움3', '6', '3', '2.33', '0', '3', '3', '11', '4', '1', '0', '0', '5', '0', '0', '3', '64', ''),
       ('150', '20240326키움4', '6', '4', '0.66', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '1', '7', ''),
       ('228', '20240326한화1', '4', '1', '5', '1', '0', '0', '17', '2', '0', '0', '0', '3', '0', '0', '6', '91', 'W'),
       ('128', '20240326한화2', '4', '2', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '1', '16', ''),
       ('126', '20240326한화3', '4', '3', '1', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '0', '12', ''),
       ('133', '20240326한화4', '4', '4', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '2', '0', '18', ''),
       ('132', '20240326한화5', '4', '5', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '1', '13', ''),
       ('247', '20240326KIA1', '5', '1', '5.33', '1', '1', '1', '21', '5', '1', '0', '0', '4', '0', '0', '4', '90', ''),
       ('248', '20240326KIA2', '5', '2', '0.66', '0', '0', '0', '2', '0', '0', '0', '0', '1', '0', '0', '1', '15', ''),
       ('109', '20240326KIA3', '5', '3', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '1', '16', ''),
       ('108', '20240326KIA4', '5', '4', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '10', 'W'),
       ('105', '20240326KIA5', '5', '5', '1', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '2', '17', 'SV'),
       ('244', '20240326KT1', '7', '1', '5', '1', '4', '4', '18', '3', '1', '0', '2', '2', '0', '0', '8', '80', ''),
       ('90', '20240326KT2', '7', '2', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '1', '13', ''),
       ('83', '20240326KT3', '7', '3', '0', '0', '3', '3', '3', '3', '1', '0', '0', '0', '0', '0', '0', '15', 'L'),
       ('84', '20240326KT4', '7', '4', '1', '0', '0', '0', '3', '1', '0', '0', '0', '0', '0', '0', '1', '8', ''),
       ('88', '20240326KT5', '7', '5', '1', '0', '1', '1', '5', '2', '0', '0', '0', '0', '0', '0', '0', '17', ''),
       ('91', '20240326KT6', '7', '6', '1', '0', '0', '0', '2', '0', '0', '0', '0', '1', '0', '0', '0', '17', ''),
       ('226', '20240326LG1', '2', '1', '6', '1', '3', '3', '24', '7', '0', '0', '0', '0', '0', '1', '4', '85', ''),
       ('62', '20240326LG2', '2', '2', '1', '0', '0', '0', '4', '0', '0', '0', '0', '1', '0', '0', '1', '21', ''),
       ('61', '20240326LG3', '2', '3', '1', '0', '0', '0', '3', '0', '0', '0', '0', '1', '0', '0', '1', '17', ''),
       ('65', '20240326LG4', '2', '4', '1', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '0', '8', 'W'),
       ('240', '20240326NC1', '9', '1', '6.66', '1', '1', '1', '23', '3', '1', '0', '0', '1', '0', '1', '7', '98', 'W'),
       ('42', '20240326NC2', '9', '2', '0.33', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '7', ''),
       ('241', '20240326NC3', '9', '3', '0.33', '0', '4', '4', '5', '4', '1', '0', '1', '0', '0', '0', '1', '21', ''),
       ('39', '20240326NC4', '9', '4', '0.66', '0', '0', '0', '3', '1', '0', '0', '0', '1', '0', '0', '0', '17', ''),
       ('40', '20240326NC5', '9', '5', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '2', '10', ''),
       ('229', '20240326SSG1', '10', '1', '5', '1', '4', '4', '19', '4', '0', '0', '0', '3', '0', '0', '2', '89', 'L'),
       ('230', '20240326SSG2', '10', '2', '1', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '1', '8', ''),
       ('231', '20240326SSG3', '10', '3', '1.33', '0', '2', '2', '6', '2', '0', '0', '1', '0', '0', '0', '3', '26', ''),
       ('232', '20240326SSG4', '10', '4', '1.66', '0', '0', '0', '5', '0', '0', '0', '0', '1', '0', '0', '2', '22', '');

INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '류현진', '125', '1', '4', '20240323한화1', '20240323한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '이태양', '126', '1', '4', '20240323한화2', '20240323한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '김기중', '127', '1', '4', '20240323한화3', '20240323한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '한승혁', '128', '1', '4', '20240323한화4', '20240323한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '이민우', '129', '1', '4', '20240323한화5', '20240323한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('6', '한승주', '130', '1', '4', '20240323한화6', '20240323한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '엔스', '59', '1', '2', '20240323LG1', '20240323한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '김진성', '60', '1', '2', '20240323LG2', '20240323한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '박명근', '61', '1', '2', '20240323LG3', '20240323한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '이우찬', '62', '1', '2', '20240323LG4', '20240323한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '김광현', '17', '1', '10', '20240323SSG1', '20240323롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '오원석', '18', '1', '10', '20240323SSG2', '20240323롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '고효준', '19', '1', '10', '20240323SSG3', '20240323롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '노경은', '20', '1', '10', '20240323SSG4', '20240323롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '문승원', '21', '1', '10', '20240323SSG5', '20240323롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '윌커슨', '192', '1', '8', '20240323롯데1', '20240323롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '최준용', '193', '1', '8', '20240323롯데2', '20240323롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '임준섭', '194', '1', '8', '20240323롯데3', '20240323롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '김상수', '195', '1', '8', '20240323롯데4', '20240323롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '최이준', '196', '1', '8', '20240323롯데5', '20240323롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '알칸타라', '217', '1', '1', '20240323두산1', '20240323두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '김택연', '218', '1', '1', '20240323두산2', '20240323두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '김명신', '219', '1', '1', '20240323두산3', '20240323두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '박치국', '220', '1', '1', '20240323두산4', '20240323두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '정철원', '221', '1', '1', '20240323두산5', '20240323두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '하트', '37', '1', '9', '20240323NC1', '20240323두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '임정호', '38', '1', '9', '20240323NC2', '20240323두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '류진욱', '39', '1', '9', '20240323NC3', '20240323두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '이용찬', '40', '1', '9', '20240323NC4', '20240323두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '쿠에바스', '82', '1', '7', '20240323KT1', '20240323삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '우규민', '83', '1', '7', '20240323KT2', '20240323삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '이상동', '84', '1', '7', '20240323KT3', '20240323삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '주권', '85', '1', '7', '20240323KT4', '20240323삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '손동현', '86', '1', '7', '20240323KT5', '20240323삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('6', '박영현', '87', '1', '7', '20240323KT6', '20240323삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('7', '강건', '88', '1', '7', '20240323KT7', '20240323삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '코너', '168', '1', '3', '20240323삼성1', '20240323삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '임창민', '169', '1', '3', '20240323삼성2', '20240323삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '김재윤', '170', '1', '3', '20240323삼성3', '20240323삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '오승환', '171', '1', '3', '20240323삼성4', '20240323삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '크로우', '106', '1', '5', '20240323KIA1', '20240323키움KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '곽도규', '107', '1', '5', '20240323KIA2', '20240323키움KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '전상현', '108', '1', '5', '20240323KIA3', '20240323키움KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '최지민', '109', '1', '5', '20240323KIA4', '20240323키움KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '정해영', '105', '1', '5', '20240323KIA5', '20240323키움KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '후라도', '147', '1', '6', '20240323키움1', '20240323키움KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '손현기', '148', '1', '6', '20240323키움2', '20240323키움KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '전준표', '149', '1', '6', '20240323키움3', '20240323키움KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '김연주', '150', '1', '6', '20240323키움4', '20240323키움KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '임찬규', '63', '1', '2', '20240324LG1', '20240324한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '김진성', '60', '1', '2', '20240324LG2', '20240324한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '백승현', '64', '1', '2', '20240324LG3', '20240324한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '유영찬', '65', '1', '2', '20240324LG4', '20240324한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '김유영', '66', '1', '2', '20240324LG5', '20240324한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '페냐', '131', '1', '4', '20240324한화1', '20240324한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '김범수', '133', '1', '4', '20240324한화2', '20240324한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '주현상', '132', '1', '4', '20240324한화3', '20240324한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '박상원', '134', '1', '4', '20240324한화4', '20240324한화LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '박세웅', '197', '1', '8', '20240324롯데1', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '최준용', '193', '1', '8', '20240324롯데2', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '구승민', '198', '1', '8', '20240324롯데3', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '박진', '199', '1', '8', '20240324롯데4', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '우강훈', '200', '1', '8', '20240324롯데5', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('6', '전미르', '201', '1', '8', '20240324롯데6', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('7', '김원중', '202', '1', '8', '20240324롯데7', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '엘리아스', '22', '1', '10', '20240324SSG1', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '고효준', '19', '1', '10', '20240324SSG2', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '노경은', '20', '1', '10', '20240324SSG3', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '이로운', '23', '1', '10', '20240324SSG4', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '문승원', '21', '1', '10', '20240324SSG5', '20240324롯데SSG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '신민혁', '41', '1', '9', '20240324NC1', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '한재승', '42', '1', '9', '20240324NC2', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '서의태', '43', '1', '9', '20240324NC3', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '이준호', '44', '1', '9', '20240324NC4', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '김재열', '45', '1', '9', '20240324NC5', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('6', '이용찬', '40', '1', '9', '20240324NC6', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '브랜든', '222', '1', '1', '20240324두산1', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '최지강', '223', '1', '1', '20240324두산2', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '박치국', '220', '1', '1', '20240324두산3', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '이병헌', '224', '1', '1', '20240324두산4', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '박정수', '225', '1', '1', '20240324두산5', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('6', '김명신', '219', '1', '1', '20240324두산6', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('7', '정철원', '221', '1', '1', '20240324두산7', '20240324두산NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '레예스', '167', '1', '3', '20240324삼성1', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '김태훈', '172', '1', '3', '20240324삼성2', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '이재익', '173', '1', '3', '20240324삼성3', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '장필준', '174', '1', '3', '20240324삼성4', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '김대우', '175', '1', '3', '20240324삼성5', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('6', '오승환', '171', '1', '3', '20240324삼성6', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '엄상백', '89', '1', '7', '20240324KT1', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '김민수', '90', '1', '7', '20240324KT2', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '주권', '85', '1', '7', '20240324KT3', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '성재헌', '91', '1', '7', '20240324KT4', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '김영현', '92', '1', '7', '20240324KT5', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('6', '강건', '88', '1', '7', '20240324KT6', '20240324삼성KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '백정현', '227', '1', '3', '20240326삼성1', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '임창민', '169', '1', '3', '20240326삼성2', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '김재윤', '170', '1', '3', '20240326삼성3', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '오승환', '171', '1', '3', '20240326삼성4', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '켈리', '226', '1', '2', '20240326LG1', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '이우찬', '62', '1', '2', '20240326LG2', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '박명근', '61', '1', '2', '20240326LG3', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '유영찬', '65', '1', '2', '20240326LG4', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '김민우', '228', '1', '4', '20240326한화1', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '한승혁', '128', '1', '4', '20240326한화2', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '이태양', '126', '1', '4', '20240326한화3', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '김범수', '133', '1', '4', '20240326한화4', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '주현상', '132', '1', '4', '20240326한화5', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '더거', '229', '1', '10', '20240326SSG1', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '한두솔', '230', '1', '10', '20240326SSG2', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '최민준', '231', '1', '10', '20240326SSG3', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '조병현', '232', '1', '10', '20240326SSG4', '20240326삼성LG');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '헤이수스', '238', '1', '6', '20240326키움1', '20240326키움NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '김동혁', '239', '1', '6', '20240326키움2', '20240326키움NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '김윤하', '234', '1', '6', '20240326키움3', '20240326키움NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '김연주', '150', '1', '6', '20240326키움4', '20240326키움NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '카스타노', '240', '1', '9', '20240326NC1', '20240326키움NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '한재승', '42', '1', '9', '20240326NC2', '20240326키움NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '최성영', '241', '1', '9', '20240326NC3', '20240326키움NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '류진욱', '39', '1', '9', '20240326NC4', '20240326키움NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '이용찬', '40', '1', '9', '20240326NC5', '20240326키움NC');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '곽빈', '242', '1', '1', '20240326두산1', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '이영하', '243', '1', '1', '20240326두산2', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '이병헌', '224', '1', '1', '20240326두산3', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '최지강', '223', '1', '1', '20240326두산4', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '박치국', '220', '1', '1', '20240326두산5', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('6', '정철원', '221', '1', '1', '20240326두산6', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '벤자민', '244', '1', '7', '20240326KT1', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '김민수', '90', '1', '7', '20240326KT2', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '우규민', '83', '1', '7', '20240326KT3', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '이상동', '84', '1', '7', '20240326KT4', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '강건', '88', '1', '7', '20240326KT5', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('6', '성재헌', '91', '1', '7', '20240326KT6', '20240326두산KT');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '반즈', '246', '1', '8', '20240326롯데1', '20240326롯데KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '최준용', '193', '1', '8', '20240326롯데2', '20240326롯데KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '구승민', '198', '1', '8', '20240326롯데3', '20240326롯데KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '전미르', '201', '1', '8', '20240326롯데4', '20240326롯데KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('1', '양현종', '247', '1', '5', '20240326KIA1', '20240326롯데KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('2', '임기영', '248', '1', '5', '20240326KIA2', '20240326롯데KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('3', '최지민', '109', '1', '5', '20240326KIA3', '20240326롯데KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('4', '전상현', '108', '1', '5', '20240326KIA4', '20240326롯데KIA');
INSERT INTO `pitcher_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `id`, `match_info_id`) VALUES ('5', '정해영', '105', '1', '5', '20240326KIA5', '20240326롯데KIA');


INSERT INTO `batter_record` (`player_id`, `id`, `team_id`, `b_order`, `position`, `ab`, `runs`, `hits`, `doubles`, `triples`, `homeruns`, `rbi`, `sb`, `cs`, `bb`, `hbp`, `ibb`, `so`, `dp`, `sc`, `sf`)
VALUES ('203', '20240323두산1', '1', '1', '8', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0'),
       ('213', '20240323두산2', '1', '2', '9', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('205', '20240323두산3', '1', '3', '2', '4', '0', '2', '1', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('216', '20240323두산4', '1', '4', '10', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('215', '20240323두산5', '1', '5', '3', '4', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('209', '20240323두산6', '1', '6', '4', '4', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('204', '20240323두산7', '1', '7', '5', '4', '1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('208', '20240323두산71', '1', '7', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('211', '20240323두산72', '1', '7', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('206', '20240323두산8', '1', '8', '6', '3', '0', '1', '0', '1', '0', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('210', '20240323두산9', '1', '9', '7', '3', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('178', '20240323롯데1', '8', '1', '8', '2', '2', '1', '0', '0', '0', '0', '1', '0', '3', '0', '0', '0', '0', '0', '0'),
       ('176', '20240323롯데2', '8', '2', '7', '4', '0', '1', '0', '0', '0', '0', '1', '0', '1', '0', '0', '3', '0', '0', '0'),
       ('177', '20240323롯데3', '8', '3', '9', '5', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('189', '20240323롯데4', '8', '4', '10', '5', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('185', '20240323롯데5', '8', '5', '6', '3', '0', '1', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '0', '0', '0'),
       ('181', '20240323롯데51', '8', '5', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('191', '20240323롯데6', '8', '6', '2', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '1', '0', '0'),
       ('190', '20240323롯데7', '8', '7', '3', '4', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('179', '20240323롯데8', '8', '8', '5', '4', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('188', '20240323롯데9', '8', '9', '4', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('184', '20240323롯데91', '8', '9', '4', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('151', '20240323삼성1', '3', '1', '8', '5', '0', '1', '0', '0', '0', '1', '2', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('156', '20240323삼성2', '3', '2', '9', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('162', '20240323삼성3', '3', '3', '7', '4', '1', '2', '0', '0', '0', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0'),
       ('166', '20240323삼성31', '3', '3', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('163', '20240323삼성4', '3', '4', '3', '5', '1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('152', '20240323삼성5', '3', '5', '2', '4', '2', '2', '0', '0', '1', '1', '0', '0', '1', '0', '1', '0', '1', '0', '0'),
       ('153', '20240323삼성6', '3', '6', '10', '2', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0'),
       ('160', '20240323삼성61', '3', '6', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('155', '20240323삼성62', '3', '6', '10', '1', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('158', '20240323삼성7', '3', '7', '4', '4', '1', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('157', '20240323삼성8', '3', '8', '5', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('165', '20240323삼성81', '3', '8', '5', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '1', '0'),
       ('159', '20240323삼성9', '3', '9', '6', '5', '0', '1', '0', '0', '0', '2', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('143', '20240323키움1', '6', '1', '4', '4', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('146', '20240323키움2', '6', '2', '8', '4', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('145', '20240323키움3', '6', '3', '7', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('135', '20240323키움4', '6', '4', '3', '3', '2', '1', '0', '0', '1', '2', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('142', '20240323키움5', '6', '5', '10', '4', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('140', '20240323키움6', '6', '6', '2', '4', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('141', '20240323키움7', '6', '7', '5', '3', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('137', '20240323키움8', '6', '8', '9', '4', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('144', '20240323키움9', '6', '9', '6', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('138', '20240323키움91', '6', '9', '11', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('136', '20240323키움92', '6', '9', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('139', '20240323키움93', '6', '9', '11', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('119', '20240323한화1', '4', '1', '7', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('112', '20240323한화2', '4', '2', '9', '4', '0', '2', '1', '0', '0', '1', '0', '1', '0', '0', '0', '2', '0', '0', '0'),
       ('123', '20240323한화3', '4', '3', '10', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('121', '20240323한화4', '4', '4', '5', '3', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('110', '20240323한화5', '4', '5', '3', '4', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('124', '20240323한화6', '4', '6', '4', '3', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('117', '20240323한화7', '4', '7', '8', '4', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0'),
       ('111', '20240323한화8', '4', '8', '6', '3', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('115', '20240323한화81', '4', '8', '11', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('120', '20240323한화9', '4', '9', '2', '2', '0', '1', '0', '0', '0', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0'),
       ('98', '20240323KIA1', '5', '1', '6', '5', '2', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('103', '20240323KIA2', '5', '2', '5', '5', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('96', '20240323KIA3', '5', '3', '7', '5', '1', '2', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('93', '20240323KIA4', '5', '4', '10', '3', '1', '2', '2', '0', '0', '2', '0', '0', '2', '0', '0', '0', '0', '0', '0'),
       ('101', '20240323KIA41', '5', '4', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('94', '20240323KIA5', '5', '5', '4', '2', '1', '1', '0', '0', '0', '1', '1', '0', '3', '0', '0', '1', '0', '0', '0'),
       ('102', '20240323KIA6', '5', '6', '3', '5', '1', '2', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('104', '20240323KIA7', '5', '7', '3', '4', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('100', '20240323KIA71', '5', '7', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('95', '20240323KIA8', '5', '8', '2', '4', '0', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('99', '20240323KIA81', '5', '8', '8', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('97', '20240323KIA9', '5', '9', '9', '4', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('75', '20240323KT1', '7', '1', '8', '4', '0', '2', '0', '0', '0', '1', '1', '1', '1', '0', '0', '2', '0', '0', '0'),
       ('79', '20240323KT2', '7', '2', '7', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('69', '20240323KT3', '7', '3', '9', '3', '1', '1', '0', '0', '1', '1', '0', '0', '1', '0', '1', '2', '0', '0', '0'),
       ('76', '20240323KT31', '7', '3', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('80', '20240323KT32', '7', '3', '11', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('77', '20240323KT4', '7', '4', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '2', '0', '0', '0'),
       ('74', '20240323KT5', '7', '5', '10', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('73', '20240323KT6', '7', '6', '5', '3', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('78', '20240323KT7', '7', '7', '2', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('67', '20240323KT8', '7', '8', '4', '4', '1', '2', '0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('68', '20240323KT81', '7', '8', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('81', '20240323KT9', '7', '9', '6', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('50', '20240323LG1', '2', '1', '8', '4', '1', '2', '0', '0', '0', '1', '3', '0', '0', '1', '0', '0', '0', '0', '0'),
       ('49', '20240323LG2', '2', '2', '9', '4', '0', '1', '0', '0', '0', '2', '1', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('56', '20240323LG3', '2', '3', '10', '3', '0', '1', '0', '0', '0', '0', '0', '0', '2', '0', '0', '1', '0', '0', '0'),
       ('52', '20240323LG31', '2', '3', '10', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('57', '20240323LG4', '2', '4', '3', '5', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('51', '20240323LG41', '2', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('46', '20240323LG5', '2', '5', '6', '4', '2', '1', '0', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('58', '20240323LG6', '2', '6', '3', '5', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0'),
       ('53', '20240323LG7', '2', '7', '2', '3', '1', '1', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('54', '20240323LG71', '2', '7', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('48', '20240323LG8', '2', '8', '7', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('47', '20240323LG9', '2', '9', '4', '4', '1', '2', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('31', '20240323NC1', '9', '1', '4', '5', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('24', '20240323NC2', '9', '2', '7', '4', '1', '1', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('25', '20240323NC3', '9', '3', '10', '4', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('28', '20240323NC31', '9', '3', '10', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('29', '20240323NC32', '9', '3', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0'),
       ('26', '20240323NC4', '9', '4', '3', '4', '1', '1', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('35', '20240323NC5', '9', '5', '9', '4', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('36', '20240323NC6', '9', '6', '8', '4', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('34', '20240323NC7', '9', '7', '5', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('32', '20240323NC8', '9', '8', '2', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '0', '0', '0'),
       ('33', '20240323NC9', '9', '9', '6', '2', '1', '0', '0', '0', '0', '1', '1', '0', '1', '1', '0', '0', '0', '0', '0'),
       ('1', '20240323SSG1', '10', '1', '8', '3', '3', '2', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('10', '20240323SSG2', '10', '2', '9', '2', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '2', '0', '0', '0'),
       ('13', '20240323SSG21', '10', '2', '9', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('6', '20240323SSG3', '10', '3', '5', '4', '1', '2', '0', '0', '1', '3', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('2', '20240323SSG4', '10', '4', '10', '4', '1', '1', '0', '0', '1', '2', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('7', '20240323SSG5', '10', '5', '7', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('3', '20240323SSG6', '10', '6', '6', '2', '0', '2', '0', '0', '0', '0', '0', '1', '2', '0', '0', '0', '0', '0', '0'),
       ('16', '20240323SSG7', '10', '7', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0'),
       ('15', '20240323SSG71', '10', '7', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('8', '20240323SSG8', '10', '8', '2', '3', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('4', '20240323SSG9', '10', '9', '4', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('203', '20240324두산1', '1', '1', '8', '3', '1', '2', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('210', '20240324두산11', '1', '1', '7', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0'),
       ('213', '20240324두산2', '1', '2', '9', '5', '0', '1', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('205', '20240324두산3', '1', '3', '2', '5', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('216', '20240324두산4', '1', '4', '10', '3', '0', '1', '0', '0', '0', '0', '0', '0', '2', '0', '0', '1', '0', '0', '0'),
       ('215', '20240324두산5', '1', '5', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0'),
       ('209', '20240324두산6', '1', '6', '4', '4', '1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('211', '20240324두산61', '1', '6', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('204', '20240324두산7', '1', '7', '5', '4', '1', '2', '0', '0', '1', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('212', '20240324두산8', '1', '8', '7', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('207', '20240324두산81', '1', '8', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('214', '20240324두산82', '1', '8', '8', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('206', '20240324두산9', '1', '9', '6', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('178', '20240324롯데1', '8', '1', '8', '4', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('183', '20240324롯데11', '8', '1', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('176', '20240324롯데2', '8', '2', '7', '4', '1', '3', '2', '0', '0', '3', '0', '0', '0', '1', '0', '1', '0', '0', '0'),
       ('177', '20240324롯데3', '8', '3', '9', '5', '1', '2', '0', '0', '1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('189', '20240324롯데4', '8', '4', '10', '4', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('185', '20240324롯데5', '8', '5', '6', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('182', '20240324롯데51', '8', '5', '4', '2', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('179', '20240324롯데6', '8', '6', '5', '1', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0'),
       ('181', '20240324롯데61', '8', '6', '12', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('187', '20240324롯데62', '8', '6', '5', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('190', '20240324롯데7', '8', '7', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('191', '20240324롯데8', '8', '8', '2', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('186', '20240324롯데81', '8', '8', '11', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('180', '20240324롯데82', '8', '8', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('184', '20240324롯데9', '8', '9', '6', '4', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('151', '20240324삼성1', '3', '1', '8', '3', '3', '2', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0'),
       ('164', '20240324삼성11', '3', '1', '3', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('156', '20240324삼성2', '3', '2', '8', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('160', '20240324삼성21', '3', '2', '8', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('162', '20240324삼성3', '3', '3', '7', '3', '0', '1', '0', '0', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '1'),
       ('166', '20240324삼성31', '3', '3', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('163', '20240324삼성4', '3', '4', '10', '5', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('165', '20240324삼성41', '3', '4', '10', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('152', '20240324삼성5', '3', '5', '2', '3', '1', '1', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('154', '20240324삼성51', '3', '5', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('153', '20240324삼성6', '3', '6', '3', '4', '0', '2', '2', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('155', '20240324삼성61', '3', '6', '9', '2', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0'),
       ('158', '20240324삼성7', '3', '7', '5', '2', '0', '0', '0', '0', '0', '1', '0', '0', '3', '0', '0', '0', '0', '0', '0'),
       ('157', '20240324삼성8', '3', '8', '5', '5', '1', '3', '1', '0', '0', '1', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('161', '20240324삼성81', '3', '8', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('159', '20240324삼성9', '3', '9', '6', '4', '2', '1', '0', '0', '1', '2', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('119', '20240324한화1', '4', '1', '7', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('113', '20240324한화11', '4', '1', '7', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0'),
       ('114', '20240324한화12', '4', '1', '8', '1', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('112', '20240324한화2', '4', '2', '7', '4', '3', '2', '0', '0', '2', '2', '0', '0', '1', '0', '1', '0', '0', '0', '0'),
       ('123', '20240324한화3', '4', '3', '10', '4', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('121', '20240324한화4', '4', '4', '5', '3', '1', '1', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('110', '20240324한화5', '4', '5', '3', '4', '2', '2', '1', '0', '1', '3', '0', '0', '0', '0', '0', '0', '2', '0', '0'),
       ('124', '20240324한화6', '4', '6', '4', '3', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('116', '20240324한화61', '4', '6', '4', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('111', '20240324한화7', '4', '7', '6', '4', '1', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('122', '20240324한화8', '4', '8', '2', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0'),
       ('118', '20240324한화9', '4', '9', '9', '3', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('75', '20240324KT1', '7', '1', '8', '5', '1', '3', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('79', '20240324KT2', '7', '2', '7', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0'),
       ('80', '20240324KT21', '7', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('72', '20240324KT22', '7', '2', '3', '2', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('69', '20240324KT3', '7', '3', '9', '4', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('76', '20240324KT31', '7', '3', '7', '1', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('77', '20240324KT4', '7', '4', '3', '3', '1', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '0'),
       ('88', '20240324KT41', '7', '4', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('68', '20240324KT42', '7', '4', '11', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('74', '20240324KT5', '7', '5', '9', '5', '1', '3', '1', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('73', '20240324KT6', '7', '6', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('78', '20240324KT7', '7', '7', '2', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('71', '20240324KT71', '7', '7', '2', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('67', '20240324KT8', '7', '8', '4', '4', '1', '3', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('81', '20240324KT9', '7', '9', '6', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('70', '20240324KT91', '7', '9', '6', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('50', '20240324LG1', '2', '1', '8', '4', '0', '2', '0', '0', '0', '2', '1', '0', '0', '0', '0', '2', '0', '0', '1'),
       ('49', '20240324LG2', '2', '2', '9', '5', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('56', '20240324LG3', '2', '3', '10', '3', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('57', '20240324LG4', '2', '4', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('46', '20240324LG5', '2', '5', '6', '4', '1', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('58', '20240324LG6', '2', '6', '5', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('53', '20240324LG7', '2', '7', '2', '4', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('55', '20240324LG71', '2', '7', '12', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('48', '20240324LG8', '2', '8', '7', '4', '2', '3', '1', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('47', '20240324LG9', '2', '9', '4', '3', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0'),
       ('31', '20240324NC1', '9', '1', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0'),
       ('24', '20240324NC2', '9', '2', '7', '5', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('25', '20240324NC3', '9', '3', '10', '4', '1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('26', '20240324NC4', '9', '4', '3', '4', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('35', '20240324NC5', '9', '5', '9', '3', '1', '1', '0', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0'),
       ('36', '20240324NC6', '9', '6', '8', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('27', '20240324NC61', '9', '6', '8', '1', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('34', '20240324NC7', '9', '7', '5', '4', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('32', '20240324NC8', '9', '8', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('30', '20240324NC81', '9', '8', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('33', '20240324NC9', '9', '9', '6', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('1', '20240324SSG1', '10', '1', '8', '4', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('3', '20240324SSG2', '10', '2', '6', '2', '1', '1', '0', '0', '0', '0', '0', '0', '3', '0', '0', '1', '0', '0', '0'),
       ('6', '20240324SSG3', '10', '3', '5', '5', '1', '1', '0', '0', '1', '3', '0', '0', '0', '0', '0', '2', '1', '0', '0'),
       ('2', '20240324SSG4', '10', '4', '9', '4', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('13', '20240324SSG41', '10', '4', '9', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('7', '20240324SSG5', '10', '5', '7', '4', '1', '1', '0', '0', '1', '1', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('16', '20240324SSG6', '10', '6', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('15', '20240324SSG61', '10', '6', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('11', '20240324SSG7', '10', '7', '10', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('12', '20240324SSG71', '10', '7', '10', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('4', '20240324SSG8', '10', '8', '4', '3', '1', '2', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('9', '20240324SSG81', '10', '8', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('5', '20240324SSG9', '10', '9', '2', '3', '0', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('14', '20240324SSG91', '10', '9', '12', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
       ('8', '20240324SSG92', '10', '9', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0'),
       ('151', '20240326삼성1', '3', '1', '8', '5', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('156', '20240326삼성2', '3', '2', '9', '4', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0', '0', '0'),
       ('162', '20240326삼성3', '3', '3', '10', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('163', '20240326삼성4', '3', '4', '5', '4', '1', '2', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('153', '20240326삼성5', '3', '5', '3', '3', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('158', '20240326삼성6', '3', '6', '4', '4', '0', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('155', '20240326삼성7', '3', '7', '7', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '1', '0', '0'),
       ('166', '20240326삼성71', '3', '7', '7', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('154', '20240326삼성8', '3', '8', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('160', '20240326삼성81', '3', '8', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('152', '20240326삼성82', '3', '8', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('159', '20240326삼성9', '3', '9', '6', '4', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('50', '20240326LG1', '2', '1', '8', '4', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0'),
       ('49', '20240326LG2', '2', '2', '9', '3', '1', '2', '0', '0', '1', '2', '0', '0', '1', '0', '0', '0', '1', '0', '0'),
       ('56', '20240326LG3', '2', '3', '10', '4', '1', '2', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('57', '20240326LG4', '2', '4', '3', '3', '0', '1', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('46', '20240326LG5', '2', '5', '6', '4', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '2', '0', '0', '0'),
       ('58', '20240326LG6', '2', '6', '5', '3', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('52', '20240326LG61', '2', '6', '12', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('53', '20240326LG7', '2', '7', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0'),
       ('48', '20240326LG8', '2', '8', '7', '2', '1', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1', '0', '1'),
       ('47', '20240326LG9', '2', '9', '4', '2', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0'),
       ('113', '20240326한화1', '4', '1', '7', '4', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('117', '20240326한화11', '4', '1', '8', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('112', '20240326한화2', '4', '2', '7', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('110', '20240326한화3', '4', '3', '10', '4', '0', '1', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('121', '20240326한화4', '4', '4', '5', '4', '1', '1', '0', '0', '1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('123', '20240326한화5', '4', '5', '3', '4', '1', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('115', '20240326한화51', '4', '5', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('111', '20240326한화6', '4', '6', '6', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('116', '20240326한화61', '4', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('124', '20240326한화7', '4', '7', '4', '2', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '1', '0', '0', '0'),
       ('118', '20240326한화8', '4', '8', '9', '4', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('120', '20240326한화9', '4', '9', '2', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('1', '20240326SSG1', '10', '1', '8', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('13', '20240326SSG11', '10', '1', '8', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('3', '20240326SSG2', '10', '2', '6', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('6', '20240326SSG3', '10', '3', '5', '2', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1', '0', '0', '0'),
       ('14', '20240326SSG31', '10', '3', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('2', '20240326SSG4', '10', '4', '9', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0', '0', '0'),
       ('7', '20240326SSG5', '10', '5', '7', '4', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0'),
       ('11', '20240326SSG6', '10', '6', '10', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('16', '20240326SSG7', '10', '7', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0'),
       ('8', '20240326SSG8', '10', '8', '2', '3', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('12', '20240326SSG81', '10', '8', '11', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('9', '20240326SSG9', '10', '9', '4', '3', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('143', '20240326키움1', '6', '1', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('146', '20240326키움2', '6', '2', '7', '5', '1', '1', '0', '0', '1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('142', '20240326키움3', '6', '3', '6', '4', '1', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('135', '20240326키움4', '6', '4', '3', '4', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('145', '20240326키움5', '6', '5', '7', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('233', '20240326키움51', '6', '5', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('140', '20240326키움6', '6', '6', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0'),
       ('235', '20240326키움61', '6', '6', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('137', '20240326키움7', '6', '7', '9', '4', '0', '2', '0', '0', '0', '3', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('114', '20240326키움8', '6', '8', '10', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('141', '20240326키움81', '6', '8', '5', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('144', '20240326키움9', '6', '9', '6', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('139', '20240326키움91', '6', '9', '11', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('234', '20240326키움92', '6', '9', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('150', '20240326키움93', '6', '9', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('138', '20240326키움94', '6', '9', '11', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('31', '20240326NC1', '9', '1', '4', '5', '1', '2', '1', '0', '0', '0', '2', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('24', '20240326NC2', '9', '2', '7', '2', '1', '0', '0', '0', '0', '0', '0', '0', '2', '1', '0', '2', '0', '0', '0'),
       ('25', '20240326NC3', '9', '3', '10', '5', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('26', '20240326NC4', '9', '4', '3', '3', '2', '2', '2', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0', '0', '0'),
       ('236', '20240326NC41', '9', '4', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('35', '20240326NC5', '9', '5', '9', '2', '2', '1', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0'),
       ('29', '20240326NC51', '9', '5', '9', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('36', '20240326NC6', '9', '6', '8', '3', '3', '2', '0', '0', '1', '4', '2', '0', '2', '0', '0', '1', '0', '0', '0'),
       ('34', '20240326NC7', '9', '7', '5', '3', '0', '1', '0', '0', '0', '2', '0', '0', '2', '0', '0', '0', '0', '0', '0'),
       ('32', '20240326NC8', '9', '8', '2', '5', '1', '2', '0', '0', '1', '3', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('33', '20240326NC9', '9', '9', '6', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0'),
       ('237', '20240326NC92', '9', '9', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('203', '20240326두산1', '1', '1', '8', '4', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '1'),
       ('213', '20240326두산2', '1', '2', '9', '5', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('205', '20240326두산3', '1', '3', '2', '4', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('216', '20240326두산4', '1', '4', '10', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0'),
       ('214', '20240326두산41', '1', '4', '7', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('215', '20240326두산5', '1', '5', '3', '3', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('209', '20240326두산6', '1', '6', '4', '4', '2', '3', '0', '0', '1', '3', '1', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('211', '20240326두산61', '1', '6', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('204', '20240326두산7', '1', '7', '5', '4', '1', '2', '2', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('206', '20240326두산8', '1', '8', '6', '4', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('210', '20240326두산9', '1', '9', '7', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('212', '20240326두산91', '1', '9', '7', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('207', '20240326두산92', '1', '9', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('208', '20240326두산93', '1', '9', '12', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
       ('221', '20240326두산94', '1', '9', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('75', '20240326KT1', '7', '1', '8', '3', '0', '2', '0', '0', '0', '2', '0', '0', '1', '0', '0', '1', '0', '0', '1'),
       ('79', '20240326KT2', '7', '2', '7', '5', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('80', '20240326KT21', '7', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('69', '20240326KT3', '7', '3', '9', '4', '0', '2', '1', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('77', '20240326KT4', '7', '4', '3', '5', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0'),
       ('74', '20240326KT5', '7', '5', '10', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('73', '20240326KT6', '7', '6', '5', '4', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '4', '0', '0', '0'),
       ('78', '20240326KT7', '7', '7', '2', '4', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('67', '20240326KT8', '7', '8', '4', '4', '2', '3', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('81', '20240326KT9', '7', '9', '6', '4', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('181', '20240326롯데1', '8', '1', '8', '3', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('178', '20240326롯데11', '8', '1', '11', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('180', '20240326롯데12', '8', '1', '2', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('176', '20240326롯데2', '8', '2', '7', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'),
       ('177', '20240326롯데3', '8', '3', '9', '3', '0', '2', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('189', '20240326롯데4', '8', '4', '10', '4', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('185', '20240326롯데5', '8', '5', '6', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('186', '20240326롯데6', '8', '6', '7', '2', '1', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0'),
       ('183', '20240326롯데61', '8', '6', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('179', '20240326롯데7', '8', '7', '5', '3', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('191', '20240326롯데8', '8', '8', '2', '2', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('190', '20240326롯데81', '8', '8', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('184', '20240326롯데9', '8', '9', '4', '4', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('98', '20240326KIA1', '5', '1', '6', '3', '1', '2', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0'),
       ('103', '20240326KIA2', '5', '2', '5', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0'),
       ('96', '20240326KIA3', '5', '3', '7', '4', '0', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('93', '20240326KIA4', '5', '4', '10', '4', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('94', '20240326KIA5', '5', '5', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('102', '20240326KIA6', '5', '6', '9', '3', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('101', '20240326KIA7', '5', '7', '7', '2', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0'),
       ('99', '20240326KIA71', '5', '7', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('95', '20240326KIA8', '5', '8', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'),
       ('104', '20240326KIA81', '5', '8', '11', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
       ('100', '20240326KIA82', '5', '8', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
       ('245', '20240326KIA9', '5', '9', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0');


INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '정은원', '119', '7', '4', '20240323한화LG', '20240323한화1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '페라자', '112', '9', '4', '20240323한화LG', '20240323한화2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '안치홍', '123', '10', '4', '20240323한화LG', '20240323한화3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '노시환', '121', '5', '4', '20240323한화LG', '20240323한화4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '채은성', '110', '3', '4', '20240323한화LG', '20240323한화5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '문현빈', '124', '4', '4', '20240323한화LG', '20240323한화6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '김강민', '117', '8', '4', '20240323한화LG', '20240323한화7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '하주석', '111', '6', '4', '20240323한화LG', '20240323한화8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김태연', '115', '11', '4', '20240323한화LG', '20240323한화81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '최재훈', '120', '2', '4', '20240323한화LG', '20240323한화9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '박해민', '50', '8', '2', '20240323한화LG', '20240323LG1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '홍창기', '49', '9', '2', '20240323한화LG', '20240323LG2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '김현수', '56', '10', '2', '20240323한화LG', '20240323LG3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '최승민', '52', '11', '2', '20240323한화LG', '20240323LG31');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '오스틴', '57', '3', '2', '20240323한화LG', '20240323LG4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '구본혁', '51', '11', '2', '20240323한화LG', '20240323LG41');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '오지환', '46', '6', '2', '20240323한화LG', '20240323LG5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '문보경', '58', '5', '2', '20240323한화LG', '20240323LG6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '박동원', '53', '2', '2', '20240323한화LG', '20240323LG7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '허도환', '54', '11', '2', '20240323한화LG', '20240323LG71');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '문성주', '48', '7', '2', '20240323한화LG', '20240323LG8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '신민재', '47', '4', '2', '20240323한화LG', '20240323LG9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '윤동희', '178', '8', '8', '20240323롯데SSG', '20240323롯데1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '고승민', '176', '7', '8', '20240323롯데SSG', '20240323롯데2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '레이예스', '177', '9', '8', '20240323롯데SSG', '20240323롯데3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '전준우', '189', '10', '8', '20240323롯데SSG', '20240323롯데4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '노진혁', '185', '6', '8', '20240323롯데SSG', '20240323롯데5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '황성빈', '181', '11', '8', '20240323롯데SSG', '20240323롯데51');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '유강남', '191', '2', '8', '20240323롯데SSG', '20240323롯데6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '나승엽', '190', '3', '8', '20240323롯데SSG', '20240323롯데7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김민성', '179', '5', '8', '20240323롯데SSG', '20240323롯데8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '오선진', '188', '4', '8', '20240323롯데SSG', '20240323롯데9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '박승욱', '184', '11', '8', '20240323롯데SSG', '20240323롯데91');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '최지훈', '1', '8', '10', '20240323롯데SSG', '20240323SSG1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '추신수', '10', '9', '10', '20240323롯데SSG', '20240323SSG2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '하재훈', '13', '11', '10', '20240323롯데SSG', '20240323SSG21');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '최정', '6', '5', '10', '20240323롯데SSG', '20240323SSG3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '한유섬', '2', '10', '10', '20240323롯데SSG', '20240323SSG4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '에레디아', '7', '7', '10', '20240323롯데SSG', '20240323SSG5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '박성한', '3', '6', '10', '20240323롯데SSG', '20240323SSG6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '전의산', '16', '3', '10', '20240323롯데SSG', '20240323SSG7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '오태곤', '15', '11', '10', '20240323롯데SSG', '20240323SSG71');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '이지영', '8', '2', '10', '20240323롯데SSG', '20240323SSG8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김성현', '4', '4', '10', '20240323롯데SSG', '20240323SSG9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '정수빈', '203', '8', '1', '20240323두산NC', '20240323두산1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '라모스', '213', '9', '1', '20240323두산NC', '20240323두산2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '양의지', '205', '2', '1', '20240323두산NC', '20240323두산3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '김재환', '216', '10', '1', '20240323두산NC', '20240323두산4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '양석환', '215', '3', '1', '20240323두산NC', '20240323두산5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '강승호', '209', '4', '1', '20240323두산NC', '20240323두산6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '허경민', '204', '5', '1', '20240323두산NC', '20240323두산7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '이유찬', '208', '11', '1', '20240323두산NC', '20240323두산71');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '박계범', '211', '11', '1', '20240323두산NC', '20240323두산72');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '박준영', '206', '6', '1', '20240323두산NC', '20240323두산8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김대한', '210', '7', '1', '20240323두산NC', '20240323두산9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '박민우', '31', '4', '9', '20240323두산NC', '20240323NC1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '권희동', '24', '7', '9', '20240323두산NC', '20240323NC2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '손아섭', '25', '10', '9', '20240323두산NC', '20240323NC3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '박영빈', '28', '11', '9', '20240323두산NC', '20240323NC31');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '천재환', '29', '11', '9', '20240323두산NC', '20240323NC32');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '데이비슨', '26', '3', '9', '20240323두산NC', '20240323NC4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '박건우', '35', '9', '9', '20240323두산NC', '20240323NC5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '김성욱', '36', '8', '9', '20240323두산NC', '20240323NC6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '서호철', '34', '5', '9', '20240323두산NC', '20240323NC7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김형준', '32', '2', '9', '20240323두산NC', '20240323NC8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김주원', '33', '6', '9', '20240323두산NC', '20240323NC9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '김지찬', '151', '8', '3', '20240323삼성KT', '20240323삼성1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '김성윤', '156', '9', '3', '20240323삼성KT', '20240323삼성2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '구자욱', '162', '7', '3', '20240323삼성KT', '20240323삼성3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '김헌곤', '166', '11', '3', '20240323삼성KT', '20240323삼성31');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '맥키넌', '163', '3', '3', '20240323삼성KT', '20240323삼성4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '강민호', '152', '2', '3', '20240323삼성KT', '20240323삼성5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '오재일', '153', '10', '3', '20240323삼성KT', '20240323삼성6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '김재혁', '160', '11', '3', '20240323삼성KT', '20240323삼성61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '김현준', '155', '11', '3', '20240323삼성KT', '20240323삼성62');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '류지혁', '158', '4', '3', '20240323삼성KT', '20240323삼성7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '전병우', '157', '5', '3', '20240323삼성KT', '20240323삼성8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '강한울', '165', '11', '3', '20240323삼성KT', '20240323삼성81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김영웅', '159', '6', '3', '20240323삼성KT', '20240323삼성9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '배정대', '75', '8', '7', '20240323삼성KT', '20240323KT1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '김민혁', '79', '7', '7', '20240323삼성KT', '20240323KT2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '로하스', '69', '9', '7', '20240323삼성KT', '20240323KT3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '안치영', '76', '11', '7', '20240323삼성KT', '20240323KT31');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '정준영', '80', '11', '7', '20240323삼성KT', '20240323KT32');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '박병호', '77', '3', '7', '20240323삼성KT', '20240323KT4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '강백호', '74', '10', '7', '20240323삼성KT', '20240323KT5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '황재균', '73', '5', '7', '20240323삼성KT', '20240323KT6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '장성우', '78', '2', '7', '20240323삼성KT', '20240323KT7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '천성호', '67', '4', '7', '20240323삼성KT', '20240323KT8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '박경수', '68', '11', '7', '20240323삼성KT', '20240323KT81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김상수', '81', '6', '7', '20240323삼성KT', '20240323KT9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '김혜성', '143', '4', '6', '20240323키움KIA', '20240323키움1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '도슨', '146', '8', '6', '20240323키움KIA', '20240323키움2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '임지열', '145', '7', '6', '20240323키움KIA', '20240323키움3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '최주환', '135', '3', '6', '20240323키움KIA', '20240323키움4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '김휘집', '142', '10', '6', '20240323키움KIA', '20240323키움5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '김동헌', '140', '2', '6', '20240323키움KIA', '20240323키움6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '송성문', '141', '5', '6', '20240323키움KIA', '20240323키움7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '이형종', '137', '9', '6', '20240323키움KIA', '20240323키움8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '이재상', '144', '6', '6', '20240323키움KIA', '20240323키움9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '변상권', '138', '11', '6', '20240323키움KIA', '20240323키움91');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '고영우', '136', '11', '6', '20240323키움KIA', '20240323키움92');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '주성원', '139', '11', '6', '20240323키움KIA', '20240323키움93');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '박찬호', '98', '6', '5', '20240323키움KIA', '20240323KIA1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '김도영', '103', '5', '5', '20240323키움KIA', '20240323KIA2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '소크라테스', '96', '7', '5', '20240323키움KIA', '20240323KIA3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '최형우', '93', '10', '5', '20240323키움KIA', '20240323KIA4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '이창진', '101', '11', '5', '20240323키움KIA', '20240323KIA41');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '김선빈', '94', '4', '5', '20240323키움KIA', '20240323KIA5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '이우성', '102', '9', '5', '20240323키움KIA', '20240323KIA6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '황대인', '104', '3', '5', '20240323키움KIA', '20240323KIA7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '한승택', '100', '11', '5', '20240323키움KIA', '20240323KIA71');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김태군', '95', '2', '5', '20240323키움KIA', '20240323KIA8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김호령', '99', '11', '5', '20240323키움KIA', '20240323KIA81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '최원준', '97', '8', '5', '20240323키움KIA', '20240323KIA9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '정은원', '119', '7', '4', '20240324한화LG', '20240324한화1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '최인호', '113', '11', '4', '20240324한화LG', '20240324한화11');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '이원석', '114', '11', '4', '20240324한화LG', '20240324한화12');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '페라자', '112', '9', '4', '20240324한화LG', '20240324한화2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '안치홍', '123', '10', '4', '20240324한화LG', '20240324한화3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '노시환', '121', '5', '4', '20240324한화LG', '20240324한화4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '채은성', '110', '3', '4', '20240324한화LG', '20240324한화5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '문현빈', '124', '4', '4', '20240324한화LG', '20240324한화6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '이도윤', '116', '11', '4', '20240324한화LG', '20240324한화61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '하주석', '111', '6', '4', '20240324한화LG', '20240324한화7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '이재원', '122', '2', '4', '20240324한화LG', '20240324한화8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '임종찬', '118', '8', '4', '20240324한화LG', '20240324한화9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '박해민', '50', '8', '2', '20240324한화LG', '20240324LG1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '홍창기', '49', '9', '2', '20240324한화LG', '20240324LG2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '김현수', '56', '10', '2', '20240324한화LG', '20240324LG3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '오스틴', '57', '3', '2', '20240324한화LG', '20240324LG4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '오지환', '46', '6', '2', '20240324한화LG', '20240324LG5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '문보경', '58', '5', '2', '20240324한화LG', '20240324LG6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '박동원', '53', '2', '2', '20240324한화LG', '20240324LG7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '김현종', '55', '11', '2', '20240324한화LG', '20240324LG71');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '문성주', '48', '7', '2', '20240324한화LG', '20240324LG8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '신민재', '47', '4', '2', '20240324한화LG', '20240324LG9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '윤동희', '178', '8', '8', '20240324롯데SSG', '20240324롯데1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '장두성', '183', '11', '8', '20240324롯데SSG', '20240324롯데11');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '고승민', '176', '7', '8', '20240324롯데SSG', '20240324롯데2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '레이예스', '177', '9', '8', '20240324롯데SSG', '20240324롯데3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '전준우', '189', '10', '8', '20240324롯데SSG', '20240324롯데4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '노진혁', '185', '6', '8', '20240324롯데SSG', '20240324롯데5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '최항', '182', '11', '8', '20240324롯데SSG', '20240324롯데51');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '김민성', '179', '5', '8', '20240324롯데SSG', '20240324롯데6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '황성빈', '181', '11', '8', '20240324롯데SSG', '20240324롯데61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '이주찬', '187', '11', '8', '20240324롯데SSG', '20240324롯데62');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '나승엽', '190', '3', '8', '20240324롯데SSG', '20240324롯데7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '유강남', '191', '2', '8', '20240324롯데SSG', '20240324롯데8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '정훈', '186', '11', '8', '20240324롯데SSG', '20240324롯데81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '정보근', '180', '11', '8', '20240324롯데SSG', '20240324롯데82');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '박승욱', '184', '4', '8', '20240324롯데SSG', '20240324롯데9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '최지훈', '1', '8', '10', '20240324롯데SSG', '20240324SSG1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '박성한', '3', '6', '10', '20240324롯데SSG', '20240324SSG2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '최정', '6', '5', '10', '20240324롯데SSG', '20240324SSG3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '한유섬', '2', '9', '10', '20240324롯데SSG', '20240324SSG4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '하재훈', '13', '11', '10', '20240324롯데SSG', '20240324SSG41');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '에레디아', '7', '7', '10', '20240324롯데SSG', '20240324SSG5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '전의산', '16', '3', '10', '20240324롯데SSG', '20240324SSG6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '오태곤', '15', '11', '10', '20240324롯데SSG', '20240324SSG61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '고명준', '11', '10', '10', '20240324롯데SSG', '20240324SSG7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '박지환', '12', '11', '10', '20240324롯데SSG', '20240324SSG71');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김성현', '4', '4', '10', '20240324롯데SSG', '20240324SSG8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '안상현', '9', '11', '10', '20240324롯데SSG', '20240324SSG81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '조형우', '5', '2', '10', '20240324롯데SSG', '20240324SSG9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '최경모', '14', '11', '10', '20240324롯데SSG', '20240324SSG91');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '이지영', '8', '11', '10', '20240324롯데SSG', '20240324SSG92');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '정수빈', '203', '8', '1', '20240324두산NC', '20240324두산1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '김대한', '210', '11', '1', '20240324두산NC', '20240324두산11');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '라모스', '213', '9', '1', '20240324두산NC', '20240324두산2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '양의지', '205', '2', '1', '20240324두산NC', '20240324두산3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '김재환', '216', '10', '1', '20240324두산NC', '20240324두산4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '양석환', '215', '3', '1', '20240324두산NC', '20240324두산5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '강승호', '209', '4', '1', '20240324두산NC', '20240324두산6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '박계범', '211', '11', '1', '20240324두산NC', '20240324두산61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '허경민', '204', '5', '1', '20240324두산NC', '20240324두산7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김인태', '212', '7', '1', '20240324두산NC', '20240324두산8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김민혁', '207', '11', '1', '20240324두산NC', '20240324두산81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '조수행', '214', '11', '1', '20240324두산NC', '20240324두산82');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '박준영', '206', '6', '1', '20240324두산NC', '20240324두산9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '박민우', '31', '4', '9', '20240324두산NC', '20240324NC1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '권희동', '24', '7', '9', '20240324두산NC', '20240324NC2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '손아섭', '25', '10', '9', '20240324두산NC', '20240324NC3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '데이비슨', '26', '3', '9', '20240324두산NC', '20240324NC4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '박건우', '35', '9', '9', '20240324두산NC', '20240324NC5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '김성욱', '36', '8', '9', '20240324두산NC', '20240324NC6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '최정원', '27', '11', '9', '20240324두산NC', '20240324NC61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '서호철', '34', '5', '9', '20240324두산NC', '20240324NC7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김형준', '32', '2', '9', '20240324두산NC', '20240324NC8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '박세혁', '30', '11', '9', '20240324두산NC', '20240324NC81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김주원', '33', '6', '9', '20240324두산NC', '20240324NC9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '김지찬', '151', '8', '3', '20240324삼성KT', '20240324삼성1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '이성규', '164', '11', '3', '20240324삼성KT', '20240324삼성11');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '김성윤', '156', '9', '3', '20240324삼성KT', '20240324삼성2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '김재혁', '160', '11', '3', '20240324삼성KT', '20240324삼성21');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '구자욱', '162', '7', '3', '20240324삼성KT', '20240324삼성3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '김헌곤', '166', '7', '3', '20240324삼성KT', '20240324삼성31');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '맥키넌', '163', '10', '3', '20240324삼성KT', '20240324삼성4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '강한울', '165', '11', '3', '20240324삼성KT', '20240324삼성41');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '강민호', '152', '2', '3', '20240324삼성KT', '20240324삼성5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '김재성', '154', '11', '3', '20240324삼성KT', '20240324삼성51');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '오재일', '153', '3', '3', '20240324삼성KT', '20240324삼성6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '김현준', '155', '11', '3', '20240324삼성KT', '20240324삼성61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '류지혁', '158', '4', '3', '20240324삼성KT', '20240324삼성7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '전병우', '157', '5', '3', '20240324삼성KT', '20240324삼성8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '안주형', '161', '11', '3', '20240324삼성KT', '20240324삼성81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김영웅', '159', '6', '3', '20240324삼성KT', '20240324삼성9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '배정대', '75', '8', '7', '20240324삼성KT', '20240324KT1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '김민혁', '79', '7', '7', '20240324삼성KT', '20240324KT2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '정준영', '80', '11', '7', '20240324삼성KT', '20240324KT21');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '문상철', '72', '11', '7', '20240324삼성KT', '20240324KT22');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '로하스', '69', '9', '7', '20240324삼성KT', '20240324KT3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '안치영', '76', '11', '7', '20240324삼성KT', '20240324KT31');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '박병호', '77', '3', '7', '20240324삼성KT', '20240324KT4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '강건', '88', '11', '7', '20240324삼성KT', '20240324KT41');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '박경수', '68', '11', '7', '20240324삼성KT', '20240324KT42');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '강백호', '74', '10', '7', '20240324삼성KT', '20240324KT5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '황재균', '73', '5', '7', '20240324삼성KT', '20240324KT6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '장성우', '78', '2', '7', '20240324삼성KT', '20240324KT7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '김준태', '71', '11', '7', '20240324삼성KT', '20240324KT71');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '천성호', '67', '4', '7', '20240324삼성KT', '20240324KT8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김상수', '81', '6', '7', '20240324삼성KT', '20240324KT9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '신본기', '70', '11', '7', '20240324삼성KT', '20240324KT91');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '김지찬', '151', '8', '3', '20240326삼성LG', '20240326삼성1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '김성윤', '156', '9', '3', '20240326삼성LG', '20240326삼성2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '구자욱', '162', '10', '3', '20240326삼성LG', '20240326삼성3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '맥키넌', '163', '5', '3', '20240326삼성LG', '20240326삼성4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '오재일', '153', '3', '3', '20240326삼성LG', '20240326삼성5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '류지혁', '158', '4', '3', '20240326삼성LG', '20240326삼성6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '김현준', '155', '7', '3', '20240326삼성LG', '20240326삼성7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '김헌곤', '166', '11', '3', '20240326삼성LG', '20240326삼성71');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김재성', '154', '2', '3', '20240326삼성LG', '20240326삼성8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김재혁', '160', '11', '3', '20240326삼성LG', '20240326삼성81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '강민호', '152', '11', '3', '20240326삼성LG', '20240326삼성82');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김영웅', '159', '6', '3', '20240326삼성LG', '20240326삼성9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '박해민', '50', '8', '2', '20240326삼성LG', '20240326LG1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '홍창기', '49', '9', '2', '20240326삼성LG', '20240326LG2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '김현수', '56', '10', '2', '20240326삼성LG', '20240326LG3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '오스틴', '57', '3', '2', '20240326삼성LG', '20240326LG4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '오지환', '46', '6', '2', '20240326삼성LG', '20240326LG5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '문보경', '58', '5', '2', '20240326삼성LG', '20240326LG6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '최승민', '52', '11', '2', '20240326삼성LG', '20240326LG61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '박동원', '53', '2', '2', '20240326삼성LG', '20240326LG7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '문성주', '48', '7', '2', '20240326삼성LG', '20240326LG8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '신민재', '47', '4', '2', '20240326삼성LG', '20240326LG9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '최인호', '113', '7', '4', '20240326한화SSG', '20240326한화1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '김강민', '117', '11', '4', '20240326한화SSG', '20240326한화11');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '페라자', '112', '9', '4', '20240326한화SSG', '20240326한화2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '채은성', '110', '10', '4', '20240326한화SSG', '20240326한화3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '노시환', '121', '5', '4', '20240326한화SSG', '20240326한화4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '안치홍', '123', '3', '4', '20240326한화SSG', '20240326한화5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '김태연', '115', '11', '4', '20240326한화SSG', '20240326한화51');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '하주석', '111', '6', '4', '20240326한화SSG', '20240326한화6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '이도윤', '116', '11', '4', '20240326한화SSG', '20240326한화61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '문현빈', '124', '4', '4', '20240326한화SSG', '20240326한화7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '임종찬', '118', '8', '4', '20240326한화SSG', '20240326한화8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '최재훈', '120', '2', '4', '20240326한화SSG', '20240326한화9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '최지훈', '1', '8', '10', '20240326한화SSG', '20240326SSG1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '하재훈', '13', '11', '10', '20240326한화SSG', '20240326SSG11');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '박성한', '3', '6', '10', '20240326한화SSG', '20240326SSG2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '최정', '6', '5', '10', '20240326한화SSG', '20240326SSG3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '최경모', '14', '11', '10', '20240326한화SSG', '20240326SSG31');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '한유섬', '2', '9', '10', '20240326한화SSG', '20240326SSG4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '에레디아', '7', '7', '10', '20240326한화SSG', '20240326SSG5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '고명준', '11', '10', '10', '20240326한화SSG', '20240326SSG6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '전의산', '16', '3', '10', '20240326한화SSG', '20240326SSG7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '이지영', '8', '2', '10', '20240326한화SSG', '20240326SSG8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '박지환', '12', '11', '10', '20240326한화SSG', '20240326SSG81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '안상현', '9', '4', '10', '20240326한화SSG', '20240326SSG9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '김혜성', '143', '4', '6', '20240326키움NC', '20240326키움1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '도슨', '146', '8', '6', '20240326키움NC', '20240326키움2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '김휘집', '142', '5', '6', '20240326키움NC', '20240326키움3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '최주환', '135', '3', '6', '20240326키움NC', '20240326키움4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '임지열', '145', '7', '6', '20240326키움NC', '20240326키움5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '박수종', '233', '11', '6', '20240326키움NC', '20240326키움51');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '김동헌', '140', '2', '6', '20240326키움NC', '20240326키움6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '김재현', '235', '11', '6', '20240326키움NC', '20240326키움61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '이형종', '137', '9', '6', '20240326키움NC', '20240326키움7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '이원석', '114', '10', '6', '20240326키움NC', '20240326키움8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '송성문', '141', '11', '6', '20240326키움NC', '20240326키움81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '이재상', '144', '6', '6', '20240326키움NC', '20240326키움9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '주성원', '139', '11', '6', '20240326키움NC', '20240326키움91');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김윤하', '234', '11', '6', '20240326키움NC', '20240326키움92');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김연주', '150', '11', '6', '20240326키움NC', '20240326키움93');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '변상권', '138', '11', '6', '20240326키움NC', '20240326키움94');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '박민우', '31', '4', '9', '20240326키움NC', '20240326NC1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '권희동', '24', '7', '9', '20240326키움NC', '20240326NC2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '손아섭', '25', '10', '9', '20240326키움NC', '20240326NC3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '데이비슨', '26', '3', '9', '20240326키움NC', '20240326NC4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '도태훈', '236', '11', '9', '20240326키움NC', '20240326NC41');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '박건우', '35', '9', '9', '20240326키움NC', '20240326NC5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '천재환', '29', '11', '9', '20240326키움NC', '20240326NC51');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '김성욱', '36', '8', '9', '20240326키움NC', '20240326NC6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '서호철', '34', '5', '9', '20240326키움NC', '20240326NC7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김형준', '32', '2', '9', '20240326키움NC', '20240326NC8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김주원', '33', '6', '9', '20240326키움NC', '20240326NC9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김한별', '237', '11', '9', '20240326키움NC', '20240326NC92');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '정수빈', '203', '8', '1', '20240326키움NC', '20240326두산1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '라모스', '213', '9', '1', '20240326키움NC', '20240326두산2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '양의지', '205', '2', '1', '20240326키움NC', '20240326두산3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '김재환', '216', '10', '1', '20240326키움NC', '20240326두산4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '조수행', '214', '11', '1', '20240326키움NC', '20240326두산41');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '양석환', '215', '3', '1', '20240326키움NC', '20240326두산5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '강승호', '209', '4', '1', '20240326키움NC', '20240326두산6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '박계범', '211', '11', '1', '20240326키움NC', '20240326두산61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '허경민', '204', '5', '1', '20240326키움NC', '20240326두산7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '박준영', '206', '6', '1', '20240326키움NC', '20240326두산8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김대한', '210', '7', '1', '20240326키움NC', '20240326두산9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김인태', '212', '11', '1', '20240326키움NC', '20240326두산91');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김민혁', '207', '11', '1', '20240326키움NC', '20240326두산92');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '이유찬', '208', '11', '1', '20240326키움NC', '20240326두산93');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '정철원', '221', '11', '1', '20240326키움NC', '20240326두산94');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '배정대', '75', '8', '7', '20240326키움NC', '20240326KT1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '김민혁', '79', '7', '7', '20240326키움NC', '20240326KT2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '정준영', '80', '11', '7', '20240326키움NC', '20240326KT21');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '로하스', '69', '9', '7', '20240326키움NC', '20240326KT3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '박병호', '77', '3', '7', '20240326키움NC', '20240326KT4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '강백호', '74', '10', '7', '20240326키움NC', '20240326KT5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '황재균', '73', '5', '7', '20240326키움NC', '20240326KT6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '장성우', '78', '2', '7', '20240326키움NC', '20240326KT7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '천성호', '67', '4', '7', '20240326키움NC', '20240326KT8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '김상수', '81', '6', '7', '20240326키움NC', '20240326KT9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '황성빈', '181', '8', '8', '20240326롯데KIA', '20240326롯데1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '윤동희', '178', '11', '8', '20240326롯데KIA', '20240326롯데11');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '정보근', '180', '2', '8', '20240326롯데KIA', '20240326롯데12');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '고승민', '176', '7', '8', '20240326롯데KIA', '20240326롯데2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '레이예스', '177', '9', '8', '20240326롯데KIA', '20240326롯데3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '전준우', '189', '10', '8', '20240326롯데KIA', '20240326롯데4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '노진혁', '185', '6', '8', '20240326롯데KIA', '20240326롯데5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '정훈', '186', '3', '8', '20240326롯데KIA', '20240326롯데6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '장두성', '183', '11', '8', '20240326롯데KIA', '20240326롯데61');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '김민성', '179', '5', '8', '20240326롯데KIA', '20240326롯데7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '유강남', '191', '2', '8', '20240326롯데KIA', '20240326롯데8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '나승엽', '190', '11', '8', '20240326롯데KIA', '20240326롯데81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '박승욱', '184', '4', '8', '20240326롯데KIA', '20240326롯데9');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('1', '박찬호', '98', '6', '5', '20240326롯데KIA', '20240326KIA1');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('2', '김도영', '103', '5', '5', '20240326롯데KIA', '20240326KIA2');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('3', '소크라테스', '96', '8', '5', '20240326롯데KIA', '20240326KIA3');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('4', '최형우', '93', '10', '5', '20240326롯데KIA', '20240326KIA4');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('5', '김선빈', '94', '4', '5', '20240326롯데KIA', '20240326KIA5');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('6', '이우성', '102', '9', '5', '20240326롯데KIA', '20240326KIA6');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '이창진', '101', '7', '5', '20240326롯데KIA', '20240326KIA7');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('7', '김호령', '99', '11', '5', '20240326롯데KIA', '20240326KIA71');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '김태군', '95', '2', '5', '20240326롯데KIA', '20240326KIA8');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '황대인', '104', '11', '5', '20240326롯데KIA', '20240326KIA81');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('8', '한승택', '100', '11', '5', '20240326롯데KIA', '20240326KIA82');
INSERT INTO `batter_lineup` (`order`, `player_name`, `player_id`, `position_id`, `team_id`, `match_info_id`, `id`) VALUES ('9', '서건창', '245', '3', '5', '20240326롯데KIA', '20240326KIA9');


INSERT INTO `team_ranking` (`id`, `season`, `rank`, `team_id`, `game`, `win`, `lose`, `draw`) VALUES ('20245', '2024', '1', '5', '2', '2', '0', '0');
INSERT INTO `team_ranking` (`id`, `season`, `rank`, `team_id`, `game`, `win`, `lose`, `draw`) VALUES ('20242', '2024', '2', '2', '3', '2', '1', '0');
INSERT INTO `team_ranking` (`id`, `season`, `rank`, `team_id`, `game`, `win`, `lose`, `draw`) VALUES ('202410', '2024', '2', '10', '3', '2', '1', '0');
INSERT INTO `team_ranking` (`id`, `season`, `rank`, `team_id`, `game`, `win`, `lose`, `draw`) VALUES ('20249', '2024', '2', '9', '3', '2', '1', '0');
INSERT INTO `team_ranking` (`id`, `season`, `rank`, `team_id`, `game`, `win`, `lose`, `draw`) VALUES ('20241', '2024', '2', '1', '3', '2', '1', '0');
INSERT INTO `team_ranking` (`id`, `season`, `rank`, `team_id`, `game`, `win`, `lose`, `draw`) VALUES ('20243', '2024', '2', '3', '3', '2', '1', '0');
INSERT INTO `team_ranking` (`id`, `season`, `rank`, `team_id`, `game`, `win`, `lose`, `draw`) VALUES ('20244', '2024', '2', '4', '3', '2', '1', '0');
INSERT INTO `team_ranking` (`id`, `season`, `rank`, `team_id`, `game`, `win`, `lose`, `draw`) VALUES ('20247', '2024', '8', '7', '3', '0', '3', '0');
INSERT INTO `team_ranking` (`id`, `season`, `rank`, `team_id`, `game`, `win`, `lose`, `draw`) VALUES ('20248', '2024', '8', '8', '3', '0', '3', '0');
INSERT INTO `team_ranking` (`id`, `season`, `rank`, `team_id`, `game`, `win`, `lose`, `draw`) VALUES ('20246', '2024', '8', '6', '2', '0', '2', '0');


INSERT INTO `team` (`name`, `location`, `stadium`, `foundation_year`, `emblem_path`, `team_color`)
VALUES ('두산 베어스', '서울', '잠실 야구장', '1982', '/images/emblems/doosan.png', '#131230'),
       ('LG 트윈스', '서울', '잠실 야구장', '1982', '/images/emblems/lg.png', '#C30452'),
       ('삼성 라이온즈', '대구', '대구 삼성 라이온즈파크', '1982', '/images/emblems/samsung.png', '#074CA1'),
       ('한화 이글스', '대전', '대전 한화생명 이글스파크', '1986', '/images/emblems/hanwha.png', '#FF6600'),
       ('KIA 타이거즈', '광주', '광주 기아 챔피언스필드', '1982', '/images/emblems/kia.png', '#EA0029'),
       ('키움 히어로즈', '서울', '고척 스카이돔', '2008', '/images/emblems/kiwoom.png', '#570514'),
       ('KT 위즈', '수원', '수원 케이티 위즈파크', '2013', '/images/emblems/kt.png', '#000000'),
       ('롯데 자이언츠', '부산', '사직 야구장', '1975', '/images/emblems/lotte.png', '#041E42'),
       ('NC 다이노스', '창원', '창원 NC파크', '2011', '/images/emblems/nc.png', '#315288'),
       ('SSG 랜더스', '인천', '인천 SSG 랜더스필드', '2000', '/images/emblems/ssg.png', '#CE0E2D');


INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240323한화LG', '"0,0,1,1,0,0,0,0,0 "', '2', '7', '1', '3', '"0,2,0,3,1,0,1,1"', '8', '11', '0', '7');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240323롯데SSG', '"0,0,2,0,1,0,0,0,0"', '3', '9', '1', '6', '"2,0,2,0,0,0,1,0"', '5', '8', '1', '4');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240323두산NC', '"0,2,0,0,0,0,0,1,0"', '3', '8', '1', '0', '"0,0,0,0,0,0,2,1,1"', '4', '7', '0', '6');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240323삼성KT', '"0,1,0,0,0,0,1,0,0,4"', '6', '11', '1', '6', '"0,0,1,1,0,0,0,0,0,0"', '2', '5', '2', '5');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240323키움KIA', '"2,0,0,0,0,3,0,0,0"', '5', '7', '0', '2', '"5,0,0,2,0,0,0,0"', '7', '13', '1', '5');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240324한화LG', '"0,0,0,1,1,1,0,4,1"', '8', '11', '0', '3', '"0,0,1,0,0,0,1,0,2"', '4', '10', '0', '2');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240324롯데SSG', '"0,0,0,0,0,0,0,0,6"', '6', '10', '1', '5', '"0,0,0,0,2,0,3,1,1"', '7', '10', '1', '8');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240324두산NC', '"1,0,0,2,0,0,2,0,1"', '6', '10', '2', '4', '"0,0,0,0,0,0,0,3,0"', '3', '7', '1', '4');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240324삼성KT', '"2,1,0,1,0,3,2,2,0"', '11', '18', '0', '9', '"0,0,0,1,0,0,0,0,7"', '8', '16', '2', '1');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240326한화SSG', '"0,0,0,0,4,0,0,2,0"', '6', '6', '1', '4', '"0,0,0,0,0,0,0,0,0"', '0', '3', '1', '5');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240326삼성LG', '"0,0,0,0,0,3,0,0,0"', '3', '8', '0', '3', '"1,0,0,0,1,0,0,1,1"', '4', '8', '1', '5');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240326키움NC', '"0,0,0,0,0,0,1,4,0"', '5', '8', '1', '3', '"4,0,0,1,2,2,0,1"', '10', '11', '0', '11');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240326두산KT', '"0,1,0,3,0,0,3,1,0"', '8', '9', '0', '3', '"0,3,0,0,0,2,0,0,0"', '5', '11', '0', '3');
INSERT INTO `score_board` (`id`, `away_score`, `away_runs`, `away_hits`, `away_error`, `away_bb`, `home_score`, `home_runs`, `home_hits`, `home_error`, `home_bb`) VALUES ('20240326롯데KIA', '"0,0,0,0,0,1,0,0,0"', '1', '6', '0', '5', '"0,0,0,0,0,1,0,1"', '2', '6', '0', '3');

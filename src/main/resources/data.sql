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
CREATE TABLE `team` (
                        `id`	bigint(11)	NOT NULL AUTO_INCREMENT,
                        `name`	VARCHAR(20)	NULL,
                        `location`	VARCHAR(10)	NULL,
                        `stadium`	VARCHAR(30)	NULL,
                        `foundation_year`	YEAR	NULL,
                        `emblem_path`	VARCHAR(200)	NULL,
                        `team_color`	VARCHAR(20)	NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE if exists player;
CREATE TABLE `player` (
                          `id`	bigint(11)	NOT NULL AUTO_INCREMENT,
                          `team_id`	bigint(11)	NULL,
                          `name`	VARCHAR(20)	NULL,
                          `birth`	DATE	NULL,
                          `position`	VARCHAR(10)	NULL,
                          `hand`	VARCHAR(10)	NULL,
                          `uniform_number`	TINYINT	NULL,
                          `photo_path`	VARCHAR(200)	NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE if exists schedule;
CREATE TABLE `schedule` (
                            `id`	VARCHAR(30)	NOT NULL,
                            `match_date`	TIMESTAMP	NULL,
                            `away_team_id`	bigint(11)  NULL,
                            `home_team_id`	bigint(11)	NULL,
                            `stadium`	VARCHAR(30)	NULL,
                            `broadcast`	VARCHAR(100)	NULL,
                            `status`	VARCHAR(20)	NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE if exists score_board;
CREATE TABLE `score_board` (
                               `id`	VARCHAR(30)	NOT NULL,
                               `away_score`	VARCHAR(100)	NULL,
                               `away_runs` SMALLINT 	NULL,
                               `away_stats` varchar(50) null,
                               `home_score`	VARCHAR(100)	NULL,
                               `home_runs` SMALLINT 	NULL,
                               `home_stats` varchar(50) null,
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE if exists batter_record;
CREATE TABLE `batter_record` (
                                 `id`	VARCHAR(30)	NOT NULL,
                                 `player_id`	bigint(11) NOT NULL,
                                 `team_id`	bigint(11) NOT NULL,
                                 `position`	VARCHAR(10)	NULL,
                                 `gs` INT NULL,
                                 `b_order` INT NULL,
                                 `pa`	INT NULL,
                                 `ab`	INT	NULL,
                                 `hits`	INT	NULL,
                                 `doubles`	INT	NULL,
                                 `triples`	INT	NULL,
                                 `homeruns`	INT	NULL,
                                 `bb`	INT	NULL,
                                 `ibb`	INT	NULL,
                                 `hbp`	INT	NULL,
                                 `so`	INT	NULL,
                                 `sb`	INT	NULL,
                                 `cs`	INT	NULL,
                                 `runs`	INT	NULL,
                                 `rbi`	INT	NULL,
                                 `dp`	INT	NULL,
                                 `sc`	INT	NULL,
                                 `sf`	INT	NULL,
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE if exists pitcher_record;
CREATE TABLE `pitcher_record` (
                                  `id`	VARCHAR(30)	NOT NULL,
                                  `player_id`	bigint(11) NOT NULL,
                                  `team_id`	bigint(11) NOT NULL,
                                  `p_order` INT,
                                  `starter`	INT	NULL DEFAULT 0,
                                  `decision`	VARCHAR(10)	NULL,
                                  `innings`	DOUBLE	NULL DEFAULT 0,
                                  `runs`	INT	NULL DEFAULT 0,
                                  `earned_run`	INT	NULL DEFAULT 0,
                                  `tbf` INT	NULL DEFAULT 0,
                                  `ab`	INT	NULL DEFAULT 0,
                                  `hits`	INT	NULL DEFAULT 0,
                                  `doubles`	INT	NULL DEFAULT 0,
                                  `triples`	INT	NULL DEFAULT 0,
                                  `homeruns`	INT	NULL DEFAULT 0,
                                  `bb`	INT	NULL DEFAULT 0,
                                  `ibb`	INT	NULL DEFAULT 0,
                                  `hbp`	INT	NULL DEFAULT 0,
                                  `so`	INT	NULL DEFAULT 0,
                                  `np`	INT	NULL DEFAULT 0,
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE if exists team_ranking;
CREATE TABLE `team_ranking` (
                                `id`	varchar(10) NOT NULL,
                                `season` year not null,
                                `rank` tinyint null,
                                `team_id`	bigint(11) NOT NULL,
                                `game` smallint null,
                                `win` smallint null,
                                `lose` smallint null,
                                `draw` smallint null,

                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE if exists batter_lineup;
CREATE TABLE `batter_lineup` (
                                 `id`	VARCHAR(30)	NOT NULL,
                                 `match_info_id`	VARCHAR(30) NOT	NULL,
                                 `order` VARCHAR(10) NULL,
                                 `position_id` int NULL,
                                 `player_id` bigint(11) NOT NULL,
                                 `player_name` VARCHAR(20) NOT NULL,
                                 `team_id` bigint(11) NOT NULL,

                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE if exists pitcher_lineup;
CREATE TABLE `pitcher_lineup` (
                                  `id`	VARCHAR(30)	NOT NULL,
                                  `match_info_id`	VARCHAR(30) NOT	NULL,
                                  `order` VARCHAR(10) NULL,
                                  `player_id` bigint(11) NOT NULL,
                                  `player_name` VARCHAR(20) NOT NULL,
                                  `team_id` bigint(11) NOT NULL,
                                  `position_id` int NULL,

                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE if exists position;
CREATE TABLE `position` (
                            `id`	tinyint	NOT NULL,
                            `name`	varchar(10) null,

                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
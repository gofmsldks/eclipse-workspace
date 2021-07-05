select version();
CREATE SCHEMA spring_ex DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;



-- 회원 테이블
CREATE TABLE tbl_user (
  user_id VARCHAR(50) NOT NULL,
  user_pw VARCHAR(100) NOT NULL,
  user_name VARCHAR(100) NOT NULL,
  session_key VARCHAR(50) NOT NULL DEFAULT 'none',
  session_limit TIMESTAMP,
  user_email VARCHAR(50) NOT NULL,
  user_join_date TIMESTAMP NOT NULL DEFAULT NOW(),
  user_login_date TIMESTAMP NOT NULL DEFAULT NOW(),
  PRIMARY KEY (user_id)
);


-- 회원 추가
INSERT INTO tbl_user (user_id, user_pw, user_name, user_email) VALUES ('user00', '1234', 'user00', 'user00@mail.com');
INSERT INTO tbl_user (user_id, user_pw, user_name, user_email) VALUES ('user01', '1234', 'user01', 'user01@mail.com');
INSERT INTO tbl_user (user_id, user_pw, user_name, user_email) VALUES ('user02', '1234', 'user02', 'user02@mail.com');
INSERT INTO tbl_user (user_id, user_pw, user_name, user_email) VALUES ('user03', '1234', 'user03', 'user03@mail.com');
INSERT INTO tbl_user (user_id, user_pw, user_name, user_email) VALUES ('user04', '1234', 'user04', 'user04@mail.com');
INSERT INTO tbl_user (user_id, user_pw, user_name, user_email) VALUES ('user05', '1234', 'user05', 'user05@mail.com');
INSERT INTO tbl_user (user_id, user_pw, user_name, user_email) VALUES ('user06', '1234', 'user06', 'user06@mail.com');
INSERT INTO tbl_user (user_id, user_pw, user_name, user_email) VALUES ('user07', '1234', 'user07', 'user07@mail.com');
INSERT INTO tbl_user (user_id, user_pw, user_name, user_email) VALUES ('user08', '1234', 'user08', 'user08@mail.com');
INSERT INTO tbl_user (user_id, user_pw, user_name, user_email) VALUES ('user09', '1234', 'user09', 'user09@mail.com');




-- test를 위한 login 테이블
CREATE TABLE `test`(  
      `id` VARCHAR(10) NOT NULL,
      `pw` VARCHAR(10),
      `name` VARCHAR(10),
    PRIMARY KEY (`id`)
);
 
 
-- 데이터
INSERT INTO TEST(id, pw, NAME) VALUES ( 'id1', 'pw1', 'name1');
INSERT INTO TEST(id, pw, NAME) VALUES ( 'id2', 'pw2', 'name2');
INSERT INTO TEST(id, pw, NAME) VALUES ( 'id3', 'pw3', 'name3');

CREATE SCHEMA spring_ex DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
CREATE TABLE `test`(  
      `id` VARCHAR(10) NOT NULL,
      `pw` VARCHAR(100),
      `name` VARCHAR(10),
    PRIMARY KEY (`id`)
);

Alter TABLE test ADD email VARCHAR(30);
Alter TABLE test ADD position VARCHAR(30);
Alter TABLE test ADD age int(10);
Alter TABLE test ADD phoneNumber VARCHAR(20);
Alter TABLE test ADD naver_login VARCHAR(50);
Alter TABLE test ADD kakao_login VARCHAR(50);
Alter TABLE test change age age VARCHAR(30);


SELECT * FROM test;


INSERT INTO test (id, pw, name, email, position, age, phoneNumber) VALUES ('user00', '1234', '김00', 'user00@mail.com','사원', 27 ,'010-1111-1111');
INSERT INTO test (id, pw, name, email, position, age, phoneNumber) VALUES ('user01', '1234', '이00', 'user01@mail.com','사원', 28 ,'010-2222-2222');
INSERT INTO test (id, pw, name, email, position, age, phoneNumber) VALUES ('user02', '1234', '박00', 'user02@mail.com','사원', 26 ,'010-3333-3333');
INSERT INTO test (id, pw, name, email, position, age, phoneNumber) VALUES ('user03', '1234', '최00', 'user03@mail.com','대리', 31 ,'010-4444-4444');
INSERT INTO test (id, pw, name, email, position, age, phoneNumber) VALUES ('user04', '1234', '곽00', 'user04@mail.com','대리', 33 ,'010-5555-5555');
INSERT INTO test (id, pw, name, email, position, age, phoneNumber) VALUES ('user05', '1234', '고00', 'user05@mail.com','과장', 37 ,'010-6666-6666');
INSERT INTO test (id, pw, name, email, position, age, phoneNumber) VALUES ('user06', '1234', '마00', 'user06@mail.com','과장', 35 ,'010-7777-7777');
INSERT INTO test (id, pw, name, email, position, age, phoneNumber) VALUES ('user07', '1234', '윤00', 'user07@mail.com','책임', 43 ,'010-8888-8888');
INSERT INTO test (id, pw, name, email, position, age, phoneNumber) VALUES ('user08', '1234', '정00', 'user08@mail.com','책임', 47 ,'010-9999-9999');
INSERT INTO test (id, pw, name, email, position, age, phoneNumber) VALUES ('user09', '1234', '용00', 'user09@mail.com','팀장', 49 ,'010-1010-1010');
INSERT INTO test (id, pw, name, email, position, age, phoneNumber) VALUES ('user10', '1234', '임00', 'user10@mail.com','팀장', 50 ,'010-0000-0000');

update test set email = '' WHERE id = 'test1';
update test set age = '27' WHERE id = 'test1';
update test set phoneNumber = '010-6576-2728' WHERE id = 'test1';
update test set position = '사원' WHERE id = 'test1';

delete from test where id = 'navertest';
delete from test where id = 'kakaotest';

SELECT * FROM test;





DROP TABLE IF EXISTS `test_list`;
CREATE TABLE `test_list`(  
      `po_number` VARCHAR(50) not null,
      `send` VARCHAR(50) not null,
      `receive` VARCHAR(50) not null,
      `start_date` DATE not null,
      `end_date` DATE not null,
      `price` VARCHAR(50) not null,
      `user_name` VARCHAR(50) not null,
    PRIMARY KEY (`po_number`)

);


INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('1', '세방리튬', '00머테리얼', '2021-08-05','2021-08-09', '100,000' ,'test1');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('2', '세방리튬', '00머테리얼', '2021-08-05','2021-08-09', '200,000' ,'test1');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('3', '세방리튬', '00머테리얼', '2021-08-05','2021-08-09', '300,000' ,'test1');

INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('4', '세방리튬', '00자동차', '2021-08-05','2021-08-09', '100,000' ,'김형원');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('5', '세방리튬', '00자동차', '2021-08-05','2021-08-09', '200,000' ,'김형원');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('6', '세방리튬', '00자동차', '2021-08-05','2021-08-09', '300,000' ,'김형원');

INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('7', '세방리튬', '00화학', '2021-08-05','2021-08-09', '100,000' ,'test3');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('8', '세방리튬', '00화학', '2021-08-05','2021-08-09', '200,000' ,'test3');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('9', '세방리튬', '00화학', '2021-08-05','2021-08-09', '300,000' ,'test3');

INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('10', '세방리튬', '00자동차', '2021-08-05','2021-08-09', '400,000' ,'김형원');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('11', '세방리튬', '00자동차', '2021-08-05','2021-08-09', '450,000' ,'김형원');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('12', '세방리튬', '00자동차', '2021-08-05','2021-08-09', '550,000' ,'김형원');

INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('13', '세방리튬', '00기계', '2021-08-15','2021-08-15', '300,000' ,'김형원');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('14', '세방리튬', '00기계', '2021-08-09','2021-08-20', '550,000' ,'김형원');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('15', '세방리튬', '00기계', '2021-08-10','2021-08-25', '650,000' ,'김형원');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('16', '세방리튬', '00기계', '2021-08-11','2021-08-26', '200,000' ,'김형원');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('17', '세방리튬', '00기계', '2021-08-12','2021-08-27', '450,000' ,'김형원');
INSERT INTO test_list (po_number, send, receive, start_date, end_date, price, user_name) VALUES ('18', '세방리튬', '00기계', '2021-08-13','2021-08-28', '750,000' ,'김형원');
select * from test_list;
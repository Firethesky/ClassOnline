CREATE DATABASE  IF NOT EXISTS `javaweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `javaweb`;

DROP TABLE IF EXISTS `messages`;
create table messages
(
    id      int auto_increment
        primary key,
    title   varchar(50)                        not null,
    content text                               null,
    author  varchar(50)                        null,
    time    datetime default CURRENT_TIMESTAMP null
);

INSERT INTO javaweb.messages (id, title, content, author, time) VALUES (4, 'El Psy Congroo', '不论是“加强思想”还是“紧随未知”，亦或是“缩小未知”。要表现的只是，“打破未知”的这种感觉', '黄薮郁', '2024-12-05 17:03:36');
INSERT INTO javaweb.messages (id, title, content, author, time) VALUES (17, '这里可以提交留言', '22222222222222222222', '谢聪颖', '2024-12-22 18:12:43');
INSERT INTO javaweb.messages (id, title, content, author, time) VALUES (18, '这个作业好难做啊', '该死!!!!!!!!!', '杨清琪', '2024-12-22 18:14:57');


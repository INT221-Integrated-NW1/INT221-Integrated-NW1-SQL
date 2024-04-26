create database nw1;
ALTER DATABASE nw1 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use nw1;
CREATE TABLE tasks (task_id int NOT NULL AUTO_INCREMENT,task_title varchar(100) NOT NULL,task_description varchar(500) DEFAULT NULL,task_assignees varchar(30) DEFAULT NULL,task_status enum('No_Status','To_Do','Doing','Done') NOT NULL,created_on datetime NOT NULL,updated_on datetime NOT NULL,PRIMARY KEY (task_id))ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
SET GLOBAL time_zone = '+00:00';
SELECT @@global.time_zone AS global_time_zone, @@session.time_zone AS session_time_zone;

INSERT INTO tasks (task_title, task_description, task_assignees, task_status, created_on, updated_on)
VALUES ('TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0', 'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5', 'Assignees1Assignees2Assignees3', 'No_Status', '2024-04-22 09:00:00', '2024-04-22 09:00:00');

INSERT INTO tasks (task_title, task_description, task_assignees, task_status, created_on, updated_on)
VALUES ('Repository', '', '', 'To_Do', '2024-04-22 09:05:00', '2024-04-22 14:00:00');

INSERT INTO tasks (task_title, task_description, task_assignees, task_status, created_on, updated_on)
VALUES ('ดาต้าเบส', 'ສ້າງຖານຂໍ້ມູນ', 'あなた、彼、彼女 (私ではありません)', 'Doing', '2024-04-22 09:10:00', '2024-04-25 00:00:00');

INSERT INTO tasks (task_title, task_description, task_assignees, task_status, created_on, updated_on)
VALUES ('Infrastructure', 'Setup containers', 'ไก่งวง กับ เพนกวิน', 'Done', '2024-04-22 09:15:00', '2024-04-22 10:00:00');

SELECT * FROM nw1.tasks;
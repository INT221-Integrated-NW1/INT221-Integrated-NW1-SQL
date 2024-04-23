CREATE DATABASE  IF NOT EXISTS nw1;

USE nw1;

DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
  taskId int NOT NULL,
  taskTitle varchar(100) NOT NULL,
  taskDescription varchar(500) DEFAULT NULL,
  taskAssignees varchar(30) DEFAULT NULL,
  taskStatus enum('No Status','To Do','Doing','Done') NOT NULL,
  createdOn datetime NOT NULL,
  updatedOn datetime NOT NULL,
  PRIMARY KEY (taskId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO tasks (taskId, taskTitle, taskDescription, taskAssignees, taskStatus, createdOn, updatedOn)
VALUES (1, 'TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0', 'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5', 'Assignees1Assignees2Assignees3', 'No Status', '2024-04-22 09:00:00', '2024-04-22 09:00:00');

INSERT INTO tasks (taskId, taskTitle, taskDescription, taskAssignees, taskStatus, createdOn, updatedOn)
VALUES (2, 'Repository', '', '', 'To Do', '2024-04-22 09:05:00', '2024-04-22 14:00:00');

INSERT INTO tasks (taskId, taskTitle, taskDescription, taskAssignees, taskStatus, createdOn, updatedOn)
VALUES (3, 'ดาต้าเบส', 'ສ້າງຖານຂໍ້ມູນ', 'あなた、彼、彼女 (私ではありません)', 'Doing', '2024-04-22 09:10:00', '2024-04-25 00:00:00');

INSERT INTO tasks (taskId, taskTitle, taskDescription, taskAssignees, taskStatus, createdOn, updatedOn)
VALUES (4, 'Infrastructure', 'Setup containers', 'ไก่งวง กับ เพนกวิน', 'Done', '2024-04-22 09:15:00', '2024-04-22 10:00:00');
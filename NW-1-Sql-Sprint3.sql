use nw1;
CREATE TABLE status (
  status_id int NOT NULL AUTO_INCREMENT,
  status_description varchar(200),
  status_name varchar(50) NOT NULL UNIQUE,
  PRIMARY KEY (status_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
CREATE TABLE tasks (
  task_id int NOT NULL AUTO_INCREMENT,
  task_title varchar(100) NOT NULL,
  task_description varchar(500) DEFAULT NULL,
  task_assignees varchar(30) DEFAULT NULL,
  created_on datetime  NOT NULL DEFAULT (utc_timestamp()),
  updated_on datetime NOT NULL DEFAULT (utc_timestamp()),
  status_id int NOT NULL, 
  PRIMARY KEY (task_id)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET GLOBAL time_zone = '+00:00';
SELECT @@global.time_zone AS global_time_zone, @@session.time_zone AS session_time_zone;
INSERT INTO status (status_description, status_name) VALUES ('The Default Status', 'No Status');
INSERT INTO status (status_description, status_name) VALUES ('', 'TO Do');
INSERT INTO status (status_description, status_name) VALUES ('Being Worked on', 'Doing');
INSERT INTO status (status_description, status_name) VALUES ('Finished', 'Done');

INSERT INTO tasks (task_id, task_title, task_description, task_assignees, created_on, updated_on, status_id)
VALUES (1, 'TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0', 'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5', 'Assignees1Assignees2Assignees3', '2024-04-22 09:00:00', '2024-04-22 09:00:00'
,1);

INSERT INTO tasks (task_id, task_title, task_description, task_assignees, created_on, updated_on, status_id)
VALUES (2, 'Repository', '', '', '2024-04-22 09:05:00', '2024-04-22 14:00:00',2);

INSERT INTO tasks (task_id, task_title, task_description, task_assignees, created_on, updated_on, status_id)
VALUES (3, 'ดาต้าเบส', 'ສ້າງຖານຂໍ້ມູນ', 'あなた、彼、彼女 (私ではありません)', '2024-04-22 09:10:00', '2024-04-25 00:00:00',3);

INSERT INTO tasks (task_id, task_title, task_description, task_assignees, created_on, updated_on, status_id)
VALUES (4, '_Infrastructure_', '_Setup containers_', 'ไก่งวง กับ เพนกวิน', '2024-04-22 09:15:00', '2024-04-22 10:00:00',4);

DELIMITER //
CREATE TRIGGER before_insert_and_update_tasks
BEFORE INSERT ON tasks
FOR EACH ROW
BEGIN
    
    IF NEW.task_title IS NOT NULL THEN
        SET NEW.task_title = TRIM(NEW.task_title);
    END IF;
    
    IF NEW.task_description IS NOT NULL THEN
        SET NEW.task_description = TRIM(NEW.task_description);
    END IF;
    
    IF NEW.task_assignees IS NOT NULL THEN
        SET NEW.task_assignees = TRIM(NEW.task_assignees);
    END IF;
END;
//

CREATE TRIGGER update_updatedOn_before_updates
BEFORE UPDATE ON tasks
FOR EACH ROW
BEGIN
    SET NEW.updated_on = UTC_TIMESTAMP();
END;
//

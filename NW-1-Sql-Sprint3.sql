-- nw1_2+collabs-- 
  
CREATE SCHEMA IF NOT EXISTS `nw1_2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `nw1_2`;
SET GLOBAL time_zone = '+00:00';
 
 
DROP TABLE IF EXISTS `tasks`;
DROP TABLE IF EXISTS `boardStatus`;
DROP TABLE IF EXISTS `collaborators`;
DROP TABLE IF EXISTS `boards`;
DROP TABLE IF EXISTS `Users`;
DROP TABLE IF EXISTS `status`;
 
CREATE TABLE `Users` (
    `oid` VARCHAR(100) PRIMARY KEY NOT NULL,
    `name` VARCHAR(50) NOT NULL,
     `email` VARCHAR(50) 
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- INSERT INTO `Users` (`oid`, `name`)
-- VALUES
-- ('995a830b-6c62-45e6-ab89-1077dff55a72', 'ITBKK SIAM'),
-- ('aae33b35-a42f-4791-996c-65988e8eefc4','ITBKK KITTIWUT');
--  
 
CREATE TABLE `boards` (
`board_id` VARCHAR(10) PRIMARY KEY  NOT NULL,
`board_name` VARCHAR(120) NOT NULL,
`visibility` VARCHAR(10) DEFAULT 'PRIVATE',
`oid` VARCHAR(100) NOT NULL,
`created_On` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`oid`) REFERENCES `Users`(`oid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- INSERT INTO `boards` (`boardId`, `boardName`, `createdOn`, `updatedOn`, `userId`)
-- VALUES
-- ('kR0tt3hz1x', 'board1', '2024-5-14 10:00:00', '2024-5-14 10:00:00', 1);
-- INSERT INTO `boards` (board_id, board_name, oid, visibility)

-- VALUES ('kR0tt3hz1x', 'board1', '995a830b-6c62-45e6-ab89-1077dff55a72', 'PRIVATE');
--  
CREATE TABLE `status` (
    `status_id` VARCHAR(15) PRIMARY KEY NOT NULL,
    `status_name` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
`status_description` VARCHAR(200) DEFAULT NULL
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `status` (status_id, status_name, status_description)
VALUES
('000000000000001', 'No Status', 'The default status'),
('000000000000002', 'To Do', 'This is To Do'),
('000000000000003', 'Doing', 'Being worked on'),
('000000000000004', 'Done', 'Finished');
 
CREATE TABLE tasks (
`task_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`task_title` VARCHAR(100) NOT NULL,
`task_description` VARCHAR(500) NULL DEFAULT NULL,
`task_assignees` VARCHAR(30) NULL DEFAULT NULL,
  `created_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`status_id` VARCHAR(15) NOT NULL,
`board_id` VARCHAR(10) NOT NULL,
    FOREIGN KEY (board_id) REFERENCES boards(board_id),
    FOREIGN KEY (status_id) REFERENCES status(status_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- insert into tasks (task_title, created_on, updated_on, status_id, board_id)
-- value
-- ("NS02", '2024-5-14 10:00:00', '2024-5-14 10:00:00', '000000000000001', 'kR0tt3hz1x'),
-- ("NS03", '2024-5-14 10:10:00', '2024-5-14 10:10:00', '000000000000002', 'kR0tt3hz1x'),
-- ("NS04", '2024-5-14 10:20:00', '2024-5-14 10:20:00', '000000000000001', 'kR0tt3hz1x'),
-- ("NS05", '2024-5-14 10:30:00', '2024-5-14 10:30:00', '000000000000001', 'kR0tt3hz1x'),
-- ("NS06", '2024-5-14 10:40:00', '2024-5-14 10:40:00', '000000000000001', 'kR0tt3hz1x');
--  
CREATE TABLE boardStatus (
`bsId` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`board_id` VARCHAR(10) NOT NULL,
`status_id` VARCHAR(15) NOT NULL,
    FOREIGN KEY (board_id) REFERENCES boards(board_id),
    FOREIGN KEY (status_id) REFERENCES status(status_id)
    ON DELETE CASCADE
   --  ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- insert into boardStatus (bsId, board_id, status_id)
-- value
-- (1, "kR0tt3hz1x", "000000000000001"),
-- (2, "kR0tt3hz1x", "000000000000002"),
-- (3, "kR0tt3hz1x", "000000000000003"),
-- (4, "kR0tt3hz1x", "000000000000004");

 CREATE TABLE `collaborators` (
    `collab_id` INT PRIMARY KEY AUTO_INCREMENT,
    `board_id` VARCHAR(10) NOT NULL,
    `oid` VARCHAR(100) NOT NULL,
    `access_right` enum("READ", "WRITE"),
    `added_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `email` VARCHAR(100) NOT NULL,
    FOREIGN KEY (`board_id`) REFERENCES `boards`(`board_id`) ON DELETE CASCADE,
    FOREIGN KEY (`oid`) REFERENCES `Users`(`oid`) ON DELETE CASCADE,
    UNIQUE KEY (`board_id`, `oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- INSERT INTO `BoardCollaborators` (board_id, collaborator_oid, access_right)
-- VALUES
-- ('kR0tt3hz1x', '995a830b-6c62-45e6-ab89-1077dff55a72', 'WRITE'),
-- ('kR0tt3hz1x', 'collab123456', 'READ'),
-- ('kR0tt3hz2x','995a830b-6c62-45e6-ab89-1077dff55a72','READ');
DELIMITER boardsboards//
CREATE TRIGGER before_insert_and_update_tasks
BEFORE INSERT ON tasks
FOR EACH ROW
BEGIN
    IF NEW.task_title IS NOT NULL THEN
        SET NEW.task_title = TRIM(NEW.task_title); -- Correct trimming of task_title
    END IF;
 
    IF NEW.task_description IS NOT NULL THEN
        SET NEW.task_description = TRIM(NEW.task_description); -- Correct trimming of task_description
    END IF;
 
    IF NEW.task_assignees IS NOT NULL THEN
        SET NEW.task_assignees = TRIM(NEW.task_assignees); -- Correct trimming of task_assignees
    END IF;
END;
 
CREATE TRIGGER update_updatedOn_before_updates
BEFORE UPDATE ON tasks
FOR EACH ROW
BEGIN
    SET NEW.updated_on = UTC_TIMESTAMP();
END;
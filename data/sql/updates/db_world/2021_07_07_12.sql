-- DB update 2021_07_07_11 -> 2021_07_07_12
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_07_07_11';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_07_07_11 2021_07_07_12 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1625410362418489198'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1625410362418489198');

UPDATE `gameobject` SET `spawntimesecs` = 0 WHERE `id` = 2842 AND `guid` = 10643;
UPDATE `gameobject` SET `spawntimesecs` = 0 WHERE `id` = 2848 AND `guid` = 10644;
UPDATE `gameobject` SET `spawntimesecs` = 0 WHERE `id` = 2858 AND `guid` = 10830;

--
-- END UPDATING QUERIES
--
UPDATE version_db_world SET date = '2021_07_07_12' WHERE sql_rev = '1625410362418489198';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;

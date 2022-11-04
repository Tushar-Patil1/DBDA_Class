# Triggers -> Use for data validation

select trigger_name,EVENT_OBJECT_TABLE from information_schema.triggers where information_schema.triggers.trigger_schema like '%<database_name>%' and  EVENT_OBJECT_TABLE = '<table_name> ';

use timepass;

create table trg (num int(10));

Delimiter /

CREATE TRIGGER chknum BEFORE INSERT ON trg 
FOR EACH ROW

Begin

	IF NEW.num < 0 THEN SET NEW.num = 0;
	ELSEIF NEW.num > 100 THEN SET NEW.num = 100;
	END IF;
END /

Delimiter ;

insert into trg values(10);
insert into trg values(10),(20),(-25),(30),(178);

select * from trg;

select trigger_name,EVENT_OBJECT_TABLE from information_schema.triggers where information_schema.triggers.trigger_schema like '%timepass%' and  EVENT_OBJECT_TABLE = 'trg ';

select trigger_name,EVENT_OBJECT_TABLE from information_schema.triggers where information_schema.triggers.trigger_schema = 'timepass' and  EVENT_OBJECT_TABLE = 'trg ';

show triggers;


-- Restting the value

-- num <0 -- 0
-- num>100 -- 100

create table trg (num int(10));

-- BEFORE
-- ------------

Delimiter /

CREATE TRIGGER chknum BEFORE INSERT ON trg 
FOR EACH ROW

Begin

	IF NEW.num < 0 THEN SET NEW.num = 0;
	ELSEIF NEW.num > 100 THEN SET NEW.num = 100;
	END IF;
END /

Delimiter ;

CREATE TABLE empBackup
(
	empid varchar(10),
	empname varchar(10),
	updateDate timestamp
);

Delimiter //

CREATE TRIGGER empbk BEFORE UPDATE on employee
FOR EACH ROW
BEGIN

	insert into empbackup set empid = OLD.employeeid, empname = OLD.efname,
	updatedate = current_timestamp; 
End //

Delimiter ;
UPDATE employee set designation = 'Senior Manager' where elname = 'Mehta';
update employee set efname = 'Amitabh' where employeeid = 'E001';

#----------------------------------------------------------------------------------------------------------------------------
Delimiter /
CREATE PROCEDURE chkyr (IN yrr int(10))
BEGIN
	IF yrr < 1900 THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = ' Sorry, year of joining can not be less than 1900';
	END IF;
	
	IF yrr > 2022 THEN SIGNAL SQLSTATE '45001'
		SET MESSAGE_TEXT = ' Sorry, year of joining can not future year';
	END IF;

END /

Delimiter ;

-- --> Related -- Trigger

Delimiter /

CREATE TRIGGER checkBeforeMemberUpdate BEFORE INSERT ON member
FOR EACH ROW
BEGIN
	CALL chkyr(year(NEW.DOJ)) ;	
END /
Delimiter ;


insert into member values ('M014','Nauka','Menon','P001','1867-12-25','Female','Active');
Delimiter /


CREATE TRIGGER checkBeforeMbrUpdate BEFORE UPDATE ON member
FOR EACH ROW
BEGIN
	CALL chkyr(year(NEW.DOJ)) ;	
END /
Delimiter ;
update member set doj = '2050-01-01' where memberid = 'M012';

-- To see all the triggers on a table
-- -------------------------------------------
select trigger_name,EVENT_OBJECT_TABLE from information_schema.triggers where information_schema.triggers.trigger_schema like '%<database_name>%' and  EVENT_OBJECT_TABLE = '<table_name> ';



















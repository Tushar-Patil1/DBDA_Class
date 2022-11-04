SELECT * FROM city;

#Create Procedure
Delimiter /
create procedure getAllCity()
begin
	select  * from city;
end /

Delimiter ;

#Call Procedure
call getAllCity;

SELECT ROUTINE_NAME,ROUTINE_TYPE FROM INFORMATION_SCHEMA.ROUTINES where ROUTINE_TYPE = 'PROCEDURE' AND ROUTINE_SCHEMA = 'world';
#####################################################3
Delimiter /
create procedure allDistrict()
begin
select district from city;
end /

Delimiter ;

call allDistrict();
#######################################
delimiter /
create procedure calltwoprocedure()
begin
call allDistrict;
call getAllCity;
end /

delimiter ;

call calltwoprocedure();
###################################################
select * from city where countrycode = "IND";

delimiter /
create procedure getcityInfo(IN ccd varchar(10))
begin
select * from city where countrycode = "IND";
end /
delimiter ;

call getcityinfo("AFG");
call getcityInfo("IND");

####################################

delimiter /
create procedure getCityinfo2(in ccd varchar(20), in dst varchar(25))
begin
select * from city where countrycode=ccd and district = dst;
end /
delimiter ;

call getCityinfo2("IND","Gujarat");

##########################################

select count(district) from city group by district having district = "Maharashtra";

delimiter /
create procedure getDistrictCount(in dst varchar(25))
begin
select count(district) from city group by district having district = "Maharashtra";
end /
delimiter ;

call getDistrictCount("Gujarat");

#=====================================

set @sal = 1000000;
select @sal;
#================================

delimiter /
create procedure getDistrictCount2(in dst varchar(25), out cnt int(10))
begin
select count(district) from city group by district having district = "Maharashtra" into cnt;
end /
delimiter ;

call getDistrictCount2("Gujarat", @cnt);

select @cnt;

Select ' The numebr of district members are', @cnt;
#==================================================
-- SELECT columns  
-- FROM table1   
-- INNER JOIN table2  
-- ON table1.column = table2.column;  







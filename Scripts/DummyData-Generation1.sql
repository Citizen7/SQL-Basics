/* This script will ADD some dummy data to the DATABASE for the sake of testing.
ASSUMPTION: ALL tables are created AND empty.
This script needs to be run BEFORE DummyData-Generation2.sql, AS FOREIGN keys depend ON it.
*/


insert into dbo.Users(LoginName, Password, EmailAddress) values
('sysadmin', 'donotusethispassword', 'sysadmin@test.com')
,('Mengue.Patricia', 'donotusethispassword','pmengue1@globo.com')
,('Wewell.Barret', 'donotusethispassword','bwewell2@nyu.edu')
,('Medland.Nicolina','donotusethispassword','nmedland2@unblog.fr')
,('Gitting.Adeline','donotusethispassword','agitting3@parallels.com')
,('Bodley.Nessi','donotusethispassword','nbodley4@aboutads.info')
,('Rudd.Connie','donotusethispassword','crudd5@usatoday.com')
,('Willes.April','donotusethispassword','awilles6@ycombinator.com')
,('Fearon.Mehetabel','donotusethispassword','mfearon7@tripod.com')
,('Jaspar.Sibylle','donotusethispassword','sjaspar8@1688.com');


insert into dbo.PersonType([Name]) values ('Customer'),('Guest'),('Manager'),('Dependent'),('Stranger');
insert into dbo.PersonStatus([Name]) values ('Active'), ('Suspended'), ('Closed'), ('Pending');
insert into dbo.PersonGender([Name]) values ('Male'), ('Female'), ('Nonbinary');


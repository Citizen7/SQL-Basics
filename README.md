# SQL-Basics
This is an example of a SQL data structure that allows for a record of changes. 
The structure includes a Person table, with the PersonData being stored in a separate table. Records in this table are Start- and End- dated, so that a database manager can see who made changes, when, and what those changes were.

## Instructions
This is presented as a proof-of-concept and isn't meant to simply be added as-is into an existing data structure. In order to test it, however, follow these steps:
1. Create a new database.
2. Run the creation scripts for tables in this order: Users, Person, PersonType, PersonStatus, PersonGender, PersonData.
3. Run the creation scripts for views in this order: vw_Person, vw_PersonCurrent, vw_PersonData, vw_PersonDataCurrent.
4. Run the creation scripts for functions.
5. Run the creation scripts for stored procedures.
6. Run "DummyData-Generation1.sql", followed by "DummyData-Generation2.sql".
7. **Congratulations,** you now have test data ready to go. Execute the stored procedures as desired.

## More Details
The start/end date concept allows for extremely robust reports to be written easily. Because a program (C#, VB, or any other language) interacts with the database through stored procedures instead of through direct ``UPDATE`` or ``INSERT`` statements, it allows the data to be strutured and consistent, as well as allowing more layers of security between the user and the database. Foreign-keying values that will be drawn from a limited pool of answers (e.g. types, statuses, etc) helps keep internal consistency.

The current example UpdatePerson stored procedure has been created in such a way that nullable fields can be nulled. This needs to be considered when creating the front-end interface, as you would not want a user to try to update a person's status and inadvertently delete their name.

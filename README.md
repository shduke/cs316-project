# cs316-project

## Creating the database

In order to create the database run the following postgresql commands:
'''
createdb financedb
psql financedb
\i databaseCreation.sql
'''

This will first create the database, then enter the database, and then run the script to load all of the tables.
If the database has already been created run the following postgresql commands and then run the commands above:

'''
\c template0
dropdb financedb;
'''

This will checkout a different database and then drop the financedb database.

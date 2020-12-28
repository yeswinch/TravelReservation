# PrinInfo-DBTravelRes
Principles Of Information and Data Management Travel reservation Project
## Overview
## Importing
Front-end Java files and JSP files are contained in zip files. Note draft 1 does not have back-end.
This project connected the java files(with HTML/CSS contained within) to a locally hosted MYSQL 8.0 Server
via mysql-connector-java-8.0.19.jar and Tomcat v7.0 Server. To import the Database download the .sql file to a folder. 
Then using the MySQL Server Command Line client create an empty database with the same name(airlinedb). If it 
exists already use drop table. In Command Prompt cd to C:\Program Files\MySQL\MySQL Server 8.0\bin
Then run -h 127.0.0.1 -u root -p airlinedb<c:\folder_name\airlinedb.sql
Where folder_name is wherever the sql file has been downloaded to.
## Goals
This repo contains the Principles of Data Management Semester Project. It is a basic travel reservation website. The user can create an account, login, and reserve
flights. This information is saved via our database and can be managed or viewed by admin accounts and user accounts. For a full functionality list see the projectChecklist.docx
The portion of the project I have posted is mainly only the admin functionalities. Ultimately, the goal of this project is to display my MYSQL proficiency as well as complete the tasks laid out by Rutgers.
## Draft 1
Contains files for original login functions and no other significant part of the project.
## Spring 2020_FIN
The completed project that was turned into Rutgers University-New Brunswick. Cut short by COVID, this version is the full stack dev project. 
Using JSP files with Java(no CSS), and a locally hosted database, most of the original goals of this project was completed.The sql file has the database the is updated and queried via the uploaded Java Project. The Java project was opened and viewed in Eclipse IDE and can be run on a Tomcat Server. To run this version on Tomcat, simply run frontpage.jsp on the server. Use admin login to view admin functions. Note, many customer functions were not merged.
## Summer_FINAL(ADMIN)
This version fixes Sales Stats function and query bugs as well as completes the Flight statistics for the Administrator page. To view most comeplete version of the project, import this version. Check out the ER Diagram in this folder(diagram to represent the schema of airlinedb).

# README

The admin API is responsible for creating, reading, updating, and deleting SketchyMedical/SketchyNursing resources. 
Each request to this API is to be authorized before performing any actions on the resources. 
The resources in the domains are Packages (also known as 'Courses'), Courses (also known as 'Units'), chapters, 
sections (also known as 'Videos'), sketchy symbols (also known as 'Hotspots'), Video Questions, and Qbank Questions.

Installation
------------
1. In the directory, run this command
`bundle install`

2. Ensure that you have both Authentication and Authorization apps running. In order to run each of them, go to each 
app's directory and use the following commands `rails s -p 3002` (Authentication) and 
`rails s -p 3003` (Authorization)

3. After the gems have been successfully installed for this project, run the API using this command
`rails s -p 3001`

Notes
------------
* Use the command `rake routes` to see the routes available for the API
* Use the [documentation](https://sketchyadmin.docs.apiary.io/#) for more directions on how-to use the API


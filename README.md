# Txt2data

The purpose of this web application is to make it easy for humans classify texts cleanly.

Use cases include:
- collecting data about text and image sources with a large group
- building training data sets for ML projects
- reviewing predicted outcomes from ML projects

# Installation
To run the beta version, clone this repository where you'd like the files to live on your computer
This requires you have ruby and rails installed on your machine.
```
git clone https://github.com/anisfeld/txt2data.git
cd txt2data/txt2data
bundle install
rails db:migrate
rails db:seed
rails server
```

# Starting a project
Before you can create a project you must create a Txt2Data account (sign up).

Next navigate to the projects page. If you are logged in you will be greated with a link allowing you to start a project.
A project keeps high-level information about your endeavor, including a name, a description and a logo.

Next you can add data for analysis.
Text data should be stored in a two column csv with the names *id* and *text*.

# Analyzing data
Once your data is uploaded you can go through each text and copy important words into preset forms (in future versions users will define the form fields). This information will be stored in a database and cleanly associated with the text. Your data is now labeled and ready for Natural Language Processing.





>>>>>>> 0742184496a4be0a1c3c33f69232369378cd2aaf

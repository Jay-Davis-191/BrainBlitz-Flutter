# Student Helper - Flutter

## Description
This project is a remake of a previous app I created but developed using Flutter and NodeJS. The original was a native Android app using Android Studio, which can be found under my other repositories called Student Helper. 

This project involves three major features: Reminders, Flashcards and a fun twist on the math game from the show, 8 Out of 10 Cats does Countdown. This project is aimed to helped students (uni students included), with their engagement and management of their studies and tasks.

This project has a dedicated cloud PostGRESQL database via AWS, and connects to the database through a backend connection developed with NodeJS. 

## Development and Timeframe
This app has been built with Flutter and Dart so it can support cross-platform, but all initial testing was done through a Web simulator. 

This project utilises a cloud database via AWS to retrieve and store all user information and content. In order for the app to access the AWS database, the associated backend NodeJS program has to run in order for the connection to establish. 

As this was a Flutter-remake of one of my previous projects, I saved a reasonable amount of time by keeping the same design and ideas. It took me roughly 1 week to create this app with about approximately 30% of the total time spent on configuring, troubleshooting and connecting the AWS database.

For upcoming development, I will be finalising the design of the app and implementing a profile paeg where the user can check their progress and achievements.

## Features
Based on the same ideas and features as one of my previous projects, this project provides the following features:

### Flashcards
- Users can add, modify and delete saved flashcards.
- There are two buttons that allow the user to switch between flashcards. 

### Reminders 
- Users can add, modify and delete saved reminders.
- Each reminder shows the task, the class/area the reminder is associated with and the time left until the reminder's due date. 
- Reminders are devided into two groups based on their severity-level: high-priority and other. High-priority is for reminders that are overdue, due on the day or are manually assigned by the user. Other applies to all other reminders.
- Users can change the severity-level of each reminder by clicking on the reminder.
- Users can delete a reminder by pressing the trash can icon next to the reminder's text.

### Countdown Game
- Users try to reach the generated number by using the basic mathematical operators (+, -, /, *) with any or all of the 6 given numbers.
- Users apply two numbers together by clicking on both numbers separately. The first number goes empty and disables itself after it's been used.
- Users are rewarded with points if they match the required number. Number of points are based on difficulty and time left.
- Depending on the difficulty chosen, the use of the multiply and devide mathematical operators are used more if the difficulty is higher. 
- Users can reset their working and all 6 numbers if they make a mistake.
- Users can view the step-by-step solution of how the app generated the target number.

## How to run
1. Open the app with Visual Studio.
2. Open App.js and run the app with any simulator, preferrably the Chrome or Edge simulator as they were the primary simualtors throughout development.
3. Don't worry about logging in as this feature will be added at a later date. Just click on Login and you'll see the correct page.
4. Click on the hamburger menu and choose from the following: Flashcards, Reminders and Countdown.

Unforutanetly, due to security purposes, the necessary connection to the database for the user to access their saved content, the backend NodeJS program must be run first, but that repository is private as it contains login credentials and will not be available to the public. 

## Contributions 
This project was solely programmed by me.

## Where to find more
To find out more on this project, please find the project here on [LinkedIn.](https://www.linkedin.com/in/jay-davis-261738277/details/projects/)

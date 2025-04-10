# task_manager_app
 
# Task Manager App

A simple yet powerful task manager app built with Flutter and using the Provider package for state management, following clean architecture principles. The app uses **Hive** for local data storage, allowing users to manage their tasks effectively.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Running the App](#running-the-app)
- [Packages Used](#packages-used)
- [Bonus Features](#bonus-features)
  - [Basic Widget Tests](#basic-widget-tests)
  - [Search Functionality](#search-functionality)
- [Functionality](#functionality)
  - [Add Task](#add-task)
  - [Remove Task](#remove-task)
  - [Edit Task](#edit-task)
  - [Search Tasks](#search-tasks)
- [License](#license)

## Introduction
This app allows you to manage tasks efficiently with features like task creation, task deletion, task completion status tracking, and more. It’s built using clean architecture to ensure scalability and maintainability. Data is stored locally using Hive for fast and reliable performance.

## Features
- Task creation, updating, and deletion.
- Task status tracking (completed/incomplete).
- Persistent data storage using Hive.
- Task search functionality to quickly find tasks.
- Beautiful UI following modern design principles.

## Getting Started

To get the app up and running on your local machine, follow the instructions below.

### Prerequisites
- Flutter SDK installed on your system. If you don’t have Flutter installed, please refer to the [Flutter installation guide](https://flutter.dev/docs/get-started/install).
- A text editor like VS Code or Android Studio.
- A device or emulator for testing the app.

### Running the App

1. Clone this repository:
    ```bash
    git clone https://github.com/mahmooooud/task_manager_app.git
    ```

2. Navigate into the project directory:
    ```bash
    cd task_manager_app
    ```

3. Get the dependencies:
    ```bash
    flutter pub get
    ```

4. Run the app on your emulator or device:
    ```bash
    flutter run
    ```

## Packages Used
- **provider**: For state management using the Provider package pattern.
- **hive**: For local data storage (lightweight, fast, and reliable NoSQL database).

## Bonus Features

### Basic Widget Tests
Basic widget tests have been added to ensure the UI components function as expected. These tests verify key features such as:
- The task list displays correctly.
- The "Add Task" button works as intended.
- Task editing and deletion actions perform correctly.

To run the widget tests:
1. Ensure the app is set up correctly (flutter pub get).
2. Run the test suite:
    ```bash
    flutter test
    ```

### Search Functionality
The app includes a search feature that allows users to quickly find tasks by their title or description. The search bar is located at the top of the task list screen. As users type, the list of tasks is filtered based on the search query.

To search tasks:
1. Tap the search icon at the top of the task list.
2. Type in a keyword, and the app will dynamically filter and display tasks that match the search criteria.

## Functionality

### Add Task
To add a new task, follow these steps:
1. Navigate to the "Add Task" screen.
2. Enter task details such as the title, description.
3. Tap the "Add" button to save the task locally using Hive.

### Remove Task
To remove a task:
1. Swipe left or right on the task item in the task list.
2. Tap the delete icon that appears to remove the task from the local database.

### Edit Task
To edit an existing task:
1. Tap on the task you wish to edit.
2. Modify the task's details (title, description).
3. Tap the "Save" button to update the task in the local Hive database.

### Search Tasks
To search for a task:
1. Use the search bar at the top of the task list screen.
2. Type in a keyword, and the app will display tasks matching the search criteria.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

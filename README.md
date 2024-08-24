# aim_digital_coding_test

Aim Digital Coding Test

## Getting Started

For this coding test, I created a login screen using Flutter that allows users to log in with their
email and password using Firebase Authentication. I used Cubit for managing the app's state, which
means I controlled different parts of the app's behavior based on whether the login was in progress,
successful, or if an error occurred.

Approach:

UI Design:
I followed the given design closely, ensuring that the login screen looked exactly like the provided
UI. The screen includes text fields for email and password, and a login button.

State Management with Cubit:
I used Cubit to handle the state of the login process. The Cubit has different states like initial,
loading, success, and error. This allowed the app to show a loading spinner when the login was in
progress, display error messages if something went wrong, and navigate to the home screen when the
login was successful.

Firebase Integration:
I set up Firebase Authentication to manage user login. If the user didn't already exist, the app
automatically created a new user before completing the login process.

Validation:
I added checks to make sure that users enter a valid email and a password with at least one letter,
one number, and a minimum of seven characters. This helps to ensure security and proper user input.

Challenges and Solutions:
Integrating Firebase: Setting up Firebase was a bit tricky, but following the documentation closely
helped me resolve any issues.
State Not Updating:
Initially, the UI wasn't responding to state changes. I resolved this by making
sure the Cubit was correctly provided at the root of the app, ensuring all widgets could access it.
Error Handling:
Handling Firebase errors was challenging at first, especially distinguishing between
different error types (like wrong password or user not found). I handled this by providing clear
error messages to guide the user.

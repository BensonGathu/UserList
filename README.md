# Node.js Flutter Application

This is a simple Node.js and Flutter application that displays users from a Node.js Express backend API. The backend API is located in the `users-api` folder, and the Flutter app is located in the `usersapp` folder.

## Prerequisites

Before running this application, ensure you have the following prerequisites installed:

- [Node.js](https://nodejs.org/): You can download and install Node.js from the official website.

- [Flutter](https://flutter.dev/): Make sure you have Flutter installed. You can download it from the Flutter website.

## Getting Started

Follow these steps to get the application up and running:

```bash
# Backend API (users-api)
cd users-api
npm install
npm start

# Flutter App (usersapp)
cd ../usersapp
flutter pub get
flutter run --no-sound-null-safety


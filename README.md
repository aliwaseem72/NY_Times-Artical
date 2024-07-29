# NY_Times-Artical
This project is a simple iOS app that displays the most popular articles from the New York Times using their Most Popular Articles API. The app follows an MVVM-R architecture and leverages the Clean Code principles.

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Code Coverage](#code-coverage)
- [Best Practices](#best-practices)

## Features

- Fetches the most popular articles from the NY Times Most Popular Articles API.
- Displays a list of articles.
- Shows article details when an item on the list is tapped.
- Caches images to reduce network load.

## Architecture

The app follows the MVVM-R (Model-View-ViewModel-Router) architecture pattern, promoting a clear separation of concerns and facilitating testability.

- **Model**: Defines the data structures.
- **View**: Handles the UI elements.
- **ViewModel**: Manages the presentation logic and data transformation.
- **Router**: Manages navigation between screens.

### Design Patterns

- **Factory Pattern**: Used in repositories to fetch data.
- **Clean Code Architecture**: Ensures the code is easy to read, maintain, and extend.

## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+

## Installation

1. Clone the repository:
   git clone https://github.com/yourusername/NYTimesMostPopularArticles.git
   cd NYTimesMostPopularArticles

2. Open Project
   open NYTimesMostPopularArticles.xcodeproj

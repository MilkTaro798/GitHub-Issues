# GitHub Issues

This iOS application allows users to view open and closed GitHub issues for an open source repository. It uses URLSession to fetch data from the GitHub REST API, and displays the issues using UIKit's UITabBarController, UINavigationController, and UITableView.

## Author 

- Name: Yutong Sun
- Email: milktaro798@gmail.com

## Features

- Displays open and closed issues in a selected open source GitHub repository with at least 20 open issues
- Uses a tab bar interface with "Open" and "Closed" tabs to navigate between issue lists
- Fetches issue data asynchronously using URLSession and the GitHub REST API
- Parses JSON data into custom model structs using the Codable protocol
- Shows issue details including title, poster username, creation date, body, and open/closed state 
- Allows opening the issue on GitHub.com in Safari
- Supports pull-to-refresh to fetch updated issue data
- Customizes navigation bar colors based on issue state (red for open, green for closed)

## Screenshots

<img src="https://github.com/MilkTaro798/GitHub-Issues/blob/main/Simulator%20Screenshot-1.png" width="225"> <img src="https://github.com/MilkTaro798/GitHub-Issues/blob/main/Simulator%20Screenshot-2.png" width="225"> <img src="https://github.com/MilkTaro798/GitHub-Issues/blob/main/Simulator%20Screenshot-3.png" width="225"> <img src="https://github.com/MilkTaro798/GitHub-Issues/blob/main/Simulator%20Screenshot-4.png" width="225">
loading                     Open Issues List                     Closed Issues List                     Issue Details
## Setup Instructions

1. Clone the repo 
2. Open the project in Xcode
3. Build and run the app on an iPhone simulator
4. Use the tab bar to switch between viewing open and closed issues
5. Tap on an issue in the list to view its details
6. Tap the Safari icon to open the issue on github.com
7. Pull down on the issues list to refresh the data

## Acknowledgements 

- GitHub REST API: https://docs.github.com/en/rest
- App icons: https://www.iconfinder.com/search?q=github
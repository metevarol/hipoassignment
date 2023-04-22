# Hipo Assignment

## Project Overview

| **SplashView** | **Sort Members** | **Add Member** |
|:---:|:---:|:---:|
| ![SplashView](https://media.giphy.com/media/qTUKy0xYI6sGVPEUaB/giphy.gif) | ![Sort Members](https://media.giphy.com/media/nU9NWWBVSLukyGoZbn/giphy.gif) | ![Add Member](https://media.giphy.com/media/VSvm3A5m2uHMhNbXcL/giphy.gif) |
| **Delete Member** | **Search Members** | **Detail Page** |
| ![Delete Member](https://media.giphy.com/media/4RG8MG3Z8JXrh7RCnE/giphy.gif) | ![Search Members](https://media.giphy.com/media/jnezvV5xD4OdtaNudL/giphy.gif) | ![Detail Page](https://media.giphy.com/media/0YoDDnKqw0l9YbwLEv/giphy.gif) |




## Project Design

I used SwiftUI and MVVM design pattern in this project.

### Models
- Hipo
- GitHubUser
- Repository

### Views
- MembersView
- MemberDetailView
- AddMemberView
- SplashView
- ContentView
- RootView
- …

### ViewModels
- MembersViewModel
- MemberDetailViewModel
- AddMemberViewModel

### Network
- NetworkManager

### Extensions
- StringExtensions


## Project Features

### Member Screen 

- User can see list of members in company.
- User can sort members by occurrences of a character.
- User can add new member to list.
- User can search member in the list by name and position.
- User can click on any member in the list and can see Member Detail Screen.
- User can delete any member in the list. **(Extra)

### Member Detail Screen

- User can see detail of selected member's gitHub page.
- User can see list of member’s repositories.
- User can see detail of repositories.
- User can sort repositories by date. **(Extra)
- User can see click on any repositories and see page on browser. **(Extra)

## Problem Solution Approach

- Initially, I started by implementing necessary structures and models for the project. These models are Hipo, GitHubUser, and Repository structures.

- Then, I created a service class to fetch user and repo information using the GitHub API. I implemented the NetworkManager class and added “fetchUser” and “fetchRepositories” functions.

- After that, I created the MembersView which is the main page of the app. On this page I implemented a list of members, displaying each member's name, surname, position, and years info.

- Next, I created MemberListViewModel class. I added the functions for fetching, searching, sorting, adding and deleting operations of members.

- To display each member on the list in MembersView, I created a CustomListRow view which is includes member names, positions, and years info.

- Then I designed MemberDetailView page to display details of the members. This page shows the GitHub profile information and repositories of clicked member.

- Then I created MemberDetailViewModel class. This view model class contains fetchGitHubUser and fetchGitHubRepositories functions to fetching necessary data from GitHub API.

- After that I designed MemberDetailView to display member's avatar images, number of followers and followed. Also I listed the member's repositories. In the list of repositories, I designed a custom row to display the name, language, date, and number of stars for each repo. Also as an extra feature I added a button to bottom of page to sort repositories by date.

- As another extra feature I added function to open the GitHub page of the clicked repository with open browser.

- Then I created a SplashView page with a small animation using the Hipo logo as an extra feature. And I run this page on RootView class with ContentView (main) class.

- Finally, as an extra feature, I added the ability to delete any member from the members list and I also set the app to use only in light mode.

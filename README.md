# Breaking Bad character explorer

![Pod](https://img.shields.io/badge/pod-1.5.3-blue.svg)
![iOS Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)


## Requirements

- iOS 13.5+
- Xcode 11.5
- Swift 5

- Command Line Tools 11.5

## Overview

This test consists of building an app and will allow you to demonstrate your knowledge as an iOS Engineer using Swift. 

Create a **Breaking Bad character explorer app** with the following screens: 
* A list of Breaking Bad characters
* Details about the selected character


**Screen 1 - List of Breaking Bad characters**
* Image
* Character name


*Functionality*
* The user selects a character to transition to screen 2
* The user should be able to search for a character by name
* The user should be able to filter characters by season appearance 
 

**Screen 2 - Details**
* Image 
* Name
* Occupation
* Status 
* Nickname 
* Season appearance
*Functionality*
The user can return back to screen 1


**Guidelines** 
* We encourage you to use 3rd party libraries where you see fit. Be prepared to explain your decisions in your interview.
* We expect you to write as many tests as you consider necessary 
* We expect you to host your project using a repository we can clone 
* We will leave the layout up to you, surprise us


We don’t want to put you under too much pressure so there is no dead-line. However, the sooner you finish the faster we can move to the next step. We hope you enjoy this challenge and if you haven’t seen it, sorry for the spoilers!

**API Information**

API endpoint:  https://breakingbadapi.com/api/characters
`
[
  {
    "char_id": 1,
    "name": "Walter White",
    "birthday": "09-07-1958",
    "occupation": [
      "High School Chemistry Teacher",
      "Meth King Pin"
    ],
    "img": "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
    "status": "Presumed dead",
    "nickname": "Heisenberg",
    "appearance": [
      1,
      2,
      3,
      4,
      5
    ],
    "portrayed": "Bryan Cranston",
    "category": "Breaking Bad",
    "better_call_saul_appearance": []
  },
{ …}
]
`


## Build

The project uses Cocoapods. Please ensure you have installed Cocoapods before attempting the instructions below.

#### Instructions

1. Checkout the application via Github or via a terminal.
2. Run `pod install` to checkout third party pods and create xcode workspace file.


#### Cocoapods

[Cocoapods](https://cocoapods.org/) is a dependency manager for Swift and Objective-C Cocoa projects. You can install this using the setup instructions [here](https://cocoapods.org/).

## Author

Andrea Murru (an.murru@gmail.com)

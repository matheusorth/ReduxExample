# StudyDriveiOSTestProject

Test-Project

Create a simple iOS-App which shows a table and two buttons below the table ordered horizontal.
Clicking the left button creates a new producer.
Clicking the right button creates a new consumer.

A producer adds every 3 seconds a new cell in the table.
A consumer removes every 4 seconds a cell from the table.
A created producer/consumer will never be removed and will do its job forever.

The user can create producer or consumer how often he wants by clicking the specified buttons.

For this project use XCode and the language Swift.
For the UI use UITableView with UITableViewCell and UIButtons.
This project should be done in about 2 hours.

## Resolution

Trello Board used for organization. - invite link to access it (https://trello.com/invite/b/JOgJZKPu/e959929447a7a80a3dd7ddbb3ac9cd26/studydrive)

## Dependencies
|#|Library|Description|
|-|-|-|
|1|[ReSwift](https://github.com/ReSwift/ReSwift)|Redux-like implementation of the unidirectional data flow architecture.|

## Build instructions

1. An OSX machine
2. Xcode 10.x or higher (Swift 4.2)
3. Install [CocoaPods](https://cocoapods.org/) 
4. Clone this repo:
```
git clone https://github.com/cardoso/ReduxMovieDB
```
5. Download library dependencies using the cocoapods dependency manager (and update the same way):
```
pod install
```
6. Open the Xcode workspace.
7. Build the project by ⌘ + R

# City List App - SwiftUI

This iOS app is built with SwiftUI, following SOLID design principles and the MVVM architecture pattern. The app demonstrates the ability to load city data, display it in a collapsible list with sections by state, and provides functionality to reverse the list order and refresh data from the backend. It also supports dark mode and has responsive UI.

## Features
- **Collapsible Sections**: The list is organized by state, with collapsible sections to improve the user experience.
- **Reverse List Button**: A button to reverse the order of the list.
- **Dark Mode Support**: The app is designed to work seamlessly in both light and dark mode.
- **Data Refresh**: The app supports refreshing data from the backend.
- **Caching**: The app caches data to avoid reloading it unnecessarily and refreshes only when required.
- **Unit Testing**: Implemented unit tests to ensure code reliability and correctness.
- **Responsive UI**: The app’s UI is responsive and adapts to different device sizes.
- **Scalable and Maintainable Code**: The code is designed with scalability and maintainability in mind, following best practices.
- **Constants**: All values are defined as constants at the class or project level, avoiding hard-coding.


## Architecture
- **MVVM (Model-View-ViewModel)**: The app uses the MVVM design pattern to separate concerns and make the code more testable and maintainable.
- **SOLID Principles**: The code adheres to SOLID principles to ensure that it is modular, flexible, and easy to maintain.

## Data
The app loads city data from a JSON file (au_cities.json) with the following structure:

## Requirements
- **Xcode**: Ensure that you are using Xcode 15.4 or later.
- **SwiftUI**: The app uses SwiftUI, so ensure that your environment supports SwiftUI (iOS 14+).
- **Unit Testing**: Xcode's XCTest framework is used for unit tests.

## Enhancements
- **Expandable Sections**: Cities are grouped by state and can be collapsed or expanded.
- **User-Centric Design**: The UI is designed to be intuitive and easy to navigate, prioritizing the user experience.

##Installation
Clone this repository to your local machine.
Open the project in Xcode.
Build and run the app in the simulator or on a real device.

## Usage
The app will load the city data and display it in a list organized by state.
Use the button at the top to reverse the order of the list.
To refresh the data from the backend, pull the list down to refresh.

## Testing
Unit tests are implemented using Xcode’s XCTest framework. You can run the tests by selecting the test target and running it within Xcode.

## Constants
All configuration values and strings are defined at the class or project level to ensure consistency and avoid hard-coding.




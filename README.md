# Nasa Astronomy Picture Of The Day App

## Technical Challenge


This test is intended for candidates applying to Mobile Engineering positions at CloudWalk.

## Specifications
Build an app for one platform (Android or iOS) to show the pictures from NASA's "Astronomy Picture of the Day" website in a fashion manner.

One of the most popular websites at NASA is the Astronomy Picture of the Day. In fact, this website is one of the most popular websites across all federal agencies.

## Implementation
- The app was implemented using Flutter, a framework written in Dart.
- SOLID principles were applied.
- Domain Driven Design as a software modeling approach.
- Model-View-Controller Pattern.
- Value Listenable Builder (Value Notifier) as state management.
- Test Driven Development.

## Features

- The app is able to get a list of Images and their information from the NASA API, since a specific date (which is currently fixed at "2022-05-18").
- This list of images is shown on the main screen (Home View) in order (from most recent to oldest) with some information.
- The list with the information is saved in the phone's internal storage and can be accessed offline, as long as the first download has been done.
- The user can pull-to-refresh the image list feed if the feed is out of date with the internal storage database.
- On the Home screen, the user can search for an image from the list, either by title or by date.
- When the user clicks on a tile, the user is taken to a new screen (Detailed View) with more detailed information about that image.
- There is a loading screen that warns the user about the loading status of images.
- A toast was implemented that warns the user about possible problems.
- All measurements used in the project use the screen as a reference and use a percentage of it. Therefore, regardless of the screen size, the application can have the proportionality preserved. The Scale class has been implemented.

## Other Information
- The task did not specify the date at which the list would start, so I chose a fixed date. I could easily implement more features to request specific dates.
- UI/UX was not the focus. I preferred to demonstrate my knowledge of architecture and testing. I used dependency injection, interface dependency and other more complex stuff to demonstrate the application of SOLID principles. Of course the application is quite simple, and a simpler architecture would be perfectly fine.


## Tech

Nasa Astronomy Picture Of The Day App uses a number of open source projects to work properly:

- [FlutterModular] - Flutter_modular was built using the engine of modular_core that's responsible for the dependency injection system and route management. The routing system emulates a tree of modules, just like Flutter does in it's widget trees. Therefore we can add one module inside another one by creating links to the parent module.

- [Mocktail] - Mocktail focuses on providing a familiar, simple API for creating mocks in Dart (with null-safety) without the need for manual mocks or code generation.

- [Shared Preferences] - Wraps platform-specific persistent storage for simple data (NSUserDefaults on iOS and macOS, SharedPreferences on Android, etc.). Data may be persisted to disk asynchronously, and there is no guarantee that writes will be persisted to disk after returning, so this plugin must not be used for storing critical data.

- [DartZ] - That's the way to implement a good error-handling on Flutter. The term good means our app has more rich error-handling to help the user understand if there is something wrong when they use the app.

- [Cached Network Image] - A Flutter library to show images from the internet and keep them in the cache directory.

## Running App

Nasa Astronomy Picture Of The Day App requires Flutter to run.

Select your favorite emulator, it can be an iOS emulator or Android.
Open the folder that contains main.dart and run.

```sh
flutter run
```

[FlutterModular]: <https://pub.dev/packages/flutter_modular>
[Mocktail]: <https://pub.dev/packages/mocktail>
[Shared Preferences]: <https://pub.dev/packages/shared_preferences>
[DartZ]: <https://pub.dev/packages/dartz>
[Cached Network Image]: <https://pub.dev/packages/cached_network_image>

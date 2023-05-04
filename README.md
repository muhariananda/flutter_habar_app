# Flutter Habar App

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

Flutter Habar App is a mobile application that allows users to browse news articles from various sources. The app is built with Flutter and consumes data from the [NewsAPI](https://newsapi.org/) service.

## Screenshots

| Home Screen | Dark Mode | Detail Screen |
| --- | --- | --- |
| ![Home Screen](screenshots/home_screen.png) | ![Dark Mode](screenshots/dark_home_screen.png) | ![Detail Screen](screenshots/detail_screen.png)

## Features

- Browse news articles by category
- Search for news articles
- Save favorite articles for later reading
- Dark mode support
- Localization support for English and Indonesia

## Tech Stack

- State management: Bloc pattern with [flutter_bloc](https://pub.dev/packages/flutter_bloc) package
- Networking: [Dio](https://pub.dev/packages/dio) package for HTTP requests
- Navigation: Flutter's built-in Navigator widget
- Data storage: Shared preferences package for simple key-value storage, [Hive](https://pub.dev/packages/hive) package for more complex data storage
- Image loading: [Cached_network_image](https://pub.dev/packages/cached_network_image) package
- Date/time formatting: [Intl](https://pub.dev/packages/intl) package
- Lint : [very_good_analysis](https://pub.dev/packages/very_good_analysis) package for code style

## Getting Started

To use this app, follow these steps:

1. Make sure you have the Flutter SDK installed. If you don't have it, follow the instructions in the [official Flutter documentation](https://flutter.dev/docs/get-started/install) to install it.
2. Create an account on [NewsAPI](https://newsapi.org/) to get an API key.
3. Clone this repository to your local machine.
4. Open a terminal window and navigate to the project directory.
5. Run the following command to install the required dependencies:

```bash
    make get
```

6. Replace `YOUR_API_KEY` in `.vscode/launch.json` with your actual NewsAPI API key.

```json
{
    "name": "Flutter Habar App",
    "type": "dart",
    "request": "launch",
    "program": "lib/main.dart",
    // "flutterMode": "debug", // you can change the mode
    "args": [
        "--dart-define",
        "news-app-token=YOUR_API_KEY" //replace with your API key
    ]
}
```

7. Run the app using vscode debug or the following command:

```bash
flutter run --dart-define=fav-qs-app-token=YOUR_KEY
```

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE)

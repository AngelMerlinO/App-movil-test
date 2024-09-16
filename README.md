
# Flutter iOS Styled App

This is a Flutter-based application that uses Cupertino widgets to provide an iOS-styled UI. The app includes multiple screens such as a home screen, a counter screen, and a screen that fetches and displays characters from the Rick and Morty API.

## Features

- **Cupertino Design**: The app uses Cupertino widgets to give it an iOS look and feel.
- **Multiple Screens**:
  - Home Screen: Displays a user's profile with call and message icons.
  - Counter Screen: A simple counter to increment and show whether the number is odd or even.
  - Rick and Morty Screen: Fetches and displays character information from the Rick and Morty API.
- **Custom Icons**: Change the app icon and name easily via Flutter configurations.

## Project Structure

- `lib/main.dart`: The main entry point of the application.
- `lib/screens/`: Contains the various screen widgets used in the app.
- `lib/widgets/`: Additional widgets for reusable components.

## How to Run

1. Clone the repository.
2. Run `flutter pub get` to install the necessary dependencies.
3. Use `flutter run` to launch the app on a connected device or simulator.

## Dependencies

- `flutter_launcher_icons`: Used for configuring and generating app icons.
- `cupertino_icons`: Provides iOS-style icons.
- `http`: To fetch data from the Rick and Morty API.

## Changing the App Icon

1. Add your custom icon in the `assets/icon/` folder.
2. Update the `pubspec.yaml` with the path to your icon.
3. Run the following command to generate the new icons:
   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

## API Usage

This app uses the [Rick and Morty API](https://rickandmortyapi.com/) to fetch character data.

## Contributing

Feel free to open issues or submit pull requests if you'd like to contribute to this project.

## License

This project is licensed under the MIT License.

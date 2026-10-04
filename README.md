# Final Project Documentation

**Application Name:** *Pokemon Team Builder*
**Author:** *Seth Baal*
**Date:** *11-04-2026*

---

## 1. Project Overview

### 1.1 Problem Statement

My application was built to allow for easy building and brainstorming of Pokemon teams. The user can easily add an unlimited number of teams, search for any Pokemon from any generation, and add them to their team.

### 1.2 Target Audience

The application is mainly geared towards those who are fans of Pokemon, are playing through the games, or even starting to plan a competitive Pokemon VGC team. This tool is made to be very accessible to a wide range of players.

### 1.3 Core Features

* The user is able to create an unlimited number of Pokemon teams.
* The user is able to search for any Pokemon in any generation currently added in the PokeAPI.
* The API pulls the name and a picture of the Pokemon.
* The application saves the user's teams, ensuring data persistence.
* Teams consist of 6 Pokemon, following the standard format.
* Users can add and change any Pokemon in any slot.

---

## 2. Technical Design & Architecture

### 2.1 State Management Strategy

In this application, I used stateful widgets for every main screen. This was necessary as every page is dynamically showing changes made in real time. I made heavy use of `setState` to ensure that everything feels smooth.

For example, on the `search_page`, I call `setState` coupled with `onChanged` to dynamically update the list of Pokemon that match the user's search in the text field.

### 2.2 Data Model

The main data models are both `Team` and `Pokemon`. The team stores a collection of 6 Pokemon objects, and also has a name attribute.

```dart
class Team {
  String teamName;
  List<Pokemon> pokemon;

  Team({
    required this.name,
    required this.pokemon,
  });
}
```

This structure keeps the team creation very simple and efficient.

`Pokemon` stores the actual JSON data for the Pokemon once the API call is made. This was a bit more complex to implement since we have to cherry-pick from the huge PokeAPI response what we are actually trying to store.

I used a factory constructor to simplify and streamline the process, so any future additions are as simple as adding to the constructor.

```dart
class Pokemon {
  final String name;
  final String picture;

  Pokemon({
    required this.name,
    required this.picture,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'sprites': {
          'other': {
            'home': {
              'front_default': String picture
            }
          }
        }
      } =>
        Pokemon(name: name, picture: picture),
      _ => throw const FormatException('Failed to Load Pokemon'),
    };
  }
}
```

### 2.3 Persistence / API Strategy

I implemented both data persistence and API calls in this project.

Starting with the API portion, everything is done in the `search_page` and `pokemon_api` files. We start by passing the name of the searched Pokemon to our fetch function, which adds the name to the end of the URL and makes the request. We check for what status code was returned, and then convert the JSON into a Pokemon object we can return to the `team_page` for display.

The primary endpoint used is:

```text
https://pokeapi.co/api/v2/pokemon/$name
```

For the data persistence, I used the `shared_preferences` package that turns our string objects into JSON format. To load them back in, we convert them back from JSON to a string.

### 2.4 Widget Tree Diagram

Here is a diagram for my `team_page.dart` file.

[View Team Page Widget Tree Diagram](https://drive.google.com/file/d/1YT7OngxOjp0sCyKUFd4B9GIdcz-hBdAU/view?usp=drive_link)

---

## 3. Setup & Installation

### 3.1 Prerequisites

* Android Studio
* Flutter SDK
* Dart SDK

### 3.2 Installation Steps

1. Clone the public repository:

   ```bash
   git clone https://github.com/sethbaal01/ITSE-2343-Final-Project.git
   ```

2. Navigate into the project directory:

   ```bash
   cd ITSE-2343-Final-Project
   ```

3. Set up the Flutter project files:

   ```bash
   flutter create
   ```

4. After adding the required dependencies, run:

   ```bash
   flutter pub get
   ```

5. Run the application:

   ```bash
   flutter run
   ```

---

## 4. Automated Testing

### 4.1 Testing Strategy

For testing, I made sure to include at least one widget test and one unit test. I like to test the more complicated functions, as they are the most likely to be incorrect.

Testing is important because it can show a flaw in the app that you wouldn't see during normal runs of the application.

### 4.2 Test Case Examples

#### Test Case 1: Unit Test

**Description:**
This test is used to check our `fromJson` constructor to ensure that the JSON format reads and stores to strings as we expect.

**Arrange:**
Create a Pokemon in the JSON format that the API should return.

**Act:**
`Pokemon.fromJson` is called to create a Pokemon.

**Assert:**
Check the outcomes with what we expect to get stored in those variables.

**Code Snippet:**

```dart
test('pokemon from json creates pokemon accurately', () {
  final json = {
    'name': 'pikachu',
    'sprites': {
      'other': {
        'home': {
          'front_default': 'https://test.com/pikachu',
        },
      },
    },
  };

  final pokemon = Pokemon.fromJson(json);

  expect(pokemon.name, 'pikachu');
  expect(pokemon.picture, 'https://test.com/pikachu');
});
```

#### Test Case 2: Widget Test

**Description:**
This test is used to make sure that upon the application loading, my check for if the `_teams[]` is empty is working correctly.

**Arrange:**
We pump the `Teams` widget with a material app and an empty teams list, simulating an initial start of the app.

**Act:**
We use `pumpAndSettle` to ensure the teams page fully loads.

**Assert:**
We check our text to verify it matches what it should say.

**Code Snippet:**

```dart
testWidgets(
  'teams page displays no teams when none exist',
  (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Teams(),
      ),
    );

    await tester.pumpAndSettle();

    // Looking for prompt to add a team
    expect(
      find.text('Press + to Create Your First Team!'),
      findsOneWidget,
    );
  },
);
```

---

## 5. User Guide

A quick guide on how to use this application:

1. **Creating a new Team:**
   You can create a new Pokemon team by pressing the plus button in the bottom right corner, bringing up a dialog to input a team name.

2. **Editing a Team:**
   You can simply tap on the team you want to edit, and it will take you to the team page.

3. **Adding Pokemon:**
   You can add a new Pokemon or edit an existing Pokemon by tapping the add or edit buttons on the right of each slot.

4. **Searching for Pokemon:**
   You can search for Pokemon and select one by simply tapping the name of the Pokemon you want to add to the team.

---

## 6. Outside Documentation Referenced

Some of the outside documentation I used is linked here. Most things were done by referencing class documentation and the official Dart and Flutter documentation.

* [Flutter Networking: Fetch Data](https://docs.flutter.dev/cookbook/networking/fetch-data)
* [Dart Constructors](https://dart.dev/language/constructors)
* [Flutter Persistence: Key-Value Data](https://docs.flutter.dev/cookbook/persistence/key-value)

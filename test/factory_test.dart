//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_lister_app/objects/pokemon.dart';

void main() {
  test('pokemon from json creates pokemon accurately', () {
    final json = {
      'name': 'pikachu',
      'sprites': {
        'other': {
          'home': {'front_default': 'https://test.com/pikachu'},
        },
      },
    };

    final pokemon = Pokemon.fromJson(json);

    expect(pokemon.name, 'pikachu');
    expect(pokemon.picture, 'https://test.com/pikachu');
  });
}

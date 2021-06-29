// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `favorcate`
  String get favorcate {
    return Intl.message(
      'favorcate',
      name: 'favorcate',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `favorite`
  String get favorite {
    return Intl.message(
      'favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `my favorite`
  String get myFavorite {
    return Intl.message(
      'my favorite',
      name: 'myFavorite',
      desc: '',
      args: [],
    );
  }

  /// `just do it`
  String get justDoIt {
    return Intl.message(
      'just do it',
      name: 'justDoIt',
      desc: '',
      args: [],
    );
  }

  /// `dine`
  String get dine {
    return Intl.message(
      'dine',
      name: 'dine',
      desc: '',
      args: [],
    );
  }

  /// `filter`
  String get filter {
    return Intl.message(
      'filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `show you choice`
  String get showChoice {
    return Intl.message(
      'show you choice',
      name: 'showChoice',
      desc: '',
      args: [],
    );
  }

  /// `gluten free`
  String get glutenFree {
    return Intl.message(
      'gluten free',
      name: 'glutenFree',
      desc: '',
      args: [],
    );
  }

  /// `show gluten free food`
  String get showGlutenFree {
    return Intl.message(
      'show gluten free food',
      name: 'showGlutenFree',
      desc: '',
      args: [],
    );
  }

  /// `vegan`
  String get vegan {
    return Intl.message(
      'vegan',
      name: 'vegan',
      desc: '',
      args: [],
    );
  }

  /// `show about vegan food`
  String get showVegan {
    return Intl.message(
      'show about vegan food',
      name: 'showVegan',
      desc: '',
      args: [],
    );
  }

  /// `vegetarian`
  String get vegetarian {
    return Intl.message(
      'vegetarian',
      name: 'vegetarian',
      desc: '',
      args: [],
    );
  }

  /// `show about vegetarian food`
  String get showVegetarian {
    return Intl.message(
      'show about vegetarian food',
      name: 'showVegetarian',
      desc: '',
      args: [],
    );
  }

  /// `lactose free`
  String get lactoseFree {
    return Intl.message(
      'lactose free',
      name: 'lactoseFree',
      desc: '',
      args: [],
    );
  }

  /// `show lactose free food`
  String get showLactoseFree {
    return Intl.message(
      'show lactose free food',
      name: 'showLactoseFree',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutes {
    return Intl.message(
      'minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `collected`
  String get collected {
    return Intl.message(
      'collected',
      name: 'collected',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

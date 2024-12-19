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

  /// `Change the language`
  String get Changethelanguage {
    return Intl.message(
      'Change the language',
      name: 'Changethelanguage',
      desc: '',
      args: [],
    );
  }

  /// `Choose the language`
  String get Chooselanguage {
    return Intl.message(
      'Choose the language',
      name: 'Chooselanguage',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Email or Username is too short`
  String get emailvalidate {
    return Intl.message(
      'Email or Username is too short',
      name: 'emailvalidate',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Re-type Password `
  String get RetypePassword {
    return Intl.message(
      'Re-type Password ',
      name: 'RetypePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get passwordvalidate {
    return Intl.message(
      'Password is too short',
      name: 'passwordvalidate',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get LogInbotton {
    return Intl.message(
      'Log In',
      name: 'LogInbotton',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `chnage the company code`
  String get chnagecompcode {
    return Intl.message(
      'chnage the company code',
      name: 'chnagecompcode',
      desc: '',
      args: [],
    );
  }

  /// `start using the app`
  String get startusingtheapp {
    return Intl.message(
      'start using the app',
      name: 'startusingtheapp',
      desc: '',
      args: [],
    );
  }

  /// ` scan the QR code`
  String get turnonthecameraandscan {
    return Intl.message(
      ' scan the QR code',
      name: 'turnonthecameraandscan',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `fast access`
  String get fastaccess {
    return Intl.message(
      'fast access',
      name: 'fastaccess',
      desc: '',
      args: [],
    );
  }

  /// `customers`
  String get customers {
    return Intl.message(
      'customers',
      name: 'customers',
      desc: '',
      args: [],
    );
  }

  /// `suppliers`
  String get suppliers {
    return Intl.message(
      'suppliers',
      name: 'suppliers',
      desc: '',
      args: [],
    );
  }

  /// `purchases`
  String get purchases {
    return Intl.message(
      'purchases',
      name: 'purchases',
      desc: '',
      args: [],
    );
  }

  /// `sales`
  String get sales {
    return Intl.message(
      'sales',
      name: 'sales',
      desc: '',
      args: [],
    );
  }

  /// `warehouse`
  String get warehouse {
    return Intl.message(
      'warehouse',
      name: 'warehouse',
      desc: '',
      args: [],
    );
  }

  /// `general analysis`
  String get generalanalysis {
    return Intl.message(
      'general analysis',
      name: 'generalanalysis',
      desc: '',
      args: [],
    );
  }

  /// `human resources`
  String get humanresources {
    return Intl.message(
      'human resources',
      name: 'humanresources',
      desc: '',
      args: [],
    );
  }

  /// `funds and banks`
  String get fundsandbanks {
    return Intl.message(
      'funds and banks',
      name: 'fundsandbanks',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
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
      Locale.fromSubtags(languageCode: 'ar'),
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

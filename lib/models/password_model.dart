import 'dart:math' as math;

import 'package:flutter/material.dart';

class PasswordModel with ChangeNotifier {
  PasswordModel() {
    generatePassword();
  }

  var _password = '';
  var _entropy = 0.0;
  var _requiredLength = 10;
  var _includeUppercaseLetters = true;
  var _includeLowercaseLetters = true;
  var _includeNumbers = true;
  var _includeSymbols = false;

  String get password => _password;

  double get entropy => _entropy;

  int get requiredLength => _requiredLength;

  bool get includeUppercaseLetters => _includeUppercaseLetters;

  bool get includeLowercaseLetters => _includeLowercaseLetters;

  bool get includeNumbers => _includeNumbers;

  bool get includeSymbols => _includeSymbols;

  set requiredLength(int value) {
    _requiredLength = value;
    _calcPasswordStrength();
    notifyListeners();
  }

  void flipIncludeUppercaseLetters() {
    _includeUppercaseLetters = !_includeUppercaseLetters;
    _calcPasswordStrength();
    notifyListeners();
  }

  void flipIncludeLowercaseLetters() {
    _includeLowercaseLetters = !_includeLowercaseLetters;
    _calcPasswordStrength();
    notifyListeners();
  }

  void flipIncludeNumbers() {
    _includeNumbers = !_includeNumbers;
    _calcPasswordStrength();
    notifyListeners();
  }

  void flipIncludeSymbols() {
    _includeSymbols = !_includeSymbols;
    _calcPasswordStrength();
    notifyListeners();
  }

  void generatePassword() {
    final pool = <String>[];

    if (_includeUppercaseLetters) {
      for (var i = 65; i <= 90; i++) {
        pool.add(String.fromCharCode(i));
      }
    }
    if (_includeLowercaseLetters) {
      for (var i = 97; i <= 122; i++) {
        pool.add(String.fromCharCode(i));
      }
    }
    if (_includeNumbers) {
      for (var i = 48; i <= 57; i++) {
        pool.add(String.fromCharCode(i));
      }
    }
    if (_includeSymbols) {
      final symbols = '`~!@#\$%^&*()-=_+[{]}\\|;\':",.<>/?'.characters.toList();
      for (final symbol in symbols) {
        pool.add(symbol);
      }
    }

    pool.shuffle();
    _password = '';
    for (var i = 0; i < _requiredLength; i++) {
      _password += pool[math.Random().nextInt(pool.length)];
    }

    _calcPasswordStrength();

    notifyListeners();
  }

  void _calcPasswordStrength() {
    var poolSize = 0;

    if (_includeUppercaseLetters) {
      poolSize += 26;
    }
    if (_includeLowercaseLetters) {
      poolSize += 26;
    }
    if (_includeNumbers) {
      poolSize += 10;
    }
    if (_includeSymbols) {
      poolSize += 32;
    }

    if (poolSize == 0) {
      _entropy = 0.0;
      return;
    }

    _entropy = _requiredLength * math.log(poolSize) / math.log(2);
  }
}

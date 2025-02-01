import 'dart:math';

/// A utility class for generating random strings (cyphers) with customizable options.
/// 
/// This class provides functionality to create random strings with specified length
/// and character sets. It allows including or excluding different types of characters
/// such as digits, lowercase letters, uppercase letters, and punctuation marks.
class Cypher {
  /// Generates a random string based on the specified parameters.
  /// 
  /// Parameters:
  /// - [length]: The desired length of the generated string.
  /// - [useDigits]: Whether to include numbers (0-9) in the generated string.
  /// - [useLowerCase]: Whether to include lowercase letters (a-z) in the generated string.
  /// - [useUpperCase]: Whether to include uppercase letters (A-Z) in the generated string.
  /// - [usePunctuation]: Whether to include punctuation marks in the generated string.
  /// 
  /// Returns:
  /// A randomly generated string matching the specified criteria.
  /// 
  /// Throws:
  /// - [ArgumentError] if length is less than 1
  /// - [ArgumentError] if no character set is selected (all boolean parameters are false)
  /// 
  /// Example:
  /// ```dart
  /// final randomString = Cypher.create(
  ///   length: 15,
  ///   useDigits: true,
  ///   useLowerCase: true,
  ///   useUpperCase: true,
  ///   usePunctuation: false,
  /// );
  /// ```
  static String create({
    required int length,
    bool useDigits = true,
    bool useLowerCase = true,
    bool useUpperCase = true,
    bool usePunctuation = true,
  }) {
    if (length < 1) {
      throw ArgumentError('Length must be greater than 0');
    }

    final random = Random.secure();
    final chars = StringBuffer();
    
    if (useDigits) chars.write('0123456789');
    if (useLowerCase) chars.write('abcdefghijklmnopqrstuvwxyz');
    if (useUpperCase) chars.write('ABCDEFGHIJKLMNOPQRSTUVWXYZ');
    if (usePunctuation) chars.write('!@#\$%^&*()_+-=[]{}|;:,.<>?');

    final charsList = chars.toString().split('');
    final result = StringBuffer();

    for (var i = 0; i < length; i++) {
      result.write(charsList[random.nextInt(charsList.length)]);
    }

    return result.toString();
  }
}

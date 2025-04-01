/// Represents the status of a password, indicating whether it contains
/// digits, lowercase letters, uppercase letters, and punctuation.
class PasswordStatus {
  /// Indicates whether the password contains at least one digit (0-9).
  final bool hasDigits;

  /// Indicates whether the password contains at least one lowercase letter (a-z).
  final bool hasLowerCase;

  /// Indicates whether the password contains at least one uppercase letter (A-Z).
  final bool hasUpperCase;

  /// Indicates whether the password contains at least one punctuation character.
  final bool hasPunctuation;

  /// Creates a [PasswordStatus] instance with the given character type statuses.
  ///
  /// By default, all character types are set to `false`, meaning the password
  /// does not contain any of those character categories.
  PasswordStatus({
    this.hasDigits = false,
    this.hasLowerCase = false,
    this.hasUpperCase = false,
    this.hasPunctuation = false,
  });
}

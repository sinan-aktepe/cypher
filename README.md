# cypher

Cypher is an android library for flutter to generate strong passwords simply and fast.

## How to Use

```yaml
# add this line to your dependencies
cypher: ^2.0.1
```

```dart
import 'package:cypher/cypher.dart';
```

## Generating passwords

```dart
Cypher.create(
  length: 15,
  useDigits: true,
  useLowerCase: true,
  useUpperCase: true,
  usePunctuation: false,
);
```

## Checking Password Strength

```dart
final status = Cypher.checkPasswordStrength('password');

print(status.hasDigits);
print(status.hasLowerCase);
print(status.hasUpperCase);
print(status.hasPunctuation);
```

## Checking Password Strength Using Stream

* Pass **onPasswordChanged** method to a textfield
```dart
TextField(
  onChanged: Cypher.onPasswordChanged,
)
```
* Then you can listen changes
```dart
Cypher.onPasswordStatusChange.listen(_onStatusChange);

void _onStatusChange(PasswordStatus status) {
  print(status.hasDigits);
  print(status.hasLowerCase);
  print(status.hasUpperCase);
  print(status.hasPunctuation);
}
```
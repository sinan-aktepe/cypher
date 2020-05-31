# cypher

Cypher is an android library for flutter to generate strong passwords simply and fast.

## How to Use

```yaml
# add this line to your dependencies
cypher:
```

```dart
import 'package:cypher/cypher.dart';
```

```dart
Cypher.create(
    length: 15,
    useDigits: true,
    useLowerCase: true,
    useUpperCase: true,
    usePunctuation: false);
```

| property        | description                                                        | default    |
| --------------- | ------------------------------------------------------------------ |------------|
| length          | int (Not Null)(required)                                           |8           |
| useDigits       | puts digits in password                                            |true        |
| useLowerCase    | puts digits in password                                            |true        |
| useUpperCase    | puts digits in password                                            |true        |
| usePunctuation  | puts punctuations in password                                      |false       |


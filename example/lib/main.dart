import 'package:cypher/cypher.dart';

void main(List<String> args) {
  final password = Cypher.create(
    length: 12,
    useDigits: true,
    useLowerCase: true,
    usePunctuation: true,
    useUpperCase: true,
  );

  print(password);
}

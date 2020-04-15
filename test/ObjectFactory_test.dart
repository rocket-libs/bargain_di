
import 'package:bargain_di/ObjectFactory.dart';
import 'package:flutter_test/flutter_test.dart';

const String _stringValue = "This is some text";

class _DummyClass {
  final textValue = _stringValue;
}

void main() {
  test("Dependancy Injection Works", () {
    final objectFactory = new ObjectFactory();
    objectFactory.register<_DummyClass>(() => new _DummyClass());

    final dummyClassInstance = objectFactory.getInstance<_DummyClass>();
    expect(dummyClassInstance.textValue, _stringValue);
  });
}

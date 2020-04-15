import 'package:flutter/widgets.dart';

class ObjectFactory {
  final Map<Type, dynamic Function()> _registry =
      new Map<Type, dynamic Function()>();

  register<TClass>(dynamic Function() initializer) {
    _registry[TClass] = initializer;
  }

  TClass getInstance<TClass>() {
    return getInstanceByType(type: TClass) as TClass;
  }

  dynamic getInstanceByType({@required Type type}){
    if (_registry.containsKey(type) == false) {
      throw new Exception("Type $type is not registered for initialization");
    } else {
      final initializer = _registry[type];
      return initializer();
    }
  }
}

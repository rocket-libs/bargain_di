
class ObjectFactory {
  final Map<Type, dynamic Function()> _registry =
      new Map<Type, dynamic Function()>();

  @Deprecated("registerImplicit is faster as it does not need you to specify the type of class you're registering. This is read from the callback function 'initializer' you provide")
  register<TClass>(dynamic Function() initializer) {
    _registry[TClass] = initializer;
  }

  registerImplicit<TClass>(TClass Function() initializer) {
    _registry[TClass] = initializer;
  }

  TClass getInstance<TClass>() {
    return getInstanceByType(type: TClass) as TClass;
  }

  dynamic getInstanceByType({required Type type}){
    if (_registry.containsKey(type) == false) {
      throw new Exception("Type $type is not registered for initialization");
    } else {
      final initializer = _registry[type]!;
      return initializer();
    }
  }
}

class ObjectFactory {
  final Map<Type, dynamic Function()> _registry =
      new Map<Type, dynamic Function()>();

  register<TClass>(dynamic Function() initializer) {
    _registry[TClass] = initializer;
  }

  TClass getInstance<TClass>() {
    if (_registry.containsKey(TClass) == false) {
      throw new Exception("Type $TClass is not registered for initialization");
    } else {
      final initializer = _registry[TClass];
      return initializer() as TClass;
    }
  }
}

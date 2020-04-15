import 'package:bargain_di/ObjectFactory.dart';
import 'package:bargain_di_example/AdhocCounterValueManager.dart';

import 'StatefulCounterManager.dart';

class ObjectFactoryProvider{
  static final _staticCounter = new StatefulCounterManager();
  static final objectFactory = new ObjectFactory()
    ..register<StatefulCounterManager>(() => _staticCounter)
    ..register<AdhocCounterValueManager>(() => new AdhocCounterValueManager());
}
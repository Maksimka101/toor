part of 'toor.dart';

/// The default implementation of [Toor].
class _ToorImpl implements Toor {
  /// {@macro ToorRegisterFactory}
  @override
  ToorLocator<T> registerFactory<T>(FactoryFunc<T> factoryFunc) {
    return _ToorFactoryImpl(factoryFunc);
  }

  /// {@macro ToorRegisterLazySingleton}
  @override
  ToorLocator<T> registerLazySingleton<T>(
    FactoryFunc<T> lazySingletonCreator,
  ) {
    return _ToorLazySingletonImpl(lazySingletonCreator);
  }
}

class _ToorFactoryImpl<T> extends ToorLocator<T> {
  const _ToorFactoryImpl(this.factoryFunc);

  final FactoryFunc<T> factoryFunc;

  @override
  T get() => factoryFunc();
}

class _ToorLazySingletonImpl<T> extends ToorLocator<T> {
  _ToorLazySingletonImpl(this.lazySingletonCreator);

  final FactoryFunc lazySingletonCreator;

  T? _instance;

  @override
  T get() {
    return _instance ??= lazySingletonCreator();
  }

  @override
  void dispose() {
    _instance = null;
  }
}

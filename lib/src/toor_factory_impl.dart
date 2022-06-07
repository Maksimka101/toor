part of 'toor.dart';

class _ToorFactoryImpl<T> extends ToorLocator<T> {
  _ToorFactoryImpl(this.factoryFunc);

  late FactoryFunc<T> factoryFunc;

  @override
  T get() => factoryFunc();

  @override
  void reset() {
    // No need to do anything here.
  }
}

import 'package:test/test.dart';
import 'package:toor/toor_test.dart';

void main() {
  group('ToorFactory', () {
    test('returns a new instance when called', () {
      final objectFactory = Toor.instance.registerFactory(() => Object());
      final object1 = objectFactory();
      final object2 = objectFactory();

      expect(identical(object1, object2), isFalse);
    });

    test('creates different instances of ToorLocator', () {
      final toor = Toor.instance;

      final factory1 = toor.registerFactory(() => Object());
      final factory2 = toor.registerFactory(() => Object());

      expect(identical(factory1, factory2), isFalse);
    });

    test('different ToorFactorys create different instances of T', () {
      final toor = Toor.instance;

      final factory1 = toor.registerFactory(() => Object());
      final factory2 = toor.registerFactory(() => Object());

      expect(identical(factory1(), factory2()), isFalse);
    });

    test(
      'reset does not throw anything',
      () {
        Object _factoryFunc() => Object();

        final testFactory = Toor.instance.registerFactory(_factoryFunc);

        expect(testFactory.reset, isNot(throwsException));
      },
    );
  });

  group('ToorFactoryAsync', () {
    test('returns a new instance when called', () async {
      final objectFactory = Toor.instance.registerFactoryAsync(
        () async => Object(),
      );
      final object1 = await objectFactory();
      final object2 = await objectFactory();

      expect(identical(object1, object2), isFalse);
    });

    test('creates different instances of ToorLocatorAsync', () async {
      final toor = Toor.instance;

      final factory1 = toor.registerFactoryAsync(() async => Object());
      final factory2 = toor.registerFactoryAsync(() async => Object());

      expect(identical(factory1, factory2), isFalse);
    });

    test(
      'different ToorFactoryAsyncs create different instances of T',
      () async {
        final toor = Toor.instance;

        final factory1 = toor.registerFactoryAsync(() async => Object());
        final factory2 = toor.registerFactoryAsync(() async => Object());

        final object1 = await factory1();
        final object2 = await factory2();

        expect(identical(object1, object2), isFalse);
      },
    );
  });
}

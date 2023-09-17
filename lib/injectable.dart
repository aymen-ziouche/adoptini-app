
import 'package:adoptini_app/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
Future<void> configInjections() async => GetIt.instance.init();
final locator = GetIt.I;



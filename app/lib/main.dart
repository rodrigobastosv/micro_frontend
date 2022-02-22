import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'main/global_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initCore();
  runApp(GlobalApp());
}

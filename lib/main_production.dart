import 'package:countries_mobile_app/app/app.dart';
import 'package:countries_mobile_app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(
    (sharedPreferences) => App(sharedPreferences: sharedPreferences),
  );
}

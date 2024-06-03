import 'package:quotes_dbminer_app/view/screen/page/home_page/home_page.dart';
import 'package:quotes_dbminer_app/view/screen/page/splash_screen/splash_screen.dart';
import '../../headers.dart';

class AppRoutes {
  static const String splashscreen = '/';
  static const String homepage = 'home_page';

  static Map<String, WidgetBuilder> routes = {
    splashscreen: (context) => const SplashScreen(),
    homepage: (context) => const HomePage(),
  };
}

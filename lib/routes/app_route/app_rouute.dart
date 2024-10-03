import 'package:quotes_dbminer_app/view/screen/page/home_page/home_page.dart';
import 'package:quotes_dbminer_app/view/screen/page/like_page/like_page.dart';
import '../../headers.dart';

class AppRoutes {
  // static const String splashscreen = '/';
  static const String homepage = '/';
  static const String likepage = 'like_page';

  static Map<String, Widget Function(BuildContext)> routes = {
    // splashscreen: (context) => const SplashScreen(),
    '/': (context) => const HomePage(),
    'like_page': (context) => const LikePage(),
  };
}

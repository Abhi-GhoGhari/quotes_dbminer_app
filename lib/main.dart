import 'package:quotes_dbminer_app/controller/app_controller/app_controller.dart';
import 'package:quotes_dbminer_app/controller/like_database/like_database.dart';
import 'package:quotes_dbminer_app/controller/theam_controller/theam_controller.dart';
import 'package:quotes_dbminer_app/helper/db/like_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'headers.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  await LikeDataBase.likeDataBase.initDataBase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuoteController(),
        ),
        ChangeNotifierProvider(
          create: (_) => TheamController(sp: sharedPreferences),
        ),
        ChangeNotifierProvider(
          create: (_) => LikeController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

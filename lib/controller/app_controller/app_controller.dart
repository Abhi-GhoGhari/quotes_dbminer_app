import 'package:quotes_dbminer_app/headers.dart';
import 'package:quotes_dbminer_app/helper/app_helper/app_helper.dart';
import 'package:quotes_dbminer_app/helper/db/like_database.dart';

class QuoteController extends ChangeNotifier {
  List<Qutoemodal> allQuotes = [];
  List<Qutoemodal> allFavQuotes = [];
  QuoteController() {
    getQuote();
  }
  Future<void> getQuote() async {
    allQuotes = await Helper.apiHelper.getQuoteApi();
    notifyListeners();
  }

  Future<void> initDataBase() async {
    allFavQuotes = await LikeDataBase.likeDataBase.getAllData();
    notifyListeners();
  }

  Future<void> addFavQuote({required Qutoemodal q}) async {
    await LikeDataBase.likeDataBase.addFavQuote(allQuotes[0]);
    notifyListeners();
  }
}

import 'package:quotes_dbminer_app/headers.dart';
import 'package:quotes_dbminer_app/helper/app_helper/app_helper.dart';

class QuoteController extends ChangeNotifier {
  List<Qutoemodal> allQuotes = [];
  QuoteController() {
    getQuote();
  }
  Future<void> getQuote() async {
    allQuotes = await Helper.apihelper.getquoteapi();
    notifyListeners();
  }
}

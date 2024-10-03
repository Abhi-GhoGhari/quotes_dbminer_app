import 'package:flutter/cupertino.dart';
import 'package:quotes_dbminer_app/helper/db/like_database.dart';
import 'package:quotes_dbminer_app/modal/app_modal/app_modal.dart';

class LikeController with ChangeNotifier {
  List<Qutoemodal> likeList = [];
  Future<void> likeQuote({required Qutoemodal q}) async {
    await LikeDataBase.likeDataBase.addFavQuote(q);
    notifyListeners();
  }
}

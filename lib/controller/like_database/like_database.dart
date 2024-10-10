import 'package:flutter/cupertino.dart';
import 'package:quotes_dbminer_app/helper/db/like_database.dart';
import 'package:quotes_dbminer_app/modal/app_modal/app_modal.dart';

class LikeController with ChangeNotifier {
  List<Qutoemodal> likeList = [];

  bool Like = true;
  LikeController() {
    likeQuote();
  }
  // Future<void> likeQuote({required Qutoemodal q}) async {
  //   await LikeDataBase.likeDataBase.addFavQuote(q);
  //   notifyListeners();
  // }
  void likeQuote() {
    Like = !Like;
    notifyListeners();
  }
}

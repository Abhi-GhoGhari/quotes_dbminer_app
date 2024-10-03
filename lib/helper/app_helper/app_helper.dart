import 'package:http/http.dart' as http;
import 'package:quotes_dbminer_app/headers.dart';

class Helper {
  Helper._();
  static Helper apiHelper = Helper._();

  String apiLink = "https://dummyjson.com/quotes";

  Future<List<Qutoemodal>> getQuoteApi() async {
    List<Qutoemodal> Quotes = [];
    http.Response response = await http.get(
      Uri.parse(apiLink),
    );
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List quote = data['quotes'];
      Quotes = quote
          .map(
            (e) => Qutoemodal.fromJson(e),
          )
          .toList();
    }
    return Quotes;
  }
}

import 'dart:math';
import 'package:provider/provider.dart';
import 'package:quotes_dbminer_app/controller/app_controller/app_controller.dart';
import 'package:quotes_dbminer_app/controller/like_database/like_database.dart';
import 'package:quotes_dbminer_app/controller/theam_controller/theam_controller.dart';

import '../../../../headers.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    QuoteController mutable = Provider.of<QuoteController>(context);
    QuoteController unmutable =
        Provider.of<QuoteController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("LIKE PAGE"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Provider.of<TheamController>(context).isDark
                ? const AssetImage("lib/assets/images/dark.png")
                : const AssetImage("lib/assets/images/light.png"),
            fit: BoxFit.cover,
          ),
          // color: Provider.of<TheamController>(context).isDark
          //     ? Colors.orange
          //     : Colors.orangeAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: (mutable.allFavQuotes.isNotEmpty)
              ? ListView.builder(
                  itemCount: mutable.allFavQuotes.length,
                  itemBuilder: (context, index) => Container(
                    height: size.height * 0.2,
                    width: double.infinity,
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black26,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            mutable.allFavQuotes[index].quote,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            mutable.allFavQuotes[index].author,
                            maxLines: 1,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () async {
                              await Provider.of<LikeController>(context,
                                      listen: false)
                                  .likeQuote(
                                q: mutable.allFavQuotes[index],
                              );
                            },
                            icon: mutable.allFavQuotes.contains(e)
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: Text("NO DATA...."),
                ),
        ),
      ),
    );
  }
}

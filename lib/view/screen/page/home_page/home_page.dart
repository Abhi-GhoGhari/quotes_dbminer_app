import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:provider/provider.dart';
import 'package:quotes_dbminer_app/controller/app_controller/app_controller.dart';
import 'package:quotes_dbminer_app/controller/like_database/like_database.dart';
import 'package:quotes_dbminer_app/controller/theam_controller/theam_controller.dart';
import 'package:quotes_dbminer_app/routes/app_route/app_rouute.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> favQuotes = [];
    Size size = MediaQuery.of(context).size;
    QuoteController mutable = Provider.of<QuoteController>(context);
    QuoteController unmutable =
        Provider.of<QuoteController>(context, listen: false);

    bool isdark = false;
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Drawer();
          },
          child: CircleAvatar(
            child: Image(
              image: AssetImage(
                "lib/assets/images/demo-u.png",
              ),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Switch(
                dragStartBehavior: DragStartBehavior.start,
                value: isdark,
                onChanged: (value) => Provider.of<TheamController>(
                  context,
                  listen: false,
                ).changeTheme(),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.likepage,
                  );
                },
                icon: Icon(
                  mutable.allQuotes.contains(e)
                      // favQuotes.contains(e)
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
              ),
            ],
          ),
        ],
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
          child: (mutable.allQuotes.isNotEmpty)
              ? ListView.builder(
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: mutable.allQuotes.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlassContainer(
                      height: size.height * 0.2,
                      width: double.infinity,
                      // margin: const EdgeInsets.all(3),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black26,
                      blur: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                mutable.allQuotes[index].quote,
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
                                mutable.allQuotes[index].author,
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
                                    q: mutable.allQuotes[index],
                                  );
                                },
                                icon: mutable.allQuotes.contains(e)
                                    ? const Icon(Icons.favorite)
                                    : const Icon(Icons.favorite_border),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CupertinoActivityIndicator(),
                ),
        ),
      ),
    );
  }
}

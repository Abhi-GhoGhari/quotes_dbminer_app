import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_dbminer_app/controller/app_controller/app_controller.dart';
import 'package:quotes_dbminer_app/controller/theam_controller/theam_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteController mutable = Provider.of<QuoteController>(context);
    QuoteController unmutable =
        Provider.of<QuoteController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<TheamController>(
                context,
                listen: false,
              ).changeTheme();
            },
            icon: const Icon(Icons.edit_attributes),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: (mutable.allQuotes.isNotEmpty)
            ? ListView.builder(
                itemCount: mutable.allQuotes.length,
                itemBuilder: (context, index) => Card(
                  child: Text(mutable.allQuotes[index].quote),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

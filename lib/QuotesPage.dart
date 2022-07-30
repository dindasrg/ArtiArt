import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arti_art/ArtiArtData/Quotes.dart';

class QuotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
      if (constraint.maxWidth <= 600) {
        return MobileQuotesPage(gridCount: 1);
      } else {
        return MobileQuotesPage(gridCount: 4);
      }
    });
  }
}

class MobileQuotesPage extends StatefulWidget {
  final int gridCount;

  MobileQuotesPage({required this.gridCount});

  @override
  _MobileQuotesPageState createState() => _MobileQuotesPageState();
}

class _MobileQuotesPageState extends State<MobileQuotesPage> {
  final _scrollController = ScrollController();

  Color color11 = Color(0xFFDEFFFA);
  Color color2 = Color(0xFFFFDAF5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [color11, color2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 10, right: 10),
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    'Quotes for you!',
                    style: TextStyle(fontFamily: 'VT323', fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    controller: _scrollController,
                    crossAxisCount: widget.gridCount,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: imageQuotes.map((img) {
                      return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(img, fit: BoxFit.cover),
                          ));
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

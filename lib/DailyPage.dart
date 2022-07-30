import 'package:flutter/material.dart';
import 'package:arti_art/ArtiArtData/Art.dart';
import 'package:arti_art/DetailDailyArt.dart';

class DailyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint){
      if(constraint.maxWidth <=600) {
        return MobileDailyPage(gridCount: 2,);
      }
      else {
        return MobileDailyPage(gridCount: 8);
      }
    });
  }
}

class MobileDailyPage extends StatefulWidget {
  final int gridCount;

  MobileDailyPage({required this.gridCount});

  @override
  _MobileDailyPageState createState() => _MobileDailyPageState();
}

class _MobileDailyPageState extends State<MobileDailyPage> {
  final _scrollController = ScrollController();

  Color color11= Color(0xFFDEFFFA);
  Color color2 = Color(0xFFFFDAF5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            gradient: new LinearGradient(colors: [color11, color2], begin: Alignment.topLeft, end: Alignment.bottomRight)
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container (
                  padding: const EdgeInsets.only(top: 20,bottom: 20, left: 10, right: 10),
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Your Daily Art',style: TextStyle(fontFamily: 'VT323', fontSize: 32), textAlign: TextAlign.center,),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,),
                              onPressed: () {
                                Navigator.pop(context);
                              },),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      GridView.count(
                        shrinkWrap: true,
                        controller: _scrollController,
                        crossAxisCount: widget.gridCount,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,

                        children: mainArt.map((art){
                          return Container(
                            height: 200,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return DetailDailyArt(art: art);
                                }));
                              },
                              child: Card(
                                //color: color6,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                child: Column(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(top: 15, bottom: 5, left: 20, right: 20),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: Image.asset(art.image, width: 145, height: 130, fit: BoxFit.fill,))
                                    ),
                                    Text(art.name, style: TextStyle(fontSize: 20, fontFamily: 'VT323'),)
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
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

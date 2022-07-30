import 'package:arti_art/DetailArt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arti_art/ArtiArtData/FestArt.dart';

class FestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint) {
      if(constraint.maxWidth <= 600) {
        return MobileFestPage(gridCount: 2);
      }
      else{
        return MobileFestPage(gridCount: 8);
      }
    });
  }
}

class MobileFestPage extends StatefulWidget {
  final int gridCount;

  MobileFestPage({required this.gridCount});

  @override
  _MobileFestPageState createState() => _MobileFestPageState();
}

class _MobileFestPageState extends State<MobileFestPage> {
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
                      Text('Fasilkom UI Art Festival Present',style: TextStyle(fontFamily: 'VT323', fontSize: 32), textAlign: TextAlign.center,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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

                        children: festArt.map((art){
                          return Container(
                            height: 200,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return DetailFestArt(art: art);
                                }));
                              },
                              child: Stack(
                                children: [
                                  Card(
                                    //color: color6,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.only(top: 15, bottom: 5, left: 20, right: 20),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(15),
                                                child: Image.asset(art.image, width: 145, height: 130, fit: BoxFit.fill,)
                                            )
                                        ),
                                        //SizedBox(height: 5),
                                        Text(art.name, style: TextStyle(fontSize: 20, fontFamily: 'VT323'),)
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AuctionLabel(isAuct: art.auct),
                                    ],
                                  ),
                                ],
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

class WebFestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class AuctionLabel extends StatelessWidget {
  bool isAuct;

  AuctionLabel({required this.isAuct});

  @override
  Widget build(BuildContext context) {
    Widget theLabel = Container();
    if(isAuct){
      theLabel = Text('auctioned',
        style: TextStyle(fontFamily: 'VT323', fontSize: 14, fontStyle: FontStyle.italic, color: Colors.teal, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      );
    }

    return theLabel;
  }
}

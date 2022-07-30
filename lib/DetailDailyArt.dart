import 'package:arti_art/ArtiArtData/Art.dart';
import 'package:flutter/material.dart';

class DetailDailyArt extends StatelessWidget {
  Art art;

  DetailDailyArt({required this.art});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint) {
      return MobileDetailDailyArt(art: art);
    });
  }
}

class MobileDetailDailyArt extends StatefulWidget {
  Art art;

  MobileDetailDailyArt({required this.art});

  @override
  _MobileDetailDailyArtState createState() => _MobileDetailDailyArtState();
}

class _MobileDetailDailyArtState extends State<MobileDetailDailyArt> {
  final _scrollController = ScrollController();

  Color color11= Color(0xFFDEFFFA);
  Color color2 = Color(0xFFFFDAF5);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: new LinearGradient(colors: [color11, color2], begin: Alignment.topLeft, end: Alignment.bottomRight)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20,bottom: 20, left: 10, right: 10),
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(widget.art.image),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Center(child: Text(widget.art.name, style: TextStyle(fontFamily: 'Shrikhand', fontSize: 32), textAlign: TextAlign.center,)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },),
                                  ),
                                  LoveButton(),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Column(
                              children: [
                                Text('Artist: ${widget.art.artist}',
                                  style: TextStyle(fontFamily: 'VT323', fontSize: 24)
                                  ,),
                                Text('(${widget.art.socialArtist})',
                                  style: TextStyle(fontFamily: 'VT323', fontSize: 18)
                                  ,),
                              ],
                            )
                            ,),
                          SizedBox(height: 15,),
                          Text('"${widget.art.desc}"', style: TextStyle(fontFamily: 'VT323', fontSize: 20, fontStyle: FontStyle.italic), textAlign: TextAlign.justify,),


                        ],
                      ),
                    ),
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

class LoveButton extends StatefulWidget {
  @override
  _LoveButtonState createState() => _LoveButtonState();
}

class _LoveButtonState extends State<LoveButton> {
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        setState(() { // perhatikan syntax mengubah state
          isLoved = true;
        });
      },
      icon: Icon(isLoved ? Icons.favorite_rounded : Icons.favorite_outline_rounded,color: Colors.red,),
    );
  }
}
import 'package:arti_art/DailyPage.dart';
import 'package:arti_art/FestPage.dart';
import 'package:arti_art/QuotesPage.dart';
import 'package:arti_art/DetailDailyArt.dart';
import 'package:arti_art/DetailArt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arti_art/ArtiArtData/Art.dart';
import 'package:arti_art/ArtiArtData/FestArt.dart';
import 'package:arti_art/ArtiArtData/Quotes.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {

  Color color7= Color(0xFF461E52);
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
        appBar: AppBar(
          centerTitle: true,
          title: Text('ArtiArt', style: TextStyle(fontFamily: 'Yellowtail', fontSize: 32, ),),
          backgroundColor: color7,
        ),
        body: SingleChildScrollView(
          child: Column( // susunan artFest, artDay, quotes
            children: [
              Container ( // ARTFEST
                //decoration: BoxDecoration(border: Border.all(color: color7), borderRadius: BorderRadius.all(Radius.circular(5))),
                padding: const EdgeInsets.only(top: 20,bottom: 20, left: 10, right: 10),
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text("TODAY'S FEST", style: TextStyle(fontFamily: 'Shrikhand', fontSize: 40),),
                    Text("FASILKOM UI ART FESTIVAL", style: TextStyle(fontFamily: 'VT323', fontSize: 30)),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("20 July - 4 August", style: TextStyle(fontFamily: 'VT323', fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('More', style: TextStyle(fontSize: 20, fontFamily: 'VT323'),),
                            IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return FestPage();
                              }));
                            }, icon: Icon(Icons.arrow_forward_rounded)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: festArtPreview.length,

                        itemBuilder: (context, index){
                          final art = festArtPreview[index];

                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return DetailFestArt(art: art);
                              }));
                            },
                            child: Card(
                              //color: color6,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.asset(art.image, width: 145, height: 135, fit: BoxFit.fill,))
                                  ),
                                  SizedBox(height: 5),
                                  Text(art.name, style: TextStyle(fontSize: 20, fontFamily: 'VT323'),)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only( bottom: 20, left: 10, right: 10),
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text('Daily Art', style: TextStyle(fontFamily: 'Shrikhand', fontSize: 40),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Let's appreciate!", style: TextStyle(fontSize: 20, fontFamily: 'VT323')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('More', style: TextStyle(fontSize: 20, fontFamily: 'VT323'),),
                            IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return DailyPage();
                              }));
                            }, icon: Icon(Icons.arrow_forward_rounded)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mainArtPreview.length,

                        itemBuilder: (context, index){
                          final art = mainArtPreview[index];

                          return InkWell(
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
                                      padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.asset(art.image, width: 145, height: 135, fit: BoxFit.fill,))
                                  ),
                                  SizedBox(height: 5),
                                  Text(art.name, style: TextStyle(fontSize: 20, fontFamily: 'VT323'),)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ), // susunan card
                  ],
                ),
              ), // DAILY ART

              Container(
                  padding: const EdgeInsets.only( bottom: 20, left: 10, right: 10),
                  margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text('Daily Quotes', style: TextStyle(fontFamily: 'Shrikhand', fontSize: 40),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cheer up your day!', style: TextStyle(fontSize: 20, fontFamily: 'VT323')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('More', style: TextStyle(fontSize: 20, fontFamily: 'VT323'),),
                            IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return QuotesPage();
                              }));
                            }, icon: Icon(Icons.arrow_forward_rounded)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: quotesPreview.length,

                        itemBuilder: (context, index){
                          final art = quotesPreview[index];

                          return Card(
                            //color: color6,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(art, width: 145, height: 135, fit: BoxFit.fill,))
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ) // QUOTES
            ],
          ),
        )
      ),
    );
  }
}
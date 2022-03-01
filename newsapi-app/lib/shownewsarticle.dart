
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:redcarpetassignment/newsdetails.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class NewsArticle extends StatelessWidget {
  final NewsDetails article;

  NewsArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title.toString()),
        backgroundColor: HexColor("#264653"),
      ),
      backgroundColor:  HexColor("#2a9d8f") ,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  //let's add the height
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage.toString()), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: HexColor("#264653"),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  article.name.toString(),
                  style: GoogleFonts.robotoCondensed(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),

                    color: HexColor("#e9c46a"),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Expanded(
                          child: Text(
                            article.content.toString(),
                            style: GoogleFonts.hammersmithOne(
                              textStyle: TextStyle(
                                // fontWeight: FontWeight.bold
                              )
                            )
                          ),
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      color: HexColor("#f4a261"),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 10,),
                          Center(
                            child: Link(
                              target: LinkTarget.blank,
                              uri: Uri.parse(article.url.toString()),
                              builder: (context,followLink)=>GestureDetector(
                                child: Container(
                                  child: Text("Tap Here To Open Link",
                                  style: GoogleFonts.didactGothic(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )
                                  )
                                  ),
                                ),
                                onTap: followLink,

                              ),
                            ),

                          ),
                          SizedBox(height: 10,)
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

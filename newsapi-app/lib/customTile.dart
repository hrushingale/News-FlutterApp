
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:redcarpetassignment/newsdetails.dart';
import 'package:redcarpetassignment/shownewsarticle.dart';

Widget customTile(NewsDetails article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsArticle(
                article: article,
              )));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: HexColor("#e9c46a"),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
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
              color: HexColor("#f4a261"),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor("#264653"),

                  ),
                  child: Text(
                    article.name.toString(),
                    style: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                      )
                    )
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  article.title.toString(),
                  style: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: HexColor("#212529")
                      )
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          // Text(
          //   article.title.toString(),
          //   style: GoogleFonts.robotoCondensed(
          //     textStyle: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 16.0,
          //       color: HexColor("#212529")
          //     )
          //   ),
          //
          //
          // )
        ],
      ),
    ),
  );
}

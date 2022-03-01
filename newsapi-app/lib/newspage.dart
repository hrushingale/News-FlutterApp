import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:redcarpetassignment/httpconnection.dart';
import 'package:redcarpetassignment/newsdetails.dart';
import 'dart:convert';
import 'package:redcarpetassignment/customTile.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}


class _NewsPageState extends State<NewsPage> {

  HttpConnection connection_service=HttpConnection();


  @override
  Widget build(BuildContext context) {
    // _printResponse(uri);
    return Scaffold(
      backgroundColor:  HexColor("#2a9d8f") ,
      appBar: AppBar(
        title: Text("News"),
        backgroundColor: HexColor("#264653"),
      ),
      body: FutureBuilder(
        future: connection_service.fetchNews(),
        builder: (BuildContext context, AsyncSnapshot<List<NewsDetails>> snapshot) {
          if (snapshot.hasData) {
            List<NewsDetails>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles?.length,
              itemBuilder: (context, index) =>
                  customTile(articles![index], context),
            );

          } else if (snapshot.hasError) {

            return Text('${snapshot.error}');

          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}


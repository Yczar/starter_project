import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:starterproject/model/picture.dart';
import 'package:http/http.dart' as http;
import 'package:starterproject/ui/widget/circular_bar.dart';
import 'package:starterproject/ui/widget/image_object.dart';
import 'package:starterproject/viewmodel/homescreen_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  String title;
  HomeScreen({this.title});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      viewModelBuilder: () => HomeScreenViewModel(),
      onModelReady: (model) => model.fetchWeatherdata(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.format_align_center, color: Colors.grey,),
          elevation: 0,
          title: Text("Starter", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.transparent,
        ),
        body: model.weather == null ? Center(child: CircularProgressIndicator()):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2
        ),
            itemCount: model.weather.length,
            itemBuilder: (ctx, ind){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)
              ),
              child: GridTile(
                footer: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Center(child: Text(model.weather[ind].iconName, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'worksans'))),
                ),
                child: GestureDetector(
                    onTap: (){
                    },
                    child:  CircularProgressb(size: 100, color: Colors.purple, backgroundColor: Colors.black, progress: double.parse(model.weather[ind].id),)),
              ),
            ),
          );
        }),
      ),
    );
  }
}

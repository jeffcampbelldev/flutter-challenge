import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:playlist/models/album.dart';
import 'package:dio/dio.dart';
class Webservice{
  Future<List> fetchAlbums() async {

    try {
      var response = await Dio().get('https://itunes.apple.com/lookup?id=909253&entity=album');
      List listOfAlbums=json.decode(response.data)['results'];
      listOfAlbums.removeAt(0);
      return listOfAlbums.map((data)=>Album.fromJson(data)).toList();


    } catch (e) {
      return [];
    }

 }
}
import 'package:flutter/cupertino.dart';
import 'package:playlist/models/album.dart';
import 'package:playlist/services/web_service.dart';
import 'package:playlist/view_models/album_view_model.dart';

class AlbumListViewModel extends ChangeNotifier{
  List<AlbumViewModel> albums= [];
  List<AlbumViewModel> favourites=[];

  Future<void> fetchAlbums(String keyword) async {
    final results =  await Webservice().fetchAlbums();
    this.albums = await results.map((item) => AlbumViewModel(album: item)).toList();

    notifyListeners();
  }

  setFavourites(AlbumViewModel albumViewModel){
    if(favourites.contains(albumViewModel)){
      favourites.remove(albumViewModel);
    }else{
      favourites.add(albumViewModel);
    }
    notifyListeners();
  }







}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playlist/models/album.dart';
import 'package:playlist/services/web_service.dart';
import 'package:playlist/view_models/album_list_view_model.dart';
import 'package:playlist/view_models/album_view_model.dart';
import 'package:provider/provider.dart';

class AlbumPage extends StatefulWidget {
  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AlbumListViewModel>(context, listen: false)
        .fetchAlbums('keyword');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AlbumListViewModel>(
      builder: (BuildContext context, albumListProvider, Widget? child) {
        var albums = albumListProvider.albums;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: albums.length,
          itemBuilder: (context, index) {
            final album = albums[index];
            return ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: album.image != 'null'
                  ? Image.network(album.image!)
                  : SizedBox(),
              subtitle: Row(
                children: [
                  Text(album.releaseDate),
                  Spacer(),
                  Text(
                    '${album.currency} ${album.price} ',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              trailing: CupertinoButton(
                padding: EdgeInsets.all(0),
                  onPressed: () {
                    albumListProvider.setFavourites(album);
                  },
                  child: Icon(albumListProvider.favourites.contains(album)
                      ? CupertinoIcons.heart_solid
                      : CupertinoIcons.heart, color: albumListProvider.favourites.contains(album)?Colors.red:Colors.grey,)),
              title: Text(album.name),
            );
          },
        );
      },
    ));
  }
}

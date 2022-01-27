import 'package:playlist/models/album.dart';

class AlbumViewModel {
  final Album album;

  AlbumViewModel({required this.album});
 int  get id {
    return this.album.id;
  }
  String get name {
    return this.album.name;
  }

  String? get image {
    return this.album.image;
  }

  double get price {
    return this.album.price;
  }

  String get releaseDate {
    return this.album.releaseDate;
  }

  String get currency {
    return this.album.currency;
  }




}

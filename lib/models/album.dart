import 'package:playlist/helper.dart';

class Album {
  // wrapperType":"artist", "artistType":"Artist", "artistName":"Jack Johnson", "artistLinkUrl":"https://music.apple.com/us/artist/jack-johnson/909253?uo=4", "artistId":909253, "amgArtistId":468749, "primaryGenreName":"Rock", "primaryGenreId":21}

  final String name, image;
  int id;

  final double price;
  final String releaseDate;
  final String currency;
  final bool? favourite;

  Album({
    required this.id,
    required this.price,
    required this.releaseDate,
    required this.name,
    required this.image,
    required this.currency,
    this.favourite,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json["collectionName"] ?? '',
      image: json['artworkUrl60'] ?? '',
      price: json['collectionPrice'] ?? 0.0,
      releaseDate:
          Helper().getFormattedDate(longDate: json['releaseDate'] ?? ''),
      currency: json['currency'] ?? '',
      id: json['collectionId'],
    );
  }
}

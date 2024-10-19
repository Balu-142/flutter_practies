// class Songs {
//   String uri;
//   String name;
//   Artists artists;
//   CoverArt coverArt;
//   Date date;
//
//   Songs({
//     required this.uri,
//     required this.name,
//     required this.artists,
//     required this.coverArt,
//     required this.date,
//   });
//
// }
//
// class Artists {
//   List<Item> items;
//
//   Artists({
//     required this.items,
//   });
//
// }
//
// class Item {
//   String uri;
//   Profile profile;
//
//   Item({
//     required this.uri,
//     required this.profile,
//   });
//
// }
//
// class Profile {
//   String name;
//
//   Profile({
//     required this.name,
//   });
//
// }
//
// class CoverArt {
//   List<Source> sources;
//
//   CoverArt({
//     required this.sources,
//   });
//
// }
//
// class Source {
//   String url;
//   int width;
//   int height;
//
//   Source({
//     required this.url,
//     required this.width,
//     required this.height,
//   });
//
// }
//
// class Date {
//   int year;
//
//   Date({
//     required this.year,
//   });
//
//   factory Songs.fromJson(Map<String, dynamic> json) {
//     return Songs(
//       name: json['name'] ?? '',    // Default to empty string if key doesn't exist
//       uri: json['uri'] ?? '',       // Default to empty string if key doesn't exist
//       coverArt: json['coverArt'] ?? '', '',   // Default to empty string if key doesn't exist
//     );
//   }
//
// }


class Songs {
  final String uri;
  final String name;
  final String coverArt;

  Songs({
    required this.uri,
    required this.name,
    required this.coverArt,
  });

  factory Songs.fromJson(Map<String, dynamic> json) {
    return Songs(
      uri: json['uri'] ?? '',
      name: json['name'] ?? '',
      coverArt: json['coverArt'] ?? '',
    );
  }
}


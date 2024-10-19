import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:practices/models/sportfy_model.dart'; // Ensure this model is defined correctly

class SongsList extends StatefulWidget {
  const SongsList({Key? key}) : super(key: key);

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  late Future<List<Songs>> songs;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    songs = fetchSongs(''); // Initialize with an empty search
  }

  Future<List<Songs>> fetchSongs(String query) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://spotify23.p.rapidapi.com/search/',
        options: Options(
          headers: {
            'X-RapidAPI-Key': 'a5a24d9647mshfe1a5565bbfa735p1d3852jsneb055f84cc73', // Replace with your actual API key
            'X-RapidAPI-Host': 'spotify23.p.rapidapi.com',
          },
        ),
        queryParameters: {
          'type': 'multi',
          'q': query,
        },
      );

      print('response :$response');

      if (response.statusCode == 200) {
        if (response.data['albums'] != null) {
          var albums = response.data['albums']['items'];
          if (albums is List) {
            return albums.map((item) {
              var albumData = item['data'];
              return Songs.fromJson({
                'uri': albumData['uri'] ?? '',
                'name': albumData['name'] ?? '',
                'coverArt': (albumData['coverArt'] != null &&
                    albumData['coverArt']['sources'] != null &&
                    albumData['coverArt']['sources'].isNotEmpty)
                    ? albumData['coverArt']['sources'][0]['url']
                    : '',
              });
            }).toList();
          } else {
            throw Exception('Albums data is not a list');
          }
        } else {
          throw Exception('Albums key is not present in response');
        }
      } else {
        throw Exception('Failed to load songs: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load songs: $e');
    }
  }

  void _search() {
    setState(() {
      songs = fetchSongs(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Songs List'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _search();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for songs...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _search();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Songs>>(
              future: songs,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data found'));
                } else {
                  List<Songs> songsList = snapshot.data!;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      childAspectRatio: 0.75, // Adjust for height vs width
                    ),
                    itemCount: songsList.length,
                    itemBuilder: (context, index) {
                      final songItem = songsList[index];
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${songItem.name}',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text('URI: ${songItem.uri}'),
                              songItem.coverArt.isNotEmpty
                                  ? Image.network(songItem.coverArt)
                                  : Text('No cover art available'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}




// import 'package:dio/dio.dart';
//
// import '../models/sportfy_model.dart';
//
// class ApiService {
//   final Dio _dio = Dio();
//
//   Future<List<Song>> fetchSongs(String query) async {
//     try {
//       final response = await _dio.get(
//         'https://spotify23.p.rapidapi.com/search/',
//         options: Options(
//           headers: {
//             'X-RapidAPI-Key': 'a5a24d9647mshfe1a5565bbfa735p1d3852jsneb055f84cc73', // Replace with your API key
//             'X-RapidAPI-Host': 'spotify23.p.rapidapi.com',
//           },
//         ),
//         queryParameters: {
//           'type': 'multi',
//           'q': query,
//         },
//       );
//
//       if (response.statusCode == 200) {
//         List<Song> songs = (response.data['albums']['items'] as List)
//             .map((item) => Song.fromJson(item['data']))
//             .toList();
//         return songs;
//       } else {
//         throw Exception('Failed to load songs');
//       }
//     } catch (e) {
//       throw Exception('Failed to load songs: $e');
//     }
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class ImagePage extends StatefulWidget {
//   const ImagePage({super.key});
//
//   @override
//   _ImagePageState createState() => _ImagePageState();
// }
//
// class _ImagePageState extends State<ImagePage> {
//   late PageController _controller;
//   int _currentPage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PageController(viewportFraction: 0.8);
//
//     // Timer for automatic scrolling
//     Timer.periodic(const Duration(seconds: 2), (Timer timer) {
//       if (_currentPage < 8) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }
//       _controller.animateToPage(
//         _currentPage,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeIn,
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text("Image Page")),
//       ),
//       body: PageView.builder(
//         controller: _controller,
//         itemCount: 9, // Adjust this number based on your images
//         itemBuilder: (context, index) {
//           return Container(
//             width: 300, // Fixed width
//             height: 200, // Fixed height
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(30),
//                 child: Image.asset(
//                   _getImagePath(index),
//                   fit: BoxFit.contain, // Use BoxFit.contain to fit the full image
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   String _getImagePath(int index) {
//     // Add your image paths here
//     switch (index) {
//       case 0:
//         return 'assets/side21.jpg';
//       case 1:
//         return 'assets/hart.png';
//       case 2:
//         return 'assets/images/balu.png'; // Corrected path
//       case 3:
//         return 'assets/side21.jpg';
//       case 4:
//         return 'assets/hart.png';
//       case 5:
//         return 'assets/images/balu.png'; // Corrected path
//       case 6:
//         return 'assets/side21.jpg';
//       case 7:
//         return 'assets/hart.png';
//       case 8:
//         return 'assets/images/balu.png'; // Corrected path
//       default:
//         return 'assets/side21.jpg';
//     }
//   }
// }



import 'dart:async';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late ScrollController _scrollController;
  int _currentIndex = 0;
  final int _itemCount = 9; 

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentIndex < _itemCount - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _scrollController.animateTo(
        _currentIndex * 320.0, 
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Image Page")),
      ),
      body: SizedBox( 
        height: 200, 
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal, 
          itemCount: _itemCount,
          itemBuilder: (context, index) {
            return Container(
              width: 300, 
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    _getImagePath(index),
                    fit: BoxFit.contain, 
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return 'assets/side21.jpg';
      case 1:
        return 'assets/hart.png';
      case 2:
        return 'assets/images/balu.png'; 
      case 3:
        return 'assets/side21.jpg';
      case 4:
        return 'assets/hart.png';
      case 5:
        return 'assets/images/balu.png'; 
      case 6:
        return 'assets/side21.jpg';
      case 7:
        return 'assets/hart.png';
      case 8:
        return 'assets/images/balu.png'; 
      default:
        return 'assets/side21.jpg';
    }
  }
}

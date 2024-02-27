import 'package:flutter/material.dart';

class ImageWidget {
  ImageWidget();

  static Widget homeImage(String imageUrl) {
    try {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
        child: Image.network(
          imageUrl,
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/image/movie-poster-placeholder.png');
          },
        ),
      );
    } catch (e) {
      return const Text('Image not available');
    }
  }

  static Widget detailedImage(String imageUrl) {
    try {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          imageUrl,
          height: 450.0,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/image/movie-poster-placeholder.png');
          },
        ),
      );
    } catch (e) {
      return Image.asset('assets/image/movie-poster-placeholder.png');
    }
  }
}

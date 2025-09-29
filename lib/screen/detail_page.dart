import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latihanquiz_124230036/models/movie_list.dart';

class DetailPage extends StatelessWidget {
  final MovieModel movie;
  const DetailPage({super.key, required this.movie});

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Tidak dapat membuka $url');
    }
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: const Color.fromARGB(255, 147, 198, 238), // biru muda
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                movie.imgUrl,
                height: 300,
              ),
            ),
            const SizedBox(height: 16),
            Text('${movie.title} (${movie.year})',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Genre: ${movie.genre}'),
            Text('Sutradara: ${movie.director}'),
            Text('Rating: ⭐ ${movie.rating}'),
            const SizedBox(height: 8),
            Text('Sinopsis:\n${movie.synopsis}'),
            const SizedBox(height: 12),
            Text('Pemeran:', style: const TextStyle(fontWeight: FontWeight.bold)),
            ...movie.casts.map((cast) => Text('- $cast')).toList(),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () => _openUrl(movie.movieUrl),
                child: const Text('Klik Disini'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

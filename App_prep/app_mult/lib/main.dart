import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MultimediaScreen(),
    );
  }
}

class MultimediaScreen extends StatefulWidget {
  const MultimediaScreen({super.key});

  @override
  State<MultimediaScreen> createState() => _MultimediaScreenState();
}

class _MultimediaScreenState extends State<MultimediaScreen> {
  late AudioPlayer _audioPlayer;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    // Inicializa o reprodutor de áudio
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    );

    // Inicializa o reprodutor de vídeo
    _videoController = VideoPlayerController.network(
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    )..initialize().then((_) {
        setState(() {}); // Atualiza a interface quando o vídeo está pronto
      });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplicativo Multimídia")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Controle de Áudio
            const Text(
              "Reprodutor de Áudio",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await _audioPlayer.play();
              },
              child: const Text("Reproduzir Áudio"),
            ),
            ElevatedButton(
              onPressed: () async {
                await _audioPlayer.pause();
              },
              child: const Text("Pausar Áudio"),
            ),
            ElevatedButton(
              onPressed: () async {
                await _audioPlayer.stop();
              },
              child: const Text("Parar Áudio"),
            ),
            const SizedBox(height: 20),

            // Controle de Vídeo
            const Text(
              "Reprodutor de Vídeo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    _videoController.play();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.pause),
                  onPressed: () {
                    _videoController.pause();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: () {
                    _videoController.seekTo(Duration.zero);
                    _videoController.pause();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

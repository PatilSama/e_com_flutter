import 'package:e_com_flutter/api_integration/meme_app/models/meme_model.dart';
import 'package:e_com_flutter/api_integration/meme_app/services/meme_service.dart';
import 'package:e_com_flutter/api_integration/meme_app/widgets/meme_card.dart';
import 'package:flutter/material.dart';

class MemeHomePage extends StatefulWidget {
  const MemeHomePage({super.key});

  @override
  State<MemeHomePage> createState() => _MemeHomePageState();
}

class _MemeHomePageState extends State<MemeHomePage> {
  List<Meme> memes = [];
  bool isLoading = true;
  Color background = Colors.deepPurple;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMemes();
  }

  Future<void> fetchMemes() async{
    final fetchMemes = await MemeService.fetchMemes(context);
    setState(() {
      memes = fetchMemes ?? [];
      isLoading = false;
    });
  }

  void updateBackgroundColor(Color color) {
    setState(() {
      background = color;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meme App"),
        centerTitle: true,
        backgroundColor: background.withOpacity(0.8),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [background.withOpacity(0.8), background.withOpacity(0.8)],
          ),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : memes.isEmpty
            ? Center(
          child: Text("No Memes Found."),
        )
            : ListView.builder(
          itemCount: memes.length,
          itemBuilder: (context, index) {
            final meme = memes[index];
            return MemeCard(
                title: meme.title,
                imageUrl: meme.url,
                ups: meme.ups,
                postLink: meme.postLink,
                onColorExtracted:updateBackgroundColor);
          },
        ),
      ),
    );
  }
}

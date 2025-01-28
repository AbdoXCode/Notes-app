import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/views/edit_note_view.dart';
import '../models/note_model.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  void initState() {
    super.initState();
    loadInterstitialAd();
  }

  @override
  void dispose() {
    interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(
            note: widget.note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 32,
          bottom: 32,
          left: 16,
        ),
        decoration: BoxDecoration(
          color: Color(widget.note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                widget.note.title,
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  widget.note.content,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  widget.note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  if (interstitialAd != null) {
                    showInterstitialAd();  // Show the ad only if it is loaded
                  } else {
                    print('Interstitial ad is not ready.');
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Note deleted successfully',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.black,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                widget.note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InterstitialAd? interstitialAd;

void loadInterstitialAd() {
  InterstitialAd.load(
    adUnitId: 'ca-app-pub-4212757073877803/7317377539',
    request: AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (InterstitialAd ad) {
        print('Interstitial ad loaded');
        interstitialAd = ad;
      },
      onAdFailedToLoad: (LoadAdError error) {
        print('Interstitial ad failed to load: ${error.message}');
      },
    ),
  );
}

void showInterstitialAd() {
  if (interstitialAd != null) {
    interstitialAd!.show();
    interstitialAd = null;
  } else {
    print('Interstitial ad is not ready.');
  }
}

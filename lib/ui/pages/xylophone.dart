import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

const ROUTE_XYLOPHONE = '/xylophone';

class Note {
  final String file;
  final Color color;

  Note({this.file, this.color});
}

class XylophonePage extends StatefulWidget {
  @override
  _XylophonePageState createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  bool isRow = false;
  static final List<Note> notes = [
    Note(file: 'note1.wav', color: Colors.red),
    Note(file: 'note2.wav', color: Colors.orange),
    Note(file: 'note3.wav', color: Colors.yellow),
    Note(file: 'note4.wav', color: Colors.green),
    Note(file: 'note5.wav', color: Colors.lightBlue),
    Note(file: 'note6.wav', color: Colors.blue),
    Note(file: 'note7.wav', color: Colors.purple),
  ];
  final player = AudioCache(prefix: 'sounds/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: SafeArea(
        child: Flex(
          direction: isRow ? Axis.horizontal : Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            for (var note in notes)
              Expanded(
                child: FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  color: note.color,
                  onHighlightChanged: (bool changed) => changed ? player.play(note.file) : '',
                  onPressed: () => {},
                  onLongPress: () => setState(() => isRow = !isRow),
                  child: null,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    player.loadAll(notes.map((e) => e.file).toList());
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }
}

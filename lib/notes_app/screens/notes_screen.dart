import 'package:e_com_flutter/notes_app/database/notes_database.dart';
import 'package:e_com_flutter/notes_app/screens/note_card.dart';
import 'package:flutter/material.dart';

import 'note_dialog.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Map<String, dynamic>> notes = [];

  final List<Color> notesColors = [
    Color(0xFFF3E5F5),
    Color(0xFFFFF3E0),
    Color(0xFFE1F5FE), // Light BT
    Color(0xFFFCE4EC), // Light Pi
    Color(0xFF89CFF0), // Baby Blu
    Color(0xFFFFABAB), // Light Red
    Color(0xFFB2F9FC), // Light Cya
    Color(0xFFFFD59A), // Light Pea
    Color(0xFFFFE4B5), // Moccasin
    Color(0xFF98FB98), // Pale Green
    Color(0xFFFFD700), // Gold
    Color(0xFFAFEEEE), // Pale Turqu
    Color(0xFFFFB6C1), // Light Pink
    Color(0xFFFAFAD2), // Light Golde
    Color(0xFFD3D3D3), // Light Grey
  ];

  @override
  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    final fetchNotes = await NotesDatabase.instance.getNotes();
    print("Called");
    setState(() {
      notes = fetchNotes;
    });
  }
  void showNoteDialog(
      {int? id, String? title, String? content, int colorIndex = 0}) {
    showDialog(
        context: context,
        builder: (context) {
          return NoteDialog(
              colorIndex: colorIndex,
              noteColors: notesColors,
              noteId: id,
              title: title,
              content: content,
              onNoteSaved:
                  (newTitle, newDescription, newColorIndex, currentDate) async {
                if (id == null) {
                  await NotesDatabase.instance.addNote(
                      newTitle, newDescription, currentDate, newColorIndex);
                } else {
                  await NotesDatabase.instance.updateNote(
                      newTitle, newDescription, currentDate, newColorIndex, id);
                }
                fetchNotes();
              });
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {showNoteDialog();},
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black87,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Notes",
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
      body: notes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notes_outlined,
                    size: 80,
                    color: Colors.grey[600],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "No Notes Found",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return NoteCard(note: note, onDelete: ()async{
                    await NotesDatabase.instance.deleteNote(note['id']);
                    fetchNotes();
                  }, onTap: (){
                     showNoteDialog(id: note['id'],title: note['title'],content: note['description'],colorIndex: note['color']);
                  }, noteColors: notesColors);
                },
              ),
            ),
    );
  }
}

import 'package:e_com_flutter/notes_app/database/notes_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteDialog extends StatefulWidget {
  const NoteDialog(
      {super.key,
      this.noteId,
      this.title,
      this.content,
      required this.colorIndex,
      required this.noteColors,
      required this.onNoteSaved});

  final int? noteId;
  final String? title;
  final String? content;
  final int colorIndex;
  final List<Color> noteColors;
  final Function onNoteSaved;

  @override
  State<NoteDialog> createState() => _NoteDialogState();
}

class _NoteDialogState extends State<NoteDialog> {
  late int _selectedColorIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedColorIndex = widget.colorIndex;
  }

  @override
  Widget build(BuildContext context) {
    
    final titleController = TextEditingController(text: widget.title);
    final descriptionController = TextEditingController(text: widget.content);

    final currentDate = DateFormat('E d MMM').format(DateTime.now());
    return AlertDialog(
      backgroundColor: widget.noteColors[_selectedColorIndex],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        widget.noteId == null ? "Add Note" : "Edit Note",
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentDate,
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.5),
                labelText: "Title",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  labelText: "Description",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Wrap(
              spacing: 8,
              children: List.generate(
                widget.noteColors.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColorIndex = index;
                      });
                    },
                    child: CircleAvatar(
                        radius: 16,
                        backgroundColor: widget.noteColors[index],
                        child: _selectedColorIndex == index
                            ? Icon(
                                Icons.check,
                                color: Colors.black54,
                              )
                            : null),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.black54),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () async {
            final newTitle = titleController.text;
            final newDescription = descriptionController.text;

            widget.onNoteSaved(
                newTitle, newDescription, _selectedColorIndex, currentDate);
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}

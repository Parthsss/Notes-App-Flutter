 
// import "dart:js_interop_unsafe";

import "package:cloud_firestore/cloud_firestore.dart";
// import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class NotePage extends StatefulWidget {
  // if we want to call page.dart we have to call these three parameters
  final String title;
  final String content;
  final String id;
  const NotePage({super.key, required this.title, required this.content, required this.id});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController _noteTitle = TextEditingController();
  TextEditingController _noteContent = TextEditingController();

  @override
  void initState() {
    _noteTitle.text = widget.title;
    _noteContent.text = widget.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final swidth = MediaQuery.sizeOf(context).width / 100;
    final sheight = MediaQuery.sizeOf(context).height / 100;

    return Scaffold(
      body: Container(
        width: 100 * swidth,
        height: 100 * sheight,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/note-bg.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10 * swidth),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 8 * sheight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 60 * swidth,
                      child: TextField(
                        controller: _noteTitle,
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 3.2 * sheight,
                        ),
                        decoration: const InputDecoration(
                            hintText: 'Title Goes Here',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(226, 223, 211, 200),
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      child: SizedBox(
                        child: Image.asset('assets/delete.png'),
                      ),
                      onTap: () {
                        FirebaseFirestore.instance.collection("Notes").doc(widget.id).delete();
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
                SizedBox(height: 2 * sheight),
                Container(
                  width: 80 * swidth,
                  height: 1,
                  color: Colors.white,
                ),
                SizedBox(height: 3 * sheight),
                SizedBox(
                  height: 70 * sheight,
                  child: TextField(
                    controller: _noteContent,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: GoogleFonts.raleway(
                        color: const Color.fromARGB(226, 223, 211, 200),
                        fontSize: 1.5 * sheight),
                    decoration: const InputDecoration(
                        hintText: 'Enter your notes here...',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(226, 223, 211, 200),
                        ),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 1.7 * sheight),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    backgroundColor: const Color.fromARGB(192, 223, 90, 83)
                  ),
                  onPressed: () async {
                      if(widget.id==''){
                          FirebaseFirestore.instance.collection("Notes").add({
                            'title':_noteTitle.text,
                            'content':_noteContent.text
                      });
                      }else{
                        FirebaseFirestore.instance.collection("Notes").doc(widget.id).update({
                            'title' : _noteTitle.text,
                            'content':_noteContent.text
                        });
                      }
                      // goes to previous page after clicking save
                      Navigator.pop(context);
                  },
                  child: Text("Save",
                      style: GoogleFonts.raleway(
                          fontSize: 1.7 * sheight,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        )),
                )
              ],
            ),
          ),
        ),
      ),
   );
 }
}
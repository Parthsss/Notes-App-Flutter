import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Note extends StatefulWidget {

  final String title;
  final String note;
  const Note({super.key,required this.title,required this.note});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    final swidth = MediaQuery.sizeOf(context).width/100;
    final sheight = MediaQuery.sizeOf(context).height/100;
    return Padding(
      
      padding: EdgeInsets.only(bottom: sheight*3),
      child: Container(
        height: swidth*40,
        decoration: BoxDecoration(
          color: const Color.fromARGB(179, 0, 0, 0),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: EdgeInsets.all(sheight*2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.raleway(
                  fontSize: sheight*2.3,
                  color: Colors.white,
                  fontWeight:FontWeight.w700
                ),
                
              ),
                SizedBox(height: sheight*0.7,),
                Text(
                  widget.note,
                  style: GoogleFonts.raleway(
                    color: const Color.fromARGB(226, 223, 211, 200),
                    fontSize: sheight*1.5
                  ),
                )
            ],
          ),
        ),
      ),

    );
  }
}
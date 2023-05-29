import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifierWidget extends StatelessWidget {
  final String text;

  const NotifierWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      width: 400,
      height: 60.0,
      
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
           style: GoogleFonts.roboto(fontSize: 15,color: Colors.white,decoration: TextDecoration.none,)
          ),
          spacerbox,
          Icon(Icons.lightbulb_circle),
        ],
      ),
    );
  }
}
///as Notifier
  void showOverlay(BuildContext context,alerttext) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16.0,
        right: 16.0,
        child: Align(
          alignment: Alignment.topRight,
          child: NotifierWidget(text: alerttext!),
        ),
      ),
    );

    overlayState.insert(overlayEntry);

    // Remove the overlay after a delay
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

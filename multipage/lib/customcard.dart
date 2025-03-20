import 'package:flutter/material.dart';

class Customcard extends StatefulWidget {
  final String img;
  final String title;
  final String summary;
  const Customcard(this.img, this.title, this.summary, {super.key});

  @override
  State<Customcard> createState() => _CustomcardState();
}

class _CustomcardState extends State<Customcard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(16),
            child: Image.network(widget.img, width: 100)),
        Expanded(
            child: Column(
          children: <Widget>[
            Text(widget.title,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            Text(widget.summary)
          ],
        ))
      ],
    );
  }
}

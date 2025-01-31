//

import 'package:flutter/material.dart';

class DestinationWidget extends StatelessWidget {
  const DestinationWidget(
      {required this.destinationName, required this.imgURL});

  final String destinationName;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(destinationName),
      Image(image: NetworkImage(imgURL)),
    ]);
  }
}

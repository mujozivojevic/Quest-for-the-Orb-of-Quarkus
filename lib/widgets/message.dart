import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoq_flutter/providers/maps_provider.dart';

class MessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapsProvider maps = Provider.of<MapsProvider>(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 134.0,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text(maps.maps.message,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontFamily: 'LexendMega')),
          ),
        ),
      ],
    );
  }
}

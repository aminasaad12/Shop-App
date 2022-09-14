
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Row(
          children: [
            Flexible(
              child: Text('Add long text here',
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ))
    ;
  }
}

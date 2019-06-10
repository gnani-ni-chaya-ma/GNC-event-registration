import 'package:flutter_web/material.dart';

class MobileLists extends StatelessWidget {
  final BoxConstraints constraints;

  const MobileLists({Key key, this.constraints}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.red,
      child: Center(
        child: Text('Mobile View !'),
      ),
    );
  }
}

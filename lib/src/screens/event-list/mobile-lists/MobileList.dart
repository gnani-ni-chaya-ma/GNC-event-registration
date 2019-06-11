import 'package:flutter_web/material.dart';
import 'package:gnc_event_registration/src/constants/EventListConst.dart';
import 'package:gnc_event_registration/src/models/event/EventModel.dart';

class MobileLists extends StatelessWidget {
  final BoxConstraints constraints;

  const MobileLists({Key key, this.constraints}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Event List',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: eventListConst.length,
        itemBuilder: (BuildContext context, int index) {
          return _cardView(eventListConst[index], context);
        },
      ),
    );
  }

  _cardView(EventModel data, context) {
    return Container(
      height: constraints.maxHeight / 8,
      padding: EdgeInsets.all(10),
      child: InkWell(
        // onTap: _settingModalBottomSheet(),
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return Container(
                  child: new Wrap(
                    children: <Widget>[
                      new ListTile(
                          leading: new Icon(Icons.music_note),
                          title: new Text('Music'),
                          onTap: () => {}),
                      new ListTile(
                        leading: new Icon(Icons.videocam),
                        title: new Text('Video'),
                        onTap: () => {},
                      ),
                    ],
                  ),
                );
              });
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: data.color,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                data.name,
                style: TextStyle(fontSize: 25),
              ),
              Text(
                '${data.startDate} - ${data.endDate}',
                style: TextStyle(fontSize: 15),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

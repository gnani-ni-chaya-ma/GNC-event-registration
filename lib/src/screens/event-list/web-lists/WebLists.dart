import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:gnc_event_registration/src/constants/EventListConst.dart';
import 'package:gnc_event_registration/src/models/event/EventModel.dart';

class WebLists extends StatefulWidget {
  final BoxConstraints constraints;

  const WebLists({Key key, this.constraints}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebListState();
  }
}

class WebListState extends State<WebLists> {
  int currentStepperStep = 0;
  PageController controller =
      PageController(viewportFraction: 0.7, keepPage: false, initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      print('${controller} before');
      setState(() {
        currentStepperStep = int.parse(controller.page.toString()).round();
        controller.jumpToPage(currentStepperStep);
      });
      print('${controller} after');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // color: Colors.blue,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _stepperLabels(),
          ),
          Expanded(
            flex: 3,
            child: _stepperCard(),
          )
        ],
      ),
    );
  }

  _stepperLabels() {
    return Container(
      child: Stepper(
        controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
            Container(),
        currentStep: currentStepperStep,
        onStepTapped: (value) {
          currentStepperStep = value;
          controller.jumpToPage(value);
        },
        steps: List.generate(
          eventListConst.length,
          (index) {
            return Step(
                title: Text(
                  eventListConst[index].name,
                  style: TextStyle(
                      fontSize: currentStepperStep == index ? 25 : 20,
                      color: currentStepperStep == index
                          ? Colors.blue
                          : Colors.blueGrey),
                ),
                content: Container());
          },
        ),
      ),
    );
  }

  _stepperCard() {
    return Container(
      color: Colors.blueGrey,
      child: PageView(
        pageSnapping: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: controller,
        children: List.generate(
          eventListConst.length,
          (index) {
            return Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              padding: EdgeInsets.all(30),
              child: listCardView(eventListConst[index]),
            );
          },
        ),
      ),
    );
  }

  listCardView(data) {
    return Container(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          child: Text(
            data.name,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

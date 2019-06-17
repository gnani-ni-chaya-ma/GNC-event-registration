import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:gnc_event_registration/src/constants/EventListConst.dart';
import 'package:gnc_event_registration/src/models/event/EventModel.dart';

class WebLists extends StatefulWidget {
  final BoxConstraints constraints;
  final data;
  const WebLists({Key key, this.constraints, this.data}) : super(key: key);

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
    print(widget.data);
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        currentStepperStep = int.parse(controller.page.toString()).round();
        // controller.jumpToPage(currentStepperStep);
        controller.animateToPage(
          currentStepperStep,
          curve: Curves.easeIn,
          duration: Duration(seconds: 10),
        );
      });
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
            child: _stepperLabels(widget.constraints),
          ),
          Expanded(
            flex: 3,
            child: _stepperCard(),
          )
        ],
      ),
    );
  }

  _stepperLabels(BoxConstraints constraints) {
    return Container(
      child: Stepper(
        controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
            Container(),
        currentStep: currentStepperStep,
        onStepTapped: (value) {
          currentStepperStep = value;
          controller.animateToPage(
            value,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(seconds: 2),
          );
        },
        steps: List.generate(
          eventListConst.length,
          (index) {
            return Step(
                title: Container(
                  width: widget.constraints.maxWidth / 8,
                  child: Text(
                    eventListConst[index].name,
                    style: TextStyle(
                        fontSize: currentStepperStep == index ? 20 : 15,
                        color: currentStepperStep == index
                            ? eventListConst[index].color
                            : Colors.blueGrey),
                  ),
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
            return InkWell(
              onTap: () => Navigator.pushNamed(context, '/form'),
              child: Container(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                padding: EdgeInsets.all(30),
                child: listCardView(eventListConst[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  listCardView(EventModel data) {
    return Container(
      child: Card(
        color: data.color,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  data.name,
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  '${data.startDate} - ${data.endDate}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

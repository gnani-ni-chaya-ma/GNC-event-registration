import 'package:flutter_web/material.dart';
import 'package:gnc_event_registration/src/models/event-form/EventFormModel.dart';
import 'package:intl/intl.dart';
import 'package:validators/validators.dart';

class MobileEventForm extends StatefulWidget {
  final dynamic constraints;

  MobileEventForm(this.constraints);

  @override
  State<StatefulWidget> createState() {
    return MobileEventFormState();
  }
}

class MobileEventFormState extends State<MobileEventForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  int _radioValue = -1;

//  int _index = 0;

  EventFormModel formDetails;

  @override
  Widget build(BuildContext context) {
    return _buildForm();
  }

  _buildForm() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _firstName(),
              _lastName(),
              _mobileNumber(),
              _email(),
              _ymhtCenter(),
              _dobSelector(),
              _roleSelector(),
              SizedBox(
                height: 30,
              ),
              _submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  _firstName() {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box),
          border: OutlineInputBorder(),
          fillColor: Colors.white70,
          filled: true,
          hintText: "First Name",
        ),
        validator: (String value) {
          try {
            if (!isAlpha(value) || value.isEmpty) {
              throw Exception;
            }
          } catch (e) {
            return 'First Name should not be empty';
          }
          return null;
        },
      ),
    );
  }

  _lastName() {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box),
          border: OutlineInputBorder(),
          fillColor: Colors.white70,
          filled: true,
          hintText: "Last Name",
        ),
        validator: (String value) {
          try {
            if (!isAlpha(value) || value.isEmpty) {
              throw Exception;
            }
          } catch (e) {
            return 'Last Name should not be empty';
          }
          return null;
        },
      ),
    );
  }

  _mobileNumber() {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          border: OutlineInputBorder(),
          fillColor: Colors.white70,
          filled: true,
          hintText: "Mobile Number",
        ),
        validator: (String value) {
          try {
            if (!isLength(value, 10, 10) || !isNumeric(value)) {
              throw Exception;
            }
          } catch (e) {
            return 'Enter Valid Mobile Number';
          }
          return null;
        },
      ),
    );
  }

  _email() {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.alternate_email),
          border: OutlineInputBorder(),
          fillColor: Colors.white70,
          filled: true,
          hintText: "Email Address",
        ),
        validator: (String value) {
          try {
            if (!isEmail(value)) {
              throw Exception;
            }
          } catch (e) {
            return 'Enter Valid Email Address';
          }
          return null;
        },
      ),
    );
  }

  _dobSelector() {
    return Container(
      padding: EdgeInsets.all(5),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: () => _selectDate(context),
        color: Colors.white70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Icon(
                  Icons.cake,
                  color: Colors.black45,
                ),
                Text(
                  '  Date of Birth',
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ],
            ),
            Text(
              DateFormat('dd - MMMM - yyyy').format(selectedDate),
              style: TextStyle(fontSize: 17, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      // ignore: curly_braces_in_flow_control_structures
      setState(() => selectedDate = picked);
  }

  int ageCalculator() {
    var todaysDate = new DateTime.now();
    selectedDate;
    Duration difference = todaysDate.difference(selectedDate);
    int age = (difference.inDays / 365).toInt();
    return age;
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  _roleSelector() {
    return ageCalculator() < 21
        ? Container()
        : Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.accessibility,
                      color: Colors.black45,
                    ),
                    Text(
                      '  Register as :',
                      style: TextStyle(fontSize: 18, color: Colors.black45),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      activeColor: Colors.pinkAccent,
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text(
                      'Helper',
                      style: TextStyle(fontSize: 18, color: Colors.black45),
                    ),
                    Radio(
                      activeColor: Colors.pinkAccent,
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text(
                      'Coordinator',
                      style: TextStyle(fontSize: 18, color: Colors.black45),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  _ymhtCenter() {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_on),
          border: OutlineInputBorder(),
          fillColor: Colors.white70,
          filled: true,
          hintText: "YMHT Center",
        ),
        validator: (String value) {
          try {
            if (!isAlpha(value) || value.isEmpty) {
              throw Exception;
            }
          } catch (e) {
            return 'Enter Valid YMHT Center';
          }
          return null;
        },
      ),
    );
  }

  _submitButton() {
    return Container(
      width: widget.constraints,
      padding: EdgeInsets.all(5),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        onPressed: () {
          _formKey.currentState.validate();
        },
        color: Colors.blue,
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 17, color: Colors.black87),
        ),
      ),
    );
  }
//  Widget _builderStep() {
//    List<Step> _formSteps = [
//      Step(
//        title: _stepperLabel("First Name"),
//        content: FormTextField("Your First Name", Icons.account_circle),
//      ),
//      Step(
//        title: _stepperLabel("Last Name"),
//        content: FormTextField("Your Last Name", Icons.account_circle),
//      ),
//      Step(
//        title: _stepperLabel("Email"),
//        content: FormTextField("Your email address", Icons.email),
//      ),
//      Step(
//        title: _stepperLabel("Mobile Number"),
//        content: FormTextField(
//            "10 Digit Mobile Number", Icons.phone),
//      ),
//    ];
//    return Container(
//      margin: EdgeInsets.only(top: 10),
//      color: Colors.blueGrey,
//      child: Stepper(
//        steps: _formSteps,
//        currentStep: _index,
//        onStepTapped: (index) {
//          setState(() {
//            _index = index;
//          });
//        },
//        onStepContinue: () {
//          setState(() {
//            if (_index < _formSteps.length - 1) {
//              _index = _index + 1;
//            } else {
//              _index = 0;
//            }
//          });
//        },
//        // controlsBuilder: (BuildContext context,
//        //         { VoidCallback onStepCancel}) =>
//        //     Container(),
//      ),
//    );
//  }

//  _stepperLabel(String labelText) {
//    return Text(
//      labelText,
//      style: TextStyle(fontSize: 30, color: Colors.white70),
//    );
//  }

//  _stepperTextField(String hint, IconData icon) {
//    return TextFormField(
//      decoration: InputDecoration(
//          hintText: hint,
//          prefixIcon: Icon(icon),
//          border: OutlineInputBorder(),
//          filled: true,
//          fillColor: Colors.white70),
//    );
//  }
}

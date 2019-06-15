import 'package:flutter_web/material.dart';

class FormTextField extends StatefulWidget{

  String hint;
  IconData icon;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FormTextField(this.hint, this.icon);

  @override
  State<StatefulWidget> createState() {
    return FormTextFieldState();
  }


}

class FormTextFieldState extends State<FormTextField>{
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        key: widget._formKey,
        decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: Icon(widget.icon),
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white70),
      ),
    );;
  }

}
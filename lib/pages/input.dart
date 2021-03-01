import 'package:components_demo/shared/components/text-input.dart';
import 'package:flutter/material.dart';

import 'package:components_demo/shared/components/appbar_back.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _teController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack('Input'),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          _nameInput(),
          SizedBox(height: 10),
          _emailInput(),
          SizedBox(height: 10),
          _passwordInput(),
          SizedBox(height: 15),
          _calendarInput(context),
          SizedBox(height: 15),
          RaisedButton(
            color: Colors.black,
            textColor: Colors.white,
            child: Text('Register'),
            shape: StadiumBorder(),
            onPressed: () {},
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
          )
        ],
      ),
    );
  }

  Widget _nameInput() {
    return TextInputField(
      hint: 'Enter your name',
      type: TextInputType.text,
      leadingIcon: Icons.account_circle_outlined,
    );
  }

  Widget _emailInput() {
    return TextInputField(
      hint: 'Enter your email',
      type: TextInputType.emailAddress,
      leadingIcon: Icons.email_outlined,
    );
  }

  Widget _calendarInput(BuildContext context) {
    return TextInputField(
        hint: 'Select your birthdate',
        type: TextInputType.datetime,
        leadingIcon: Icons.calendar_today_outlined,
        ctrl: _teController,
        onPress: () {
          // prevent focus
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        });
  }

  Widget _passwordInput() {
    return TextInputField(
      hint: 'Enter your password',
      type: TextInputType.text,
      obscure: true,
      leadingIcon: Icons.lock_outlined,
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025));

    if (picked != null) {
      final dateStr = DateFormat('yyyy-MM-dd').format(picked);
      _teController.text = dateStr;
    }
  }
}

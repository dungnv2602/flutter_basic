import 'package:flutter/material.dart';

class DateTimePickerSample extends StatefulWidget {
  @override
  _DateTimePickerSampleState createState() => _DateTimePickerSampleState();
}

class _DateTimePickerSampleState extends State<DateTimePickerSample> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2019),
        lastDate: DateTime(2030));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('$_selectedDate'),
            Text('$_selectedTime'),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Select date'),
              onPressed: () {
                _selectDate(context);
              },
            ),
            RaisedButton(
              child: Text('Select time'),
              onPressed: () {
                _selectTime(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

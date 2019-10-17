import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

class FormDemo extends StatefulWidget {
  FormDemo({Key key}) : super(key: key);

  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do ppl call you?',
                labelText: 'Name *',
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
              onSaved: (String value) {
                /// this optional block of code can be used to run code when user saves form
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                /// Validate will return true if the form is valid, or false if the form is invalid.
                if (_formKey.currentState.validate()) {
                  /// Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => new _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();
  String _name = '';
  String _password = '';
  String _email = '';
  int _age = 0;
  int _selectedGender = 0;
  String _maritalStatus = 'single';
  bool _termsChecked = false;

  String _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter name',
                    hintText: 'Name',
                    icon: Icon(Icons.face),
                    fillColor: Colors.lightBlue),
                validator: (value) {
                  if (value.isEmpty) return 'Pls enter a name';
                },

                /// An optional method to call with the final value when the form is saved.
                onSaved: (value) {
                  /// setState method notifies the framework that the internal state of this object has changed.
                  setState(() {
                    _name = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter Email',
                    hintText: 'Email',
                    icon: Icon(Icons.face),
                    fillColor: Colors.blueAccent),
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email';
                  }
                },
                onSaved: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              TextFormField(
                key: _passKey,

                /// Property to hide the text being edited
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Enter Password',
                    hintText: 'Password',
                    icon: Icon(Icons.face),
                    fillColor: Colors.blue),
                validator: (value) {
                  if (value.isEmpty) return 'Pls enter password';
                  if (value.length < 8)
                    return 'Password should be more than 8 chars';
                },
              ),
              TextFormField(
                key: _passKey,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Enter Confirm Password',
                    hintText: 'Confirm Password',
                    icon: Icon(Icons.face),
                    fillColor: Colors.white),
                validator: (confirmPassword) {
                  if (confirmPassword.isEmpty)
                    return 'Pls enter confirm password';
                  var password = _passKey.currentState.value;
                  if (!equalsIgnoreCase(confirmPassword, password))
                    return 'Password should be more than 8 chars';
                },
                onSaved: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              DropdownButton(
                elevation: 2,
                isExpanded: true,
                hint: Text('Select Gender'),
                icon: Icon(Icons.face),
                iconDisabledColor: Colors.black26,
                iconEnabledColor: Colors.white,
                items: <DropdownMenuItem>[
                  DropdownMenuItem(
                    child: Text('Male'),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text('Female'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('Other'),
                    value: 2,
                  )
                ],
                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Married'),
                value: 'married',

                ///The currently selected value for this group of radio buttons.
                groupValue: _maritalStatus,

                ///Called when the value of the RadioListTile should change.
                onChanged: (value) {
                  setState(() {
                    _maritalStatus = value;
                  });
                },
              ),
              CheckboxListTile(
                value: _termsChecked,
                onChanged: (value) {
                  setState(() {
                    _termsChecked = value;
                  });
                },
                subtitle: !_termsChecked
                    ? Text(
                        'Required',
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      )
                    : null,
                title: new Text(
                  'I agree to the terms and condition',
                ),

                ///Where to place the control relative to the text.
                controlAffinity: ListTileControlAffinity.leading,
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState.validate() && _termsChecked) {
                    _formKey.currentState.save();

                    print("Name " + _name);
                    print("Email " + _email);
                    print("Age " + _age.toString());
                    switch (_selectedGender) {
                      case 0:
                        print("Gender Male");
                        break;
                      case 1:
                        print("Gender Female");
                        break;
                      case 3:
                        print("Gender Others");
                        break;
                    }
                    print("Marital Status " + _maritalStatus);
                    print("Password " + _password);
                    print("Termschecked " + _termsChecked.toString());
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Form Submitted')));
                  }
                },
              )
            ]));
  }
}

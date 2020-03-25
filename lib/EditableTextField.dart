import 'package:flutter/material.dart';

class DisableTextField extends StatefulWidget {
  @override
  DisableTextFieldState createState() {
    return new DisableTextFieldState();
  }
}

class DisableTextFieldState extends State<DisableTextField> {
  TextEditingController _textFieldController = TextEditingController();
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disable TextField Example'),
         // IconButton(
    //   icon: Icon(
    //     Icons.edit,
    //     color: Colors.white,
    //   ),
    //   onPressed: () {
    //     setState(() {
    //       _isEnabled = !_isEnabled;
         
    //     });
    //      icon:Icon
    //       (
    //         Icons.check_circle,
    //         color: Colors.white,
    //       );
    //   },
    // )
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Padding(
                  //Add padding around textfield
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _textFieldController,
                    //Set this field to enable or disable (true or flase)
                    enabled: _isEnabled,
                    decoration: InputDecoration(hintText: "TextField"),
                  ),
                ),
              ),
            ),
            /*
            RaisedButton(
              onPressed: () => setState(() => _isEnabled = !_isEnabled),
              child: Text(_isEnabled ? "Disable" : "Enable"),
              color: Colors.pink,
            ),
            */
              IconButton(
              onPressed: () => setState(() => _isEnabled = !_isEnabled),
              //child: Text(_isEnabled ? "Disable" : "Enable"),
              icon: Icon(Icons.edit),
              color: Colors.pink,
            ),
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
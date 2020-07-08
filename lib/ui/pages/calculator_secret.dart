import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:super_app/ui/widgets/custom_app_bar.dart';
import 'package:super_app/util/styles.dart';

const ROUTE_CALCULATOR_SECRET = '/calculator-secret';

class CalculatorSecretPage extends StatefulWidget {
  @override
  _CalculatorSecretPageState createState() => _CalculatorSecretPageState();
}

class _CalculatorSecretPageState extends State<CalculatorSecretPage> {
  List<Contact> _contacts = [];
  String customNumber = '';

  @override
  void initState() {
    super.initState();
    Permission.contacts.request().isGranted.then((isGranted) {
      if (isGranted) {
        ContactsService.getContacts()
            .then((contacts) => setState(() => _contacts = contacts.toList()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Your contacts'),
      floatingActionButton: RawMaterialButton(
        onPressed: () {
          Alert(
            context: context,
            title: 'Custom number',
            content: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                onChanged: (value) => setState(() => customNumber = value),
                decoration: InputDecoration(
                  labelText: 'Enter any number',
                  labelStyle: TextStyle(color: Colors.black),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.phone,
                autofocus: true,
                inputFormatters: [
                  WhitelistingTextInputFormatter(RegExp(r'\d')),
                ],
              ),
            ),
            buttons: [
              DialogButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                color: Colors.black,
              ),
              DialogButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, customNumber);
                },
                child: Text(
                  'Okay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                color: Colors.black,
              ),
            ],
            style: MyStyles.alertStyle,
          ).show();
        },
        fillColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Add custom number',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ),
      body: _contacts.length > 0
          ? ListView(
              padding: const EdgeInsets.only(top: 16.0, bottom: 74.0),
              children: _contacts.map((contact) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 24.0,
                        right: 24.0,
                        top: 6.0,
                      ),
                      child: Text(
                        contact.displayName,
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                    for (var phone in contact.phones)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24.0,
                          top: 4.0,
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context, phone.value),
                          child: Text(
                            phone.value,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    SizedBox(height: 6.0),
                    Divider(),
                  ],
                );
              }).toList(),
            )
          : Center(
              child: Text(
                'Sorry, contacts not available',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
    );
  }
}

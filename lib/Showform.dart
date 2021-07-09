import 'package:flutter/material.dart';
import 'formcontact.dart';

class ShowForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ShowMyForm(title: 'แบบฟอร์มข้อมูลผู้อุปการะ'),
    );
  }
}

class ShowMyForm extends StatefulWidget {
  ShowMyForm({Key key, this.title}) : super(key: key);
  String name, tel, address;
  final String title;

  @override
  _ShowFormState createState() => _ShowFormState();
}

class _ShowFormState extends State<ShowMyForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = MyHomePageState.name, address= MyHomePageState.address, phonenumber= MyHomePageState.phonenumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body:Column(
       children: [
         Container(
           child: Text(name),


         ),
          Container(
           child: Text(address),


         ),
         Container(
           child: Text(phonenumber),


         ),
       ],



      ),
    );
  }
}

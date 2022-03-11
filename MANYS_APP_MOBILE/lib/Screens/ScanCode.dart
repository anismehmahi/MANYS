import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanPage extends StatefulWidget {
  @override
  _BarcodeScanPageState createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  String barcode ="-1";

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        try {
          Navigator.pop(context,barcode); //close the popup
        } catch (e) {}
      },
    ),
      title: Text("Scan",style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.amber,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Scan Result',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          barcode=="-1" ? Container():Icon(Icons.verified, color: Colors.green,size: 60,),

          barcode=="-1" ? Container():Text(
            '$barcode',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 72),
          ButtonWidget(
            text: 'Start Barcode scan',
            onClicked: scanBarcode,
          ),
        ],
      ),
    ),
  );
  Future<String> scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return "";

      // setState(() {
      //   this.barcode = barcode;
      // });
      return barcode;
    } on PlatformException {
      barcode = 'Failed to get platform version.';
    }
  }
}
class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
    child: Text(
      text,
      style: TextStyle(fontSize: 24),
    ),
    shape: StadiumBorder(),
    color: Colors.amber,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    textColor: Colors.black,
    onPressed: onClicked,
  );
}
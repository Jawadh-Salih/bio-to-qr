import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatelessWidget {

  var json;
  QRCode(this.json);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code of Your details"),
      ),
      body: Center(
        child: QrImage(
          data: json,
          version: QrVersions.auto,
          size: 320,
          gapless: false,
        ),
      ),
    );
  }
}

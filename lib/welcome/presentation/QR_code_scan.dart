import 'dart:convert';
import 'package:amwal/core/utils/prefrences.dart';
import 'package:amwal/generated/l10n.dart';
import 'package:amwal/model/qr_api.dart';
import 'package:amwal/model/qr_apimodel.dart';
import 'package:amwal/welcome/presentation/Auth/login.dart';
import 'package:amwal/widgets/font/black18text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  final MobileScannerController controller =
      MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);

  QRApi? qrApi;
  @override
  void dispose() {
    qrApi;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Black18text(text: S.of(context).turnonthecameraandscan),
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (barcodes) {
          qrApi = QRApiModel.fromJson(json.decode(barcodes
              .barcodes.firstOrNull!.displayValue!
              .toString()
              .replaceAll(r'\', r'\\')) as Map<String, dynamic>);
          if (qrApi != null) {
            Preferences.saveAPI(qrApi!.api);
            Preferences.savepconnection(qrApi!.pconnection);
            Preferences.savepport(qrApi!.pport);
            Preferences.savephost(qrApi!.phost);
            Preferences.savepdatabase(qrApi!.pdatabase);
            Preferences.savepusername(qrApi!.pusername);
            Preferences.saveppassword(qrApi!.ppassword);
            Preferences.savePOSGUID(qrApi!.pOSGUID);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          }
        },
      ),
    );
  }
}

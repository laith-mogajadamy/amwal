import 'dart:convert';

import 'package:amwal/core/utils/prefrences.dart';
import 'package:amwal/generated/l10n.dart';
import 'package:amwal/main.dart';
import 'package:amwal/model/qr_api.dart';
import 'package:amwal/model/qr_apimodel.dart';
import 'package:amwal/welcome/presentation/Auth/login.dart';
import 'package:amwal/widgets/black18text.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
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
      body: Column(
        children: [
          Expanded(
            child: QRCodeDartScanView(
              onCapture: (result) {
                qrApi = QRApiModel.fromJson(
                    json.decode(result.text) as Map<String, dynamic>);
                print(qrApi);

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
          ),
          // if (qrApi != null)
          //   Padding(
          //       padding:
          //           const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          //       child: Black18text(text: 'Scanned Result: $qrApi')),
        ],
      ),
    );
  }
}

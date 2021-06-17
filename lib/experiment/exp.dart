import 'dart:io';
import 'package:face_net_authentication/experiment/NlpDetectorView/entity_extraction_view.dart';
import 'package:face_net_authentication/experiment/NlpDetectorView/language_identifier_views.dart';
import 'package:face_net_authentication/experiment/NlpDetectorView/language_translator_views.dart';
import 'package:face_net_authentication/experiment/NlpDetectorView/smart_reply.dart';
import 'package:face_net_authentication/experiment/VisionDetectorViews/barcode_scanner_view.dart';
import 'package:face_net_authentication/experiment/VisionDetectorViews/digital_ink_recognizer_view.dart';
import 'package:face_net_authentication/experiment/VisionDetectorViews/face_detector_View.dart';
import 'package:face_net_authentication/experiment/VisionDetectorViews/label_detector_view.dart';
import 'package:face_net_authentication/experiment/VisionDetectorViews/pose_detector_view.dart';
import 'package:face_net_authentication/experiment/VisionDetectorViews/text_detector_view.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google ML Kit Demo App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ExpansionTile(
                    title: const Text("Vision"),
                    children: [
                      CustomCard(
                        'Image Label Detector',
                        ImageLabelView(),
                        featureCompleted: true,
                      ),
                      CustomCard(
                        'Face Detector',
                        FaceDetectorView(),
                        featureCompleted: true,
                      ),
                      CustomCard(
                        'Barcode Scanner',
                        BarcodeScannerView(),
                        featureCompleted: true,
                      ),
                      CustomCard(
                        'Pose Detector',
                        PoseDetectorView(),
                        featureCompleted: true,
                      ),
                      CustomCard(
                        'Digital Ink Recogniser',
                        DigitalInkView(),
                        featureCompleted: true,
                      ),
                      CustomCard(
                        'Text Detector',
                        TextDetectorView(),
                        featureCompleted: true,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    title: const Text("Natural Language"),
                    children: [
                      CustomCard(
                          'Language Identifier', LanguageIdentifierView()),
                      CustomCard(
                          'Language Translator', LanguageTranslatorView()),
                      CustomCard('Entity Extractor', EntityExtractionView()),
                      CustomCard('Smart Reply', SmartReplyView())
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String _label;
  final Widget _viewPage;
  final bool featureCompleted;

  const CustomCard(this._label, this._viewPage,
      {this.featureCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Text(
          _label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          if (Platform.isIOS && !featureCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text(
                    'This feature has not been implemented for iOS yet')));
          } else
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => _viewPage));
        },
      ),
    );
  }
}
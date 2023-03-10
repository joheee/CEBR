import 'dart:ffi';

import 'package:cebr/firebase/firebase_util.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Faq {
  String index;
  String question;
  String answer;
  
  Faq({
    this.index = '0',
    this.question = 'dummy question',
    this.answer = 'dummy answer'
  });

  Future<String> getImageFromStorage() async {
    Reference faqPhotoRef = storageInstance.ref('faq').child('faq-icon.png');
    String url = await faqPhotoRef.getDownloadURL();
    return url;
  }
}
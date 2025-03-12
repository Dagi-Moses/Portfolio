import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;




  Future<List<String>> uploadImagesToStorage( List<Uint8List> files) async {
    List<String> downloadUrls = [];

    for (Uint8List file in files) {
      // Creating location to our Firebase storage
      Reference ref = _storage.ref().child('projects').child(_auth.currentUser!.uid);

      String id = const Uuid().v1();
      ref = ref.child(id);

      try {
        // Putting in Uint8List format -> Upload task
        UploadTask uploadTask = ref.putData(file);
        TaskSnapshot snapshot = await uploadTask;

        // Get the download URL
        String downloadUrl = await snapshot.ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
      } catch (e) {
        print('Failed to upload image: $e');
      }
    }

    return downloadUrls;
  }
}
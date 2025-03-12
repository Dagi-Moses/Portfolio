// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:typed_data';


import 'package:Dagi_Moses_Portfolio/functions/storageMethods.dart';
import 'package:Dagi_Moses_Portfolio/models/projects.dart';
import 'package:Dagi_Moses_Portfolio/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

Future<void> launchUrlFunction(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}






class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<void> uploadPost({
    required Project project,
    required List<Uint8List> file,
    required Function(bool) setLoadingState,
    required VoidCallback clearFields,
    required BuildContext context,
  }) async {
    try {
      setLoadingState(true);

      // Log the start of the upload process
      print('Starting upload process...');

      // Upload images to storage
      List<String> photoUrl =
          await StorageMethods().uploadImagesToStorage(file);
      project.imageUrls = photoUrl;
      print('Image upload completed. Photo URLs: $photoUrl');

      // Generate a unique post ID
      String postId = const Uuid().v1();
      print("Generated post ID: $postId");
      print(project.toMap());
      // Save project data to Firestore
      await _firestore.collection('projects').doc(postId).set(project.toMap())
        //  .timeout(const Duration(seconds: 120))
      ;
      print('Project uploaded to Firestore with ID: $postId');

      // Clear input fields and show success message
      clearFields();
      showSnackBar(context, 'Project Uploaded Successfully!');
    } on FirebaseException catch (e) {
      // Handle specific Firebase exceptions
      showSnackBar(context, 'Firebase error: ${e.message}');
      print('FirebaseException: ${e.message}');
    } catch (e) {
      // Handle any other exceptions
      showSnackBar(context, 'An unexpected error occurred');
      print('General Exception: ${e.toString()}');
    } finally {
      // Ensure the loading state is reset regardless of success or failure
      setLoadingState(false);
      print('Upload process completed, loading state set to false');
    }
  }

}
  

  

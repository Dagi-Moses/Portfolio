import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// for picking up image from gallery
// pickImage(ImageSource source) async {
//   try {
//  final ImagePicker imagePicker = ImagePicker();
//     XFile? file = await imagePicker.pickImage(source: source);
//     if (file != null) {
//       return await file.readAsBytes();
//     }
//   } catch (e) {
//     print(e);
//   }

// }
Future<List<Uint8List>?> pickImages() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true, // Allow multiple selection
    );

    if (result != null && result.files.isNotEmpty) {
      // Convert the selected files to Uint8List
      List<Uint8List> fileBytesList = result.files.map((file) {
        return file.bytes!;
      }).toList();
      return fileBytesList;
    }
  } catch (e) {
    print('Error picking images: $e');
  }
  return null;
}

// for displaying snackbars
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

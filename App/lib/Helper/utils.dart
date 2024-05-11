import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:gallery_picker/models/media_file.dart';
import'package:flutter/material.dart';

Future <File?> getImageFromGallery(BuildContext context) async {
  try {
    List<MediaFile>? singleMedia =
    await GalleryPicker.pickMedia(context: context, singleMedia: true);


    if (singleMedia != null && singleMedia.isNotEmpty) {
      return singleMedia.first.getFile();
    } else {
      // Return null if singleMedia is null or empty
      return null;
    }

  } catch (e) {
    print(e);
  }
  return null;
}

Future<bool> uploadFileForUser(File file) async {
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final storageRef = FirebaseStorage.instance.ref();
    final fileName = file != null && file is File ? file!.path.split("/").last : "defaultFileName";
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final uploadRef = storageRef.child("$userId/uploads/$timestamp-$fileName");
    await uploadRef.putFile(file);
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}

Future<List<Reference>?> getUsersUplodedFiles() async {
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final storageRef = FirebaseStorage.instance.ref();
    final uploadsRefs = storageRef.child("$userId/uploads");
    final uploads = await uploadsRefs.listAll();
    return uploads.items;
  } catch (e) {
    print(e);
  }
}
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagenAvatar extends StatefulWidget {
  final Function(XFile file) onChangeDate;

  const ImagenAvatar({Key? key, required this.onChangeDate}) : super(key: key);

  @override
  State<ImagenAvatar> createState() => _ImagenAvatarState();
}

class _ImagenAvatarState extends State<ImagenAvatar> {
  Uint8List? _newPictureFile;
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final XFile? imageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      _newPictureFile = await imageFile.readAsBytes();
      _imageFile = imageFile;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return CircleAvatar(
      radius: 50,
      backgroundImage:
          _newPictureFile != null ? Image.memory(_newPictureFile!).image : null,
      backgroundColor: _newPictureFile != null
          ? theme.onPrimaryContainer
          : Colors.grey.shade300,
      child: IconButton(
        onPressed: () async {
          await _pickImage();
          widget.onChangeDate(_imageFile!);
        },
        icon: const Icon(Icons.add_a_photo),
        color: Colors.white,
      ),
    );
  }
}

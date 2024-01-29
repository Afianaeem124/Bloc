import 'dart:io';

import 'package:blflutter/bloc/imagepicker/bloc/imagepicker_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ImagepickerBloc, ImagepickerState>(builder: (context, state) {
          return state.file == null
              ? InkWell(
                  onTap: () {
                    context.read<ImagepickerBloc>().add(CameraImagePicker());
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.camera_outlined),
                  ))
              : Container(
                  color: Colors.black,
                  height: 300,
                  width: 300,
                  child: Image.file(
                    File(state.file!.path.toString()),
                    height: 200,
                    width: 200,
                  ),
                );
          
        }),
      ),
    );
  }
}

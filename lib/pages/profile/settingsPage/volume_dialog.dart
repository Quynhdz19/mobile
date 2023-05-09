import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/utils/constants.dart';

class VolumeDialog extends StatefulWidget {
  const VolumeDialog({Key? key, required this.initialVolume}) : super(key: key);

  final double initialVolume;

  @override
  State<VolumeDialog> createState() => _VolumeDialogState();
}

class _VolumeDialogState extends State<VolumeDialog> {
  late double _volume;
  @override
  void initState() {
    super.initState();
    _volume = widget.initialVolume;
  }

  void _updateVolume() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"volume": _volume});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Container(

            padding: const EdgeInsets.only(right: 6),
            child: Text('Set volume',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                )),
          ),

      content: Container(
        height: 100,

        child: SliderTheme (data: SliderThemeData(
          trackHeight: 12,
        ),
          child: SizedBox(
            // width: 300,
            child: Slider(
              value: _volume * 100,
              min: 0,
              max: 100,
              divisions: 10,
              label: (_volume * 100).round().toString(),
              onChanged: (value) => setState(
                () => _volume = value / 100,
              ),
            ),
          ),
        ),),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('cancel'.tr, style: const TextStyle(color: redColor))),
        TextButton(
          onPressed: () {
            print("new value of volume");
            print(_volume);
            Navigator.pop(context, _volume);
            _updateVolume();
          },
          child: Text(
            "Save",
            style: const TextStyle(color: greenColor),
          ),
        ),
      ],
    );
  }
}

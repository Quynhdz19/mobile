import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_front_end/utils/constants.dart';

showSuccessToast(BuildContext context, String message) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: greenColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.check,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ))
      ],
    ),
  );

  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
      gravity: ToastGravity.TOP);
}

showFailureToast(BuildContext context, String message) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: redColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.error,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ))
      ],
    ),
  );

  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
      gravity: ToastGravity.TOP);
}

showWarningToast(BuildContext context, String message) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: orangeColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.warning,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ))
      ],
    ),
  );

  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
      gravity: ToastGravity.TOP);
}

showInfoToast(BuildContext context, String message) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: blueColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.info_outline,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ))
      ],
    ),
  );

  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
      gravity: ToastGravity.TOP);
}

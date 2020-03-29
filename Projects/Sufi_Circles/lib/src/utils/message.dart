import 'package:flutter/material.dart';

SnackBar showErrorMessage(String msg) {
  return SnackBar(content: Text(msg), backgroundColor: Colors.red);
}

SnackBar showSuccessMessage(String msg) {
  return SnackBar(content: Text(msg), backgroundColor: Colors.green);
}

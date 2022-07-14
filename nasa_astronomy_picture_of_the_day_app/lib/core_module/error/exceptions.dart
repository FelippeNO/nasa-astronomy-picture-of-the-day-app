import 'package:flutter/material.dart';

class CoreException implements Exception {
  CoreException(StackTrace? stackTrace, String? label, dynamic exception) {
    debugPrintStack(label: 'Exception :: $label', stackTrace: stackTrace);
  }
}

class JSONParserException extends CoreException {
  JSONParserException(super.stackTrace, super.label, super.exception);
}

class GetPicturesException extends CoreException {
  GetPicturesException(super.stackTrace, super.label, super.exception);
}

class GetPictureException extends CoreException {
  GetPictureException(super.stackTrace, super.label, super.exception);
}

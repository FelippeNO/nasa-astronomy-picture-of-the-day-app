import 'package:flutter/material.dart';

class CoreException implements Exception {
  CoreException(StackTrace? stackTrace, String? label, dynamic exception) {
    debugPrintStack(label: 'Exception :: $label', stackTrace: stackTrace);
  }
}

class JSONParserException extends CoreException {
  JSONParserException(super.stackTrace, super.label, super.exception);
}

class GetPicturesListException extends CoreException {
  GetPicturesListException(super.stackTrace, super.label, super.exception);
}

class GetPictureOfTheDayException extends CoreException {
  GetPictureOfTheDayException(super.stackTrace, super.label, super.exception);
}

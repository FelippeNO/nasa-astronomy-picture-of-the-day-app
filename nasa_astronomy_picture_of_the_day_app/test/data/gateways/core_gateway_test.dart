import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/data/gateways/core_gateway.dart';

class MockCoreGateway extends Mock implements ICoreGateway {}

void main() {
  CoreGateway gateway;
}

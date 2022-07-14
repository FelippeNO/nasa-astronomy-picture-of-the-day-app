import 'package:faker/faker.dart';

String get proxyImgUrl => 'https://picsum.photos/seed/image${faker.randomGenerator.integer(100)}/500/500';
String proxyWords([int words = 12]) => faker.lorem.words(words).join(' ');
String get proxyName => faker.person.name();
DateTime get proxyDate => faker.date.dateTime();

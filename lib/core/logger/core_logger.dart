 import 'package:logger/logger.dart';

class CoreLogger {
  static var logger = Logger(
    printer: PrettyPrinter(),
  );
}
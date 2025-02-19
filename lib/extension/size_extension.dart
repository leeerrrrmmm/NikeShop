import 'package:flutter/cupertino.dart';

extension SizedBoxCheck on num {
  SizedBox get wBox => (SizedBox(width: toDouble()));
  SizedBox get hBox => (SizedBox(height: toDouble()));
}

import 'package:flutter/foundation.dart';

abstract class Database {}

class FiresStoreDatabase implements Database {
  FiresStoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;
}

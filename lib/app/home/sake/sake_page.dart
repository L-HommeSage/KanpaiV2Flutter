import 'package:flutter/material.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/services/database.dart';
import 'package:flutter/foundation.dart';

class SakePage extends StatelessWidget {
  const SakePage({@required this.database});
  final Database database;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Sake>(
      stream: database.sakeStream('3256223100226'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final sake = snapshot.data;
          return _buildSakeContent(sake);
        }
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text('Some error occurred'));
        } else {
          return _buildWaitingPage();
        }
      },
    );
  }

  Widget _buildSakeContent(Sake sake) {
    return Center(
      child: Text(sake.name),
    );
  }

  Widget _buildWaitingPage() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

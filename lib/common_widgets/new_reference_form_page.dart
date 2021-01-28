import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';

class NewRefPage extends StatefulWidget {
  const NewRefPage(
      {@required this.database, @required this.user, @required this.code});
  final Database database;
  final User user;
  final String code;

  @override
  _NewRefPageState createState() => _NewRefPageState();
}

class _NewRefPageState extends State<NewRefPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  File _image;
  bool loading;
  final picker = ImagePicker();

  final TextEditingController _newRefNameTextController =
      TextEditingController();
  final TextEditingController _newRefMoreInfoTextController =
      TextEditingController();
  String sakeName;
  String moreInfo;
  @override
  void initState() {
    super.initState();
    sakeName = "";
    moreInfo = "";
    loading = false;
  }

  @override
  void dispose() {
    _newRefNameTextController.dispose();
    _newRefMoreInfoTextController.dispose();
    super.dispose();
  }

  Future _openCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.of(context).pop();
      } else {
        print('No image selected.');
        Navigator.of(context).pop();
      }
    });
  }

  Future _openGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.of(context).pop();
      } else {
        print('No image selected.');
        Navigator.of(context).pop();
      }
    });
  }

  void _sendNewRef(BuildContext context) async {
    setState(() {
      loading = true;
    });
    String imgUrl = "";
    if (sakeName != "") {
      if (_image != null) {
        // ====== to firestorage =======
        StorageReference firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child("/newReferences")
            .child(documentIdFromCurrentDate());
        StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
        StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
        imgUrl = await taskSnapshot.ref.getDownloadURL();
      }

      // ====== to firestore =======
      final newRef = Firestore.instance;
      final DocumentReference doc =
          await newRef.collection("/new_scanned_sakes").add({
        'userId': widget.user.uid,
        'username': widget.user.displayName,
        'sakeName': sakeName,
        'moreInfo': moreInfo,
        'barreCode': widget.code,
        'imageUrl': imgUrl,
      });
      print(doc.documentID);

      final snackBar = SnackBar(
        duration: Duration(seconds: 1),
        content: Text(S.of(context).thank_you + "!!!"),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);

      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
      Navigator.pop(context);
      Navigator.pop(context);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            S.of(context).new_ref,
            style: kHeadlinesTextStyle,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryTextColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildBody(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kAccentColor,
          splashColor: kPrimaryTextColor,
          child: (loading)
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Icon(
                  Icons.send,
                ),
          onPressed: () => (loading) ? {} : _sendNewRef(context),
        ));
  }

  Column _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            S.of(context).name + "* :",
            style: kHeadlinesTextStyle,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _newRefNameTextController,
              onChanged: (text) {
                setState(() {
                  sakeName = text;
                });
              },
              textCapitalization: TextCapitalization.sentences,
              cursorColor: kAccentColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            S.of(context).more_info + " :",
            style: kCommonTextStyle,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _newRefMoreInfoTextController,
              onChanged: (text) {
                setState(() {
                  moreInfo = text;
                });
              },
              textCapitalization: TextCapitalization.sentences,
              maxLength: 250,
              minLines: 3,
              maxLines: 5,
              cursorColor: kAccentColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: _image == null
              ? Text(
                  'No image',
                  style: kCommonTextStyle,
                )
              : Container(
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: FileImage(_image), fit: BoxFit.cover)),
                ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                border: Border.all(color: kAccentColor, width: 4)),
            child: IconButton(
              iconSize: 55,
              icon: Icon(
                Icons.photo_camera,
                color: kAccentColor,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildCameraChoice(context);
                  },
                  isScrollControlled: true,
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  SingleChildScrollView _buildCameraChoice(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: kPrimaryColor,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).make_choice + " !",
                style: kHeadlinesTextStyle,
              ),
            ),
            Divider(),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: kAccentColor, width: 3)),
                  child: IconButton(
                    iconSize: 35,
                    icon: Icon(
                      Icons.image,
                      color: kAccentColor,
                    ),
                    onPressed: _openGallery,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: kAccentColor, width: 3)),
                  child: IconButton(
                    iconSize: 35,
                    icon: Icon(
                      Icons.camera_alt,
                      color: kAccentColor,
                    ),
                    onPressed: _openCamera,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    S.of(context).gallery,
                    textAlign: TextAlign.center,
                    style: kCommonTextStyle,
                  ),
                  Text(
                    S.of(context).camera,
                    textAlign: TextAlign.center,
                    style: kCommonTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

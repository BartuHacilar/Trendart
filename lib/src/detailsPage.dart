import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trendart/src/app.dart';
import 'package:trendart/src/image.dart';
import 'package:trendart/src/mainpage.dart';
import 'package:trendart/src/user.dart';

class PropertyDetailsWidget extends StatefulWidget {
  const PropertyDetailsWidget({
    this.image,
    Key? key,
  }) : super(key: key);
  final imageClass? image;

  @override
  _PropertyDetailsWidgetState createState() => _PropertyDetailsWidgetState();
}

class _PropertyDetailsWidgetState extends State<PropertyDetailsWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getGorevliIDFromStorage(context).then((value) {
      if (value != '') {
        RetrieveUser(value).then((value) {
          if (value != null) {
            setState(() {
              user = value;
            });
          }
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  FlutterSecureStorage storage = FlutterSecureStorage();
  String UserUid = '';
  UserClass? user;

  Future<String> getGorevliIDFromStorage(BuildContext context) async {
    UserUid = (await storage.read(key: "UserUid"))!;
    if (UserUid == '') {
      final prefs = await SharedPreferences.getInstance();
      UserUid = prefs.getString('UserUid')!;
      if (UserUid == '') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Sistem Hatası Tekrar Deneyin"),
          ),
        );
        return UserUid;
      } else {
        return UserUid;
      }
    } else {
      return UserUid;
    }
  }

  Future<dynamic> RetrieveUser(String uid) async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('User');

    // Firestore'da account_id değeri 3 olan belgeleri bul
    QuerySnapshot querySnapshot =
        await usersCollection.where('account_id', isEqualTo: uid).get();

    // Her belgeyi gez ve veri eklemeyi gerçekleştir
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      // Belge ID'sini al
      String documentId = documentSnapshot.id;

      // Belge içeriğini al
      Map<String, dynamic> existingData =
          documentSnapshot.data() as Map<String, dynamic>;

      List<String> stringFavourites = existingData['favourites'].cast<String>();
      List<String> stringInventory = existingData['inventory'].cast<String>();

      // Yeni veriyi ekleyin veya mevcut veriyi güncelleyin
      UserClass RetrievedUser = new UserClass(
          uid: uid,
          account_id: existingData['account_id'],
          favourites: stringFavourites,
          name: existingData['name'],
          profile_edited: existingData['profile_edited'],
          background_image: existingData['background_image'],
          avatar_image: existingData['avatar_image'],
          inventory: stringInventory,
          wallet: existingData['wallet']);
      return RetrievedUser;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFCFBDA3),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 320.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFDBE2E7),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {},
                                  child: Hero(
                                    tag: 'mainImage',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: buildImageFromBase64(
                                          widget.image!.base64),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            Navigator.pop(context);
                                          },
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0x3A000000),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.arrow_back_rounded,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget.image!.name,
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Theme.of(context).errorColor,
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget.image!.author,
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'DESCRIPTION',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Theme.of(context).primaryColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 24.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .color,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.image!.owner == ''
                      ? InkWell(
                          onTap: () {
                            // Container'a tıklandığında yapılacak işlemler buraya gelir
                            if (user!.wallet > widget.image!.price) {
                              print('purchase girildi');
                              purchase(
                                  user!.account_id,
                                  user!.wallet - widget.image!.price,
                                  widget.image!.id);
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFEE7D4),
                                  Color.fromRGBO(173, 120, 55, 1)
                                ],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${widget.image!.price.toString()} \$',
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                    fontSize: 30.0,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Buy Now ',
                                      style: TextStyle(
                                        fontFamily: 'Urbanist',
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Icon(
                                      Icons.shopping_cart,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFEE7D4),
                                Color.fromRGBO(98, 173, 55, 1)
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Owned',
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                  fontSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageFromBase64(String base64String) {
    // Base64 kodunu çözme
    Uint8List bytes = base64.decode(base64String);

    // Uint8List'i Image widget'ında kullanma
    return Image.memory(
      bytes,
      fit: BoxFit.cover,
      width: MediaQuery.sizeOf(context).width * 1,
      height: MediaQuery.sizeOf(context).height *
          1, // Resmi widget'ın boyutlarına sığdır
    );
  }

  Future<void> purchase(String userId, int newAmount, String imageID) async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('User');
    final CollectionReference imageCollection =
        FirebaseFirestore.instance.collection('Image');

    try {
      await FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        QuerySnapshot querySnapshot =
            await usersCollection.where('account_id', isEqualTo: userId).get();

        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          String documentId = documentSnapshot.id;
          Map<String, dynamic> existingData =
              documentSnapshot.data() as Map<String, dynamic>;
          

          // Yeni veriyi ekleyin veya mevcut veriyi güncelleyin
          existingData['wallet'] = newAmount;

          // Belgeyi güncelle
          transaction.update(usersCollection.doc(documentId), existingData);

          print('Veri eklendi/güncellendi: $documentId');
        }

        QuerySnapshot querySnapshotImage =
            await imageCollection.where('id', isEqualTo: imageID).get();

        for (QueryDocumentSnapshot documentSnapshotImage
            in querySnapshotImage.docs) {
          String imagedocumentId = documentSnapshotImage.id;
          Map<String, dynamic> imageData =
              documentSnapshotImage.data() as Map<String, dynamic>;

          // Yeni veriyi ekleyin veya mevcut veriyi güncelleyin
          imageData['owner'] = userId;

          // Belgeyi güncelle
          transaction.update(imageCollection.doc(imagedocumentId), imageData);

          print('Veri eklendi/güncellendi: $imagedocumentId');
        }
      });

      print('İşlem başarıyla tamamlandı');
    } catch (error) {
      print('Satın alma işlemi sırasında bir hata oluştu: $error');
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Message'),
        content: Text('Artwork Successfully Bought'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => NavBarPage(
                          initialPage: '',
                          page: HomePageMAINWidget(),
                        )),
              );
            },
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }
}

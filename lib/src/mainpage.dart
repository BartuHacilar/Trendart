import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:trendart/src/detailsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trendart/src/user.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'dart:ui';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'image.dart';

class HomePageMAINWidget extends StatefulWidget {
  const HomePageMAINWidget({Key? key}) : super(key: key);

  @override
  _HomePageMAINWidgetState createState() => _HomePageMAINWidgetState();
}

class _HomePageMAINWidgetState extends State<HomePageMAINWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loading = true;
    getGorevliIDFromStorage(context).then((value) {
      
      print('1');
      print(value);
      if (value != '') {
        RetrieveUser(value).then((value) {
          if (value != null) {
            print('2');
            print(value);
            setState(() {
              user = value;
              readData(value);
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

FocusNode? textFieldFocusNode;
  TextEditingController textController = new TextEditingController();
  String? Function(BuildContext, String?)? textControllerValidator;
  List<imageClass> imageList = [];
  List<imageClass> allImages = [];
  UserClass? user;

  void readData(UserClass user) {
    FirebaseFirestore.instance.collection('Image').get().then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        imageClass newImage = imageClass(
            base64: document['Base64'],
            author: document['author'],
            name: document['name'],
            price: document['price'],
            description: document['description'],
            id: document['id'],
            owner: document['owner']);

        if (user!.favourites.contains(document['id'])) {
          newImage.favourite = true;
        }

        setState(() {
          if (newImage.owner == '' || newImage.owner == user.account_id) {
            imageList.add(newImage);
          }
        });
        setState(() {
        allImages = imageList.toList();
      });

        print('3');
        loading = false;
        print(imageList);
      });
    });
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

  FlutterSecureStorage storage = FlutterSecureStorage();
  String UserUid = '';

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

  void SearchFunction(String searchTerm) {
    List<imageClass> DesiredAccounts = [];
    bool check1 = false;
    bool check2 = false;
    bool check3 = false;
    bool check4 = false;

  

      for (var element in allImages) {
        if (element.name
            .toLowerCase()
            .trim()
            .startsWith(searchTerm.toLowerCase().trim())) {
          if (!DesiredAccounts.contains(element)) {
            setState(() {
              DesiredAccounts.add(element);
            });
            
          }
        }
        
      }

      
      
   

    if (searchTerm != '') {
      setState(() {
        imageList = DesiredAccounts.toList();
      });
    } else {
      setState(() {
        imageList = allImages.toList();
      });
    }
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    const purpleColor = Colors.purple;
    const black97Color = Colors.black87;
    return BlurryModalProgressHUD(
        inAsyncCall: loading,
        blurEffectIntensity: 4,
        progressIndicator: SpinKitFadingCircle(
          color: purpleColor,
          size: 90.0,
        ),
        dismissible: false,
        opacity: 0.4,
        color: black97Color,
        child: Scaffold(
          
          key: scaffoldKey,
          backgroundColor: Color(0xFFCFBDA3),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFC6B8AE),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Color(0x39000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Hoşgeldiniz ',
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                color: Color(0xFFB5205A),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Container(
                                width: 90.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF78B17B),
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.wallet,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                      size: 24.0,
                                    ),
                                    Text(
                                      '${user!.wallet.toString()}\$',
                                      style: TextStyle(
                                        fontFamily: 'Urbanist',
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(200, 160, 131, 1),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 4.0, 0.0),
                                  child: TextFormField(
                                    controller: textController,
                                    focusNode: textFieldFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                        fontFamily: 'Urbanist',
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .color,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Urbanist',
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                
                                SearchFunction(textController.text);

                              },
                                  icon: Icon(
                                    Icons.manage_search,
                                    size: 15.0,
                                  ),
                                  label: SizedBox.shrink(),
                                  style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: imageList
                        .map((imageClass) => Artwork(image: imageClass))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Artwork extends StatefulWidget {
  const Artwork({
    this.image,
  });

  final imageClass? image;

  @override
  State<Artwork> createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  Widget buildImageFromBase64(String base64String) {
    // Base64 kodunu çözme
    Uint8List bytes = base64.decode(base64String);

    // Uint8List'i Image widget'ında kullanma
    return Image.memory(
      bytes,
      fit: BoxFit.contain,
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height *
          0.26, // Resmi widget'ın boyutlarına sığdır
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.image!.owner == ''
              ? Color(0xFF97795F)
              : Color.fromARGB(255, 95, 151, 104),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x32000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PropertyDetailsWidget(image: widget.image)),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Hero(
                tag: '',
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: buildImageFromBase64(widget.image!.base64),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        widget.image!.name,
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          color: Theme.of(context).canvasColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    (widget.image!.favourite == true)
                        ? IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 35.0,
                            ),
                            onPressed: () {
                              setState(() {
                                getGorevliIDFromStorage(context).then((value) {
                                  if (value != '') {
                                    RemoveFavourites(value, widget.image!.id);
                                  }
                                });
                                widget.image!.favourite = false;
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                              size: 35.0,
                            ),
                            onPressed: () {
                              setState(() {
                                getGorevliIDFromStorage(context).then((value) {
                                  if (value != '') {
                                    AddFavourites(value, widget.image!.id);
                                  }
                                });
                                widget.image!.favourite = true;
                              });
                            },
                          )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        widget.image != null ? widget.image!.author : '',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          color: Theme.of(context).canvasColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 24.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.image!.owner == ''
                          ? Text(
                              '${widget.image!.price.toString()} \$',
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                color: Theme.of(context).canvasColor,
                                fontSize: 25.0,
                              ),
                            )
                          : Text(
                              'Owned',
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                color: Theme.of(context).canvasColor,
                                fontSize: 25.0,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FlutterSecureStorage storage = FlutterSecureStorage();
  String UserUid = '';

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

  void AddFavourites(String uid, String imageID) async {
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

      // Yeni veriyi ekleyin veya mevcut veriyi güncelleyin
      existingData['favourites'].add(imageID);

      // Belgeyi güncelle
      await usersCollection.doc(documentId).set(existingData);

      print('Veri eklendi/güncellendi: $documentId');
    }
  }

  void RemoveFavourites(String uid, String imageID) async {
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

      // Yeni veriyi ekleyin veya mevcut veriyi güncelleyin
      existingData['favourites'].remove(imageID);

      // Belgeyi güncelle
      await usersCollection.doc(documentId).set(existingData);

      print('Veri eklendi/güncellendi: $documentId');
    }
  }
}

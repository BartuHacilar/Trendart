import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trendart/src/auth/Sign_out.dart';
import 'package:trendart/src/editProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trendart/src/login.dart';
import 'package:trendart/src/user.dart';

 

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with TickerProviderStateMixin {
  

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    getGorevliIDFromStorage(context).then((value) {
      if(value!=''){
        RetrieveUser(value).then((value) {
          if(value!=null){
            user=value;
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
  final unfocusNode = FocusNode();
  UserClass? user ;
  @override
  Widget build(BuildContext context) {
   

   

    return GestureDetector(
      onTap: () => unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFCFBDA3),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              child: Stack(
                children: [
                  Container(
  width: double.infinity,
  height: 140.0,
  decoration: BoxDecoration(
    color: Theme.of(context).secondaryHeaderColor,
    image: DecorationImage(
      fit: BoxFit.contain,
      image: AssetImage('assets/images/Trendart_transparent_transparent.png'),
    ),
  ),
)
,
                  Align(
                    alignment: AlignmentDirectional(-1.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 16.0),
                      child: Container(
                        width: 90.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(76, 175, 80, 1),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                                'assets/images/Trendart_transparent_transparent.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Container(
                      width: 140.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF78B17B),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.wallet,
                            color: Theme.of(context).primaryColorDark,
                            size: 24.0,
                          ),
                          Text(
                            '35 \$',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontFamily: 'Urbanist',
                                  color: Theme.of(context).primaryColorDark,
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Andrew D.',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Description',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                        ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        color: Color.fromRGBO(117, 117, 117, 1),
                        size: 24.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Edit Profile',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.9, 0.0),
                          child: IconButton(
  onPressed: () {
   Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const EditProfileWidget()),
      );
  },
  icon: Icon(
    Icons.arrow_forward_ios,
    color: Color.fromRGBO(117, 117, 117, 1),
    size: 18.0,
  ),
)
,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.moneyCheckAlt,
                        color:  Color.fromRGBO(117, 117, 117, 1),
                        size: 24.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Deposit Money',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.9, 0.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color:  Color.fromRGBO(117, 117, 117, 1),
                            size: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.favorite_sharp,
                        color:  Color.fromRGBO(117, 117, 117, 1),
                        size: 24.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'My Favourites',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.9, 0.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color:  Color.fromRGBO(117, 117, 117, 1),
                            size: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.photo_sharp,
                        color:  Color.fromRGBO(117, 117, 117, 1),
                        size: 24.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'My Assets',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.9, 0.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color:  Color.fromRGBO(117, 117, 117, 1),
                            size: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: ElevatedButton(
                  onPressed: () async {
                    signOut().then((value) => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginWidget(),
                                                ),
                                      ));
                   
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    padding: EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(38.0),
                    ),
                  ),
                  child: Text(
                    'Log Out',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> RetrieveUser(String uid ) async {
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
      UserClass RetrievedUser = new UserClass(uid: uid, account_id: existingData['account_id'], favourites: existingData['favourites']);
      return RetrievedUser ;

    }
    return null ;
    

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
}

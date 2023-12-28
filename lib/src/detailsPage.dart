import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trendart/src/app.dart';
import 'package:trendart/src/mainpage.dart';


class PropertyDetailsWidget extends StatefulWidget {
  const PropertyDetailsWidget({
    Key? key,
    
  }) : super(key: key);

  

  @override
  _PropertyDetailsWidgetState createState() => _PropertyDetailsWidgetState();
}

class _PropertyDetailsWidgetState extends State<PropertyDetailsWidget>
    with TickerProviderStateMixin {
 

  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  

  @override
  void initState() {
    super.initState();
    

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
   
    super.dispose();
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
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
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
                                  onTap: () async {
                                    
                                  },
                                  child: Hero(
                                    tag: 'mainImage',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.asset(
                                        'assets/images/mainscreenbackground.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            color: Color(0x3A000000),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0),
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
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Nice Painting',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              color: Theme.of(context).textTheme.bodyText1!.color,
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
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Beethoven',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
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
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Theme.of(context).textTheme.bodyText2!.color,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFEE7D4),
                          Color.fromRGBO(255, 140, 0, 1)
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
                          '1225 \$',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            color: Theme.of(context).textTheme.bodyText1!.color,
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
                                color: Theme.of(context).textTheme.bodyText1!.color,
                                fontSize: 20.0,
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                              size: 24.0,
                            ),
                          ],
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
}

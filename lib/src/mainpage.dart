import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trendart/src/detailsPage.dart';


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


    

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
  

    super.dispose();
  }
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  Widget build(BuildContext context) {
    

    

    return Scaffold(
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
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Hoşgeldin Kralbartu',
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.wallet,
                                  color: Theme.of(context).textTheme.bodyText1!.color,
                                  size: 24.0,
                                ),
                                Text(
                                  '35 \$',
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    color: Theme.of(context).textTheme.bodyText1!.color,
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
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(198, 184, 174, 1),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                              child: TextFormField(
                                controller: textController,
                                focusNode: textFieldFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontFamily: 'Urbanist',
                                    color: Theme.of(context).textTheme.bodyText2!.color,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  color: Theme.of(context).textTheme.bodyText1!.color,
                                ),
                               
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                
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
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF97795F),
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
                           Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const PropertyDetailsWidget()),
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
                                child: Image.asset(
                                  'assets/images/mainscreenbackground.png',
                                  width: double.infinity,
                                  height: 190.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Home on Beachront',
                                      style: TextStyle(
                                        fontFamily: 'Urbanist',
                                        color: Theme.of(context).canvasColor,
                                        fontSize: 18.0,
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
                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'BEETHOVEN',
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
                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 24.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '25 \$',
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

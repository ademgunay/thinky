import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thinky/app/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController!,
            ),
            onPressed: () {
              _animationController?.isDismissed == true
                  ? _animationController?.forward()
                  : _animationController?.reverse();
              _scaffoldKey.currentState?.isDrawerOpen == true
                  ? _scaffoldKey.currentState?.openEndDrawer()
                  : _scaffoldKey.currentState?.openDrawer();
            },
          ),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: Scaffold(
          onDrawerChanged: (isOpen) {
            isOpen
                ? _animationController?.forward()
                : _animationController?.reverse();
          },
          key: _scaffoldKey,
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: Text("Profile [WIP]"),
                  leading: Icon(Icons.account_circle),
                  //TODO Open profile
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Change theme [WIP]"),
                  leading: Icon(Icons.light_mode),
                  //TODO Add changing theme
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.logout),
                  //TODO Add logout logic
                  onTap: () => Get.offAllNamed(AppRoutes.INITIAL),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    "Send a poke!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                //TODO Add upload image to be linked in the poke
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    autocorrect: false,
                    onChanged: (newText) {
                      //TODO add email handler in controller
                    },
                    //TODO Add validator
                    validator: (_) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Who do you want to poke? (email)',
                    ),
                    cursorColor: Colors.purple,
                  ),
                ),
                SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(150),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(96, 96)),
                    ),
                    child: Icon(Icons.send),
                  ),
                ),
                SizedBox(
                  height: 100,
                ) //Compensate AppBar size
              ],
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
}

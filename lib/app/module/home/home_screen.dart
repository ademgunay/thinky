import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thinky/app/routes/app_routes.dart';

import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final GlobalKey<FormState> _formKey = new GlobalKey();
  HomeController _homeController = Get.find<HomeController>();
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
              color: _homeController.isLightTheme.value == true
                  ? Colors.grey.shade700
                  : Colors.white,
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
                Obx(
                  () => ListTile(
                    title: Text("Change theme"),
                    leading: Icon(_homeController.isLightTheme.value == true
                        ? Icons.dark_mode
                        : Icons.light_mode),
                    onTap: () {
                      _homeController.onChangeThemeClicked();
                    },
                  ),
                ),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.logout),
                  onTap: () {
                    _homeController.onLogoutClicked();
                    Get.offAllNamed(AppRoutes.INITIAL);
                  },
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
                Text(
                  "Send a poke to",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        autocorrect: false,
                        onChanged: (newText) {
                          _homeController.email.value = newText;
                        },
                        validator: (_) => _homeController.emailValidator(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter receiver\'s email',
                        ),
                        cursorColor: Colors.purple,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible:
                        _homeController.errorText.value != "" ? true : false,
                    child: Text(
                      _homeController.errorText.value,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                //TODO Add upload image to be linked in the poke
                Center(
                    child: Text(
                  "Add an image",
                  style: TextStyle(fontSize: 18),
                )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                  child: InkWell(
                    onTap: () => _homeController.startUploadImageFlow(),
                    child: Obx(
                      () => AspectRatio(
                        aspectRatio: 1,
                        child: _homeController.pickedImagePath.value.isNotEmpty
                            ? Image.file(
                                File(_homeController.pickedImagePath.value))
                            : Card(child: Icon(Icons.add)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        _homeController.onSendClicked();
                      }
                    },
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

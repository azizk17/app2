import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefalutLayout extends StatelessWidget {
  final appBar;
  final body;
  final floatingActionButton;
  final floatingActionButtonLocation;
  final floatingActionButtonAnimator;
  final persistentFooterButtons;
  final drawer;
  final endDrawer;
  final bottomNavigationBar;
  final bottomSheet;
  final backgroundColor;
  final resizeToAvoidBottomPadding;
  final resizeToAvoidBottomInset;
  final primary;
  final drawerDragStartBehavior;
  final extendBody;

  const DefalutLayout({
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomPadding,
    this.resizeToAvoidBottomInset,
    this.primary,
    this.drawerDragStartBehavior,
    this.extendBody,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.appBar,
      body: this.body,
      floatingActionButton: this.floatingActionButton,
      floatingActionButtonLocation: this.floatingActionButtonLocation,
      floatingActionButtonAnimator: this.floatingActionButtonAnimator,
      persistentFooterButtons: this.persistentFooterButtons,
      drawer: this.drawer,
      endDrawer: this.endDrawer,
      bottomNavigationBar: this.bottomNavigationBar,
      bottomSheet:this.bottomSheet,
      backgroundColor: this.backgroundColor,
      resizeToAvoidBottomPadding: this.resizeToAvoidBottomPadding,
      resizeToAvoidBottomInset: this.resizeToAvoidBottomInset,
      primary: this.primary,
      drawerDragStartBehavior: this.drawerDragStartBehavior ,
      extendBody: this.extendBody,
    );
  }
}

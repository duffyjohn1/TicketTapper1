import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'package:tickettapper/stacked_icons.dart';
import 'home.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
  );

initLogin() {
  _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) async {
    if (account != null) {
      // user logged
    } else {
      // user NOT logged
    }
  });
  _googleSignIn.signInSilently().whenComplete(() => dismissLoading());
}


Future<void> handleSignIn() async {
  try {
    await _googleSignIn.signIn();
    MaterialPageRoute(
      builder: (context) => HomePage(),
      );
  } catch (error) {
    print(error);
  }
}








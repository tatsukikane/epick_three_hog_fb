// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'dart:io';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //FirebaseAuthを使う為のアクセス
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //匿名ログイン関数
  Future<void> signInAnonymously() async{
    UserCredential userCredential = await _auth.signInAnonymously();
    print(userCredential.user);
  }

  //メール認証 登録
  Future<void> createUserFromEmail() async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: 'test@test.com',
      password: 'testtest'
    );
    print('Emailからユーザー作成完了');
  }

  //メール認証　ログイン
  Future<void> signInFromEmail() async{
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: 'test@test.com',
      password: 'testtest'
    );
  print(userCredential.user);
  }

  //Aplleログイン
  Future<void> signInWithApple() async{
    AuthorizationCredentialAppleID userCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]
    );
    print(Text('appleIDでログイン'));
  }

   //google認証 接続
   final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly'
    ]
   );

   //googleサインイン 関数
   Future<void> googleSignIn() async{
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    print(googleSignInAccount!.displayName);
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('サインイン'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             //匿名ログイン
            ElevatedButton(
              onPressed: () {
                signInAnonymously();
              },
            child: const Text('匿名ログイン')
            ),

            ElevatedButton(
              onPressed: () {
                createUserFromEmail();
              },
            child: const Text('アカウント作成(メール)')
            ),

            ElevatedButton(
              onPressed: () {
                signInFromEmail();
              },
            child: const Text('Emailログイン')
            ),
            //デバイスがIOSの場合のみAppleログインを表示
            Platform.isIOS ? SignInWithAppleButton(
              onPressed: signInWithApple,
            ) : Container(),
            ElevatedButton(onPressed: googleSignIn, child: const Text('Googleサインイン'))
          ],
        ),
      ),

    );
  }
}
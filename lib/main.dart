import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChatApp());
}

// ignore: use_key_in_widget_constructors
class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return ChatPage();
                }));
              },
              // ignore: prefer_const_constructors
              child: Text('ログイン'),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('チャット'),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }),
              );
            },
            // ignore: prefer_const_constructors
            icon: Icon(Icons.close),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AddPostPage();
            }),
          );
          child:
          // ignore: prefer_const_constructors
          Icon(Icons.add);
        },
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class AddPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('チャット投稿'),
      ),
      body: Center(
        child: ElevatedButton(
          // ignore: prefer_const_constructors
          child: Text('戻る'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

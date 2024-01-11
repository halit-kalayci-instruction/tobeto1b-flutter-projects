import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  var _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: "E-posta"),
                        autocorrect: false,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Şifre"),
                        autocorrect: false,
                        obscureText: true,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(_isLogin ? "Giriş Yap" : "Kayıt Ol")),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(_isLogin
                              ? "Kayıt Sayfasına Git"
                              : "Giriş Sayfasına Git"))
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

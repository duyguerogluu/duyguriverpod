import 'package:duyguriverpod/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _pageLogin = true;

  void _togglePage(bool _switchme) {
    setState(
      () {
        _pageLogin = _switchme;
      },
    );
  }

  bool _ishidden = true;

  void _toggleVisibility() {
    setState(
      () {
        _ishidden = !_ishidden;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: login.formState,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Image.network(
                        "https://logomaker.designfreelogoonline.com/media/productdesigner/logo/resized/1286_bird-01.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: login.email,
                                cursorColor: Colors.purpleAccent,
                                style: const TextStyle(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone number",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                ),
                                validator: (str) => str?.isEmpty ?? true
                                    ? 'Bu alan doldurulmalıdır'
                                    : null,
                              ),
                            ),

                            //password gircem
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: login.password,
                                cursorColor: Colors.purpleAccent,
                                obscureText: _ishidden ? true : false,
                                style: const TextStyle(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(_ishidden
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: _toggleVisibility,
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                                validator: (str) => str?.isEmpty ?? true
                                    ? 'Bu alan doldurulmalıdır'
                                    : null,
                              ),
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            var result = await login.fetchLogin();
                            if ((login.formState.currentState?.validate() ?? false) &&
                                !result) {
                              // giriş yapılamadı
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _pageLogin
                                ? const Color.fromRGBO(143, 148, 251, 1)
                                : Colors.transparent,
                            primary: Colors.transparent,
                            onPrimary: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Giriş Yap',
                            style: TextStyle(
                              fontSize: 18,
                              color: _pageLogin
                                  ? Colors.white
                                  : Color.fromARGB(255, 217, 217, 217),
                            ),
                          ),
                        ),
                      ),

                      //Şifremi Unuttum
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: InkWell(
                          child: const Text(
                            'Şifremi Unuttum',
                            style: TextStyle(
                              color: const Color.fromRGBO(143, 148, 251, 1),
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

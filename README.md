# Flutter Login
[![pub package](https://img.shields.io/pub/v/algorithm)]
[![Workflow](https://github.com/NearHuscarl/flutter_login/actions/workflows/test.yml/badge.svg?branch=master)](https://github.com/NearHuscarl/flutter_login/actions)

`QuickSort & Sum` is a ready-to-use widget for calculating algorithms.
Shows the capabilities of the filter

<p align="center">
  <a href='https://imgur.com/a/5H9k8de'>
    <img src='https://github.com/MashkaniAli/algorithms/blob/master/demo/demo.mp4' width=320>
  </a>
</p>

## Examples

### Basic quickSort

```dart
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuickSortAlgorithmScreen extends StatefulWidget {
  const QuickSortAlgorithmScreen({Key? key}) : super(key: key);

  @override
  _AlgorithmHomeScreenState createState() => _AlgorithmHomeScreenState();
}

class _AlgorithmHomeScreenState extends State<QuickSortAlgorithmScreen> {
  List<String> number = [];
  List<int> result = [];
  List<int> finalResult = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text(
                  "الگوریتم مرتب سازی سریع",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                centerTitle: true,
                backgroundColor: const Color(0xFF1A374D),
              ),
              backgroundColor: const Color(0xFFF7F7F7),
              body: SingleChildScrollView(
                reverse: true,
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30, right: 10, left: 10),
                        child: Text(
                          "مساله:\n       مرتب سازی عناصر آرایه s از کوچیک به بزرگ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30, right: 10, left: 10),
                        child: Text(
                          "ورودی ها:\n         آرایه s",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 30, right: 10, left: 10, bottom: 20),
                        child: Text(
                          "خروجی ها:\n            مرتب شده ارایه s",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 30, right: 10, left: 10, bottom: 10),
                        child: Text(
                          "زبان های استفاده شده برای طراحی نرم افزار:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "دارت( DART ) و فلاتر ( FLUTTER )",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 30, right: 10, left: 10, bottom: 10),
                        child: Text(
                          "طراحی شده توسط:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: Text(
                            "علی مشکانی / رضا صومعه",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.only(top: 30, right: 10, bottom: 15),
                        child: Text(
                          "لیست اعداد را طبق نمونه وارد کنید:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      // input button for create array
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: const Border(
                                bottom:
                                BorderSide(width: 0.5, color: Colors.black),
                                top:
                                BorderSide(width: 0.5, color: Colors.black),
                                left:
                                BorderSide(width: 0.5, color: Colors.black),
                                right:
                                BorderSide(width: 0.5, color: Colors.black),
                              )),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              number = value.split(",");
                              //print(number.runtimeType);
                            },
                            textDirection: TextDirection.ltr,
                            decoration: const InputDecoration(
                                hintText: "مثال: 1,5,3,2,4",
                                border: InputBorder.none,
                                labelText: 'لیست اعداد'),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 60, bottom: 30),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                result =
                                    number.map((e) => int.parse(e)).toList();
                                int high = result.length - 1;
                                int low = 0;
                                finalResult = quickSort(result, low, high);
                                print(finalResult);
                                String exit = "لیست اعداد مرتب شده:  " + finalResult.toString();
                                Alert(
                                    context: context,
                                    title: "لیست اعداد مرتب شده",
                                    type: AlertType.success,
                                    desc: finalResult.toString(),
                                    style: const AlertStyle(
                                        alertElevation: 5.0,
                                        descStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            fontFamily: 'IRANSANS')),
                                    buttons: [
                                      DialogButton(
                                          child: const Text(
                                            'تایید',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              number.clear();
                                              result.clear();
                                            });
                                            Navigator.of(context).pop();
                                          }),
                                    ]).show();
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green[700]),
                              width: MediaQuery.of(context).size.width - 50,
                              height: 50,
                              child: const Center(
                                  child: Text(
                                    "برای مرتب سازی اعداد اینجا بزنید",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }

  List<int> quickSort(List<int> list, int low, int high) {
    if (low < high) {
      int pi = partition(list, low, high);
      quickSort(list, low, pi - 1);
      quickSort(list, pi + 1, high);
    }
    return list;
  }

  int partition(List<int> list, low, high) {
    // Base check
    if (list.isEmpty) {
      return 0;
    }
    // Take our last element as pivot and counter i one less than low
    int pivot = list[high];

    int i = low - 1;
    for (int j = low; j < high; j++) {
      // When j is < than pivot element we increment i and swap arr[i] and arr[j]
      if (list[j] < pivot) {
        i++;
        swap(list, i, j);
      }
    }
    // Swap the last element and place in front of the i'th element
    swap(list, i + 1, high);
    return i + 1;
  }

// Swapping using a temp variable
  void swap(List list, int i, int j) {
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }
}
```

<img src="https://github.com/NearHuscarl/flutter_login/raw/master/demo/basic.png" width="300">



### Basic example with sign in providers

```dart
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'dashboard_screen.dart';
const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};
class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);
  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }
  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }
  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ECORP',
      logo: AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      
        loginProviders: <LoginProvider>[
          LoginProvider(
            icon: FontAwesomeIcons.google,
            label: 'Google',
            callback: () async {
              debugPrint('start google sign in');
              await Future.delayed(loginTime);
              debugPrint('stop google sign in');              
              return null;
            },
          ),
          LoginProvider(
            icon: FontAwesomeIcons.facebookF,
            label: 'Facebook',
            callback: () async {            
              debugPrint('start facebook sign in');
              await Future.delayed(loginTime);
              debugPrint('stop facebook sign in');              
              return null;
            },
          ),
          LoginProvider(
            icon: FontAwesomeIcons.linkedinIn,
            callback: () async {         
              debugPrint('start linkdin sign in');
              await Future.delayed(loginTime);         
              debugPrint('stop linkdin sign in');              
              return null;
            },
          ),
          LoginProvider(
            icon: FontAwesomeIcons.githubAlt,
            callback: () async {
              debugPrint('start github sign in');
              await Future.delayed(loginTime);
              debugPrint('stop github sign in');              
              return null;
            },
          ),
        ],
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
```

<img src="https://github.com/NearHuscarl/flutter_login/raw/master/demo/login-with-provider.png" width="300">



### Theming via `ThemeData`

Login theme can be customized indectly by using `ThemeData` like this

```dart
// main.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.orange,
        cursorColor: Colors.orange,
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            color: Colors.orange,
          ),
          button: TextStyle(
            fontFamily: 'OpenSans',
          ),
          subtitle1: TextStyle(fontFamily: 'NotoSans'),
          bodyText2: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
// login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'dashboard_screen.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ECORP',
      logo: AssetImage('assets/images/ecorp.png'),
      onLogin: (_) => Future(null),
      onSignup: (_) => Future(null),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ));
      },
      onRecoverPassword: (_) => Future(null),
    );
  }
}
```

<img src="https://github.com/NearHuscarl/flutter_login/raw/master/demo/theme-data.png" width="300">

### Custom labels

```dart
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'dashboard_screen.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ECORP',
      logo: AssetImage('assets/images/ecorp.png'),
      onLogin: (_) => Future(null),
      onSignup: (_) => Future(null),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ));
      },
      onRecoverPassword: (_) => Future(null),
      messages: LoginMessages(
        userHint: 'User',
        passwordHint: 'Pass',
        confirmPasswordHint: 'Confirm',
        loginButton: 'LOG IN',
        signupButton: 'REGISTER',
        forgotPasswordButton: 'Forgot huh?',
        recoverPasswordButton: 'HELP ME',
        goBackButton: 'GO BACK',
        confirmPasswordError: 'Not match!',
        recoverPasswordDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
        recoverPasswordSuccess: 'Password rescued successfully',
      ),
    );
  }
}
```

Login/Signup | Password Recovery
:-------:|:-------:
![Login/Signup](demo/custom-label-login.png)  |  ![Password Recovery](demo/custom-label-recover.png)

### Theme customization

```dart
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'dashboard_screen.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );
    return FlutterLogin(
      title: 'ECORP',
      logo: AssetImage('assets/images/ecorp-lightgreen.png'),
      onLogin: (_) => Future(null),
      onSignup: (_) => Future(null),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ));
      },
      onRecoverPassword: (_) => Future(null),
      theme: LoginTheme(
        primaryColor: Colors.teal,
        accentColor: Colors.yellow,
        errorColor: Colors.deepOrange,
        titleStyle: TextStyle(
          color: Colors.greenAccent,
          fontFamily: 'Quicksand',
          letterSpacing: 4,
        ),
        bodyStyle: TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        textFieldStyle: TextStyle(
          color: Colors.orange,
          shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
        ),
        buttonStyle: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.yellow,
        ),
        cardTheme: CardTheme(
          color: Colors.yellow.shade100,
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.purple.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: TextStyle(
            backgroundColor: Colors.orange,
            color: Colors.white,
          ),
          labelStyle: TextStyle(fontSize: 12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
            borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700, width: 7),
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade400, width: 8),
            borderRadius: inputBorder,
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 5),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Colors.purple,
          backgroundColor: Colors.pinkAccent,
          highlightColor: Colors.lightGreen,
          elevation: 9.0,
          highlightElevation: 6.0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          // shape: CircleBorder(side: BorderSide(color: Colors.green)),
          // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
        ),
      ),
    );
  }
}
```

<img src="https://github.com/NearHuscarl/flutter_login/raw/master/demo/theme.png" width="300">

## Inspiration
* [VNPAY App Interactions](https://dribbble.com/shots/3829985-VNPAY-App-Interactions)
* [Flat UI Login animated](https://dribbble.com/shots/1058688-Flat-UI-Login-animated)

## License

* MIT License

[example project]: example/
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_functions/cloud_functions.dart';

class sign_in extends StatefulWidget {
  const sign_in({Key? key}) : super(key: key);

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {

  final _auth=FirebaseAuth.instance;
  final _functions=FirebaseFunctions.instance;
  late String email,password;
  bool rememberMeToggle=false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _rememberMe = _prefs.getBool("remember_me") ?? false;

      if (_rememberMe) {
        setState(() {
          rememberMeToggle = true;
        });
        _emailController.text = _email;
        _passwordController.text = _password;
      }
    }
    catch(e){
      print(e);
    }
  }

  void _handleRememberMe(bool value) {
    rememberMeToggle = value;
    SharedPreferences.getInstance().then(
          (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', _emailController.text);
        prefs.setString('password', _passwordController.text);
      },
    );
    setState(() {
      rememberMeToggle = value;
    });
  }

  @override
  void initState() {
    loadUserEmailPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  child: Image.asset('assets/images/ezdelivery.png'),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'ezDelivery',
                      style: kNameStyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                const SizedBox(
                  height: 60.0,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: kSubjectStyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: _emailController,
                    onChanged: (value){
                      email=value;
                    },
                    style: kInstructionStyle,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'Enter email',
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: InputBorder.none,
                      fillColor: kTransparentColor,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: _passwordController,
                    onChanged: (value){
                      password=value;
                    },
                    style: kInstructionStyle,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'Enter password',
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: InputBorder.none,
                      fillColor: kTransparentColor,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          SizedBox(
                              height: 15.0,
                              width: 24.0,
                              child: Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: kAccentColor3,
                                ),
                                child: Checkbox(
                                    activeColor: kAccentColor3,
                                    value: rememberMeToggle,
                                    onChanged: (bool? value) {
                                      _handleRememberMe(value!);
                                    }
                                 ),
                              ),
                          ),
                          const SizedBox(
                              width: 5.0
                          ),
                          const Text(
                            "Remember Me",
                            style: kInstructionStyle,
                          ),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: kInstructionStyle,
                        ),
                        onPressed: () async {
                          try{
                            await _auth.sendPasswordResetEmail(email: email);
                          }
                          catch(e){
                            print(e);
                          }
                        },
                        child: const Text('Forgot Password'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: MaterialButton(
                    color: kAccentColor2,
                    height:40.0,
                    minWidth: double.infinity,
                    onPressed: () async{
                      try{
                        email=_emailController.text;
                        password=_passwordController.text;
                        final user= await _auth.signInWithEmailAndPassword(email: email, password: password);

                        if(user!=null){
                          try{
                            HttpsCallable checkUserRole=_functions.httpsCallable('checkUserRole');
                            final result=await checkUserRole.call(<String, dynamic>{'email': email,});
                            if(result.data.toString()=='customer'){
                              Navigator.pushNamed(context, '/delivery_tracking');
                            }else if(result.data.toString()=='distributor'){
                              Navigator.pushNamed(context, '/delivery_tracking');
                            }else{
                              print("not registered");
                            }
                          }catch(e){
                            print(e);
                          }
                        }
                      }
                      catch(e){
                        print(e);
                      }
                    },
                    child: const Text(
                      'Sign in',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Don\'t have an account?',
                        style: kInstructionStyle,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: kInstructionStyle,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign_up');
                        },
                        child: const Text('Sign up'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

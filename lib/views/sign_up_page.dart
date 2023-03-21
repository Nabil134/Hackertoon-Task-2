import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:emergency_service_app/views/login_page.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_passwordtextformfield.dart';
import '../Widgets/custom_text.dart';
import '../Widgets/custom_textformfield.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController email = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  bool loading = false;
  /*validation function start here */
  void validation() {
    if (email.text.isEmpty && password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All Field is Empty"),
      ));
    }
    if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Email is Empty"),
      ));
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Email is Not Valid"),
      ));
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password is Empty"),
      ));
    } else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password is Too Short "),
      ));
    } else {
      signup();
    }
  }

  /*validation function end here */
  final TextEditingController password = TextEditingController();

  //late auth = FirebaseAuth.instance;
  late UserCredential auth;
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

/*signup start here*/
  void signup() async {
    setState(() {
      loading = true;
    });
    try {
      auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      String message = "Please Check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }

    setState(() {
      loading = false;
    });
  }

/*signup end here*/
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
/*first portion start here*/
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: Color(0xffF8F8F8),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xff0A1172),
                      )),
                ),
              ],
            ),

/*first portion end here*/
            SizedBox(
              height: 20,
            ),
/*second portion start here*/
            Row(
              children: [
                Image.asset(
                  'assets/splash_screen_image.jpg',
                  height: 80,
                  width: 100,
                ),
                SizedBox(
                  width: 10,
                ),
                /*
                Text(
                  'Plantify',
                  style: TextStyle(
                    color: Color(0xff0D986A),
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              */
                CustomText(
                  title: 'Location',
                  clr: Color(0xff0A1172),
                  font: FontWeight.w700,
                  size: 22,
                ),
              ],
            ),
/*second portion end here*/
            SizedBox(
              height: 20,
            ),
/*third portion start here*/
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /*
                Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xff0D986A),
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
               */
                CustomText(
                  title: 'Sign Up',
                  clr: Color(0xff0A1172),
                  font: FontWeight.w700,
                  size: 36,
                ),
                SizedBox(
                  height: 5,
                ),
                /*
                Text(
                  'Masukan NISN dan password untukmemulai\n belajar sekarang',
                  style: TextStyle(
                    color: Color(0xff0D986A),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
             */
                CustomText(
                  title:
                      'Masukan NISN dan password untukmemulai\n belajar sekarang',
                  clr: Color(0xff0A1172),
                  font: FontWeight.w400,
                  size: 14,
                ),
              ],
            ),

/*third portion end here*/
            SizedBox(
              height: 20,
            ),
/*forth portion start here*/

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /*
                Text(
                  'Username/Email',
                  style: TextStyle(
                    color: Color(0xff8F92A1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                */
                /*Username/Email TextField start here*/
                CustomText(
                  title: 'Username/Email',
                  clr: Color(0xff8F92A1),
                  font: FontWeight.w500,
                  size: 12,
                ),
                /*Username/Email TextField end here*/
                SizedBox(
                  height: 10,
                ),
                /*
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: Color(0xff171717),
                      fontSize: 20,
                    ),
                    prefixIcon: Icon(
                      Icons.looks,
                      color: Color(0xff171717),
                    ),
                  ),
                ),
              */
                CustomTextFormField(
                  controller: email,
                  title: 'Username',
                  prefix_icon: Icons.looks,
                  obscureText: false,
                ),
              ],
            ),

/*forth portion end here*/
            SizedBox(
              height: 20,
            ),
            /*fifth portion start here*/

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /*
                Text(
                  'Password',
                  style: TextStyle(
                    color: Color(0xff8F92A1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
               */
                CustomText(
                  title: 'Password',
                  clr: Color(0xff8F92A1),
                  font: FontWeight.w500,
                  size: 12,
                ),
                SizedBox(
                  height: 10,
                ),
                /*
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Color(0xff171717),
                      fontSize: 20,
                    ),
                    prefixIcon: Icon(
                      Icons.looks,
                      color: Color(0xff171717),
                    ),
                  ),
                ),
              */
                /*Password TextField start here*/
                CustomPasswordTextFormField(
                  controller: password,
                  title: "Password",
                  obscureText: true,
                  prefix_icon: Icons.looks,
                ),
                /*Password TextField end here*/
              ],
            ),

/*fifth portion end here*/

            SizedBox(
              height: 10,
            ),
/*sixth portion start here*/
            /*
            Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff0D986A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0D986A),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {},
              ),
            ),
*/
/*seventh portion start here*/
            CustomButton(
                name: 'SIGN Up',
                onPressed: (() {
                  validation();
                })),
/*sixth portion end here*/
            SizedBox(
              height: 10,
            ),
            /*Last Portion start here*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t Have an account?',
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    ' Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0A1172),
                    ),
                  ),
                ),
              ],
            ),
            /*Last Portion end here*/
          ],
        ),
      ),
    );
  }
}

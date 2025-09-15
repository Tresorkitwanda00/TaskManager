import 'package:flutter/material.dart';
import 'package:uptodo/pages/dashboard_screen.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool islogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset('assets/images/BackButton.png'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: islogin
                    ? const EdgeInsets.only(left: 24, top: 41)
                    : const EdgeInsets.only(left: 24, top: 16),
                child: Text(
                  islogin ? 'Login' : 'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: islogin
                    ? const EdgeInsets.only(top: 53, left: 24, right: 24)
                    : const EdgeInsets.only(top: 23, left: 24, right: 24),
                child: SizedBox(
                  width: 327,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your Username",
                          hintStyle: TextStyle(
                            color: Colors.grey, // Change ici la couleur
                            fontStyle: FontStyle.italic,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: Color(0xff535353),
                              width: 0.8,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
                child: SizedBox(
                  width: 327,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "...............",
                          hintStyle: TextStyle(
                            color: Colors.grey, // Change ici la couleur
                            fontStyle: FontStyle.italic,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: Color(0xff535353),
                              width: 0.8,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              if (!islogin)
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
                  child: SizedBox(
                    width: 327,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "...............",
                            hintStyle: TextStyle(
                              color: Colors.grey, // Change ici la couleur
                              fontStyle: FontStyle.italic,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: Color(0xff535353),
                                width: 0.8,
                              ),
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: islogin
                    ? const EdgeInsets.only(top: 69, left: 24, right: 24)
                    : const EdgeInsets.only(top: 40, left: 24, right: 24),
                child: SizedBox(
                  width: 327,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0x808687E7),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      islogin ? 'LOGIN' : 'Register',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: islogin
                    ? EdgeInsets.only(top: 31, left: 24, right: 24)
                    : const EdgeInsets.only(top: 18, left: 24, right: 24),
                child: SizedBox(
                  child: Row(
                    children: [
                      Container(width: 154, height: 1, color: Colors.grey),
                      Text('or', style: TextStyle(color: Colors.grey)),
                      Container(width: 154, height: 1, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: islogin
                    ? const EdgeInsets.only(top: 29, left: 24, right: 24)
                    : const EdgeInsets.only(top: 24, left: 24, right: 24),
                child: SizedBox(
                  width: 327,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff121212), // fond blanc
                      foregroundColor: Colors.white, // texte noir
                      side: BorderSide(
                        color: Color(0xff8875FF),
                        width: 1,
                      ), // bordure
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/google_logo.png', // logo Google multicolore
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Login with Google",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFDE),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: islogin
                    ? EdgeInsets.only(top: 20, left: 24, right: 24)
                    : const EdgeInsets.only(top: 17, left: 24, right: 24),
                child: SizedBox(
                  width: 327,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff121212),
                      foregroundColor: Colors.white,
                      side: BorderSide(
                        color: Color(0xff8875FF),
                        width: 1,
                      ), // bordure
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/apple_logo.png',
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Login with Apple",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFDE),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: islogin
                    ? EdgeInsetsGeometry.only(left: 104, top: 46, right: 104)
                    : EdgeInsetsGeometry.only(left: 104, top: 38, right: 104),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      islogin = !islogin;
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(
                        color: Colors.grey, // couleur du premier texte
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: islogin ? "Register" : 'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFDE),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

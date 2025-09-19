import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uptodo/models/user.dart';
import 'package:uptodo/pages/dashboard_screen.dart';
import 'package:uptodo/services/auth_controller.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool islogin = true;
  final _globalKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final cls = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: FaIcon(
            FontAwesomeIcons.angleLeft,
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _globalKey,
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
                        controller: username,
                        validator: (value) {
                          if (username.text.isEmpty || value == null) {
                            return "Please enter your username";
                          }
                          final isRegex = RegExp(r'^[A-Z][a-zA-Z]*[0-9]+$');
                          if (!isRegex.hasMatch(value)) {
                            return "username must start with a capital letter and contain at least one number ";
                          }
                          return null;
                        },
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
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "⚠️ Le mot de passe est obligatoire";
                          }

                          // Vérifie la longueur
                          if (value.length < 8) {
                            return "⚠️ Doit contenir au moins 8 caractères";
                          }

                          // Vérifie chiffre
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return "⚠️ Doit contenir au moins un chiffre";
                          }

                          // Vérifie majuscule et minuscule
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return "⚠️ Doit contenir une majuscule";
                          }
                          if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return "⚠️ Doit contenir une minuscule";
                          }

                          // Vérifie symbole
                          if (!RegExp(
                            r'[!@#\$%^&*(),.?":{}|<>]',
                          ).hasMatch(value)) {
                            return "⚠️ Doit contenir un symbole";
                          }

                          return null; // ✅ Valide
                        },
                        obscureText: false,
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
                          'Password Confirm',
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: confirmPassword,
                          obscureText: false,
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
                    // Vérification confirm password si on est en register
                    onPressed: () async {
                      // Vérifier si on est en mode inscription et que les mots de passe correspondent
                      if (!islogin && password.text != confirmPassword.text) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Password and confirm password must be the same",
                            ),
                          ),
                        );
                        return;
                      }

                      // Création du UserModel
                      var user = UserModel(
                        username: username.text,
                        password: password.text,
                        createdAt: DateTime.now(),
                        lastLogin: DateTime.now(),
                      );

                      try {
                        String result;

                        if (!islogin) {
                          // 👉 Mode inscription
                          result = await cls.signUpWithUsername(user);
                        } else {
                          // 👉 Mode connexion
                          result = await cls.signInWithUsername(user);
                        }

                        if (!mounted) return;

                        // Résultat OK
                        if (result == "success") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                islogin
                                    ? "✅ Login success"
                                    : "✅ Register success",
                              ),
                            ),
                          );

                          // Après inscription → connexion automatique
                          if (!islogin) {
                            final loginResult = await cls.signInWithUsername(
                              user,
                            );
                            if (loginResult != "success") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("❌ $loginResult")),
                              );
                              return;
                            }
                          }

                          // Navigation vers Dashboard
                          if (mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardScreen(),
                              ),
                            );
                          }
                        } else if (result == "processing") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "⚠️ Operation in progress, please wait",
                              ),
                            ),
                          );
                        } else {
                          // Afficher erreur Firebase
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text("❌ $result")));
                        }
                      } catch (e) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("❌ Unexpected error: $e")),
                        );
                      }
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

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 57),
            Center(
              child: Text(
                'Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFFFDE),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(child: Image.asset('assets/images/profil.png')),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFFFDE),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 32),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 35,
                      top: 17,
                      bottom: 17,
                      right: 35,
                    ),
                    width: 154,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xff363636),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '10 Task left',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    padding: EdgeInsets.only(
                      left: 32,
                      top: 17,
                      bottom: 17,
                      right: 35,
                    ),
                    width: 154,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xff363636),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '5 Task done',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.settings, size: 24, color: Colors.white),
                  title: Text(
                    'App Settings',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, top: 6),
              child: Text(
                'Account',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.person, size: 24, color: Colors.white),
                  title: Text(
                    'Change account name',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.key, size: 24, color: Colors.white),
                  title: Text(
                    'Change account password',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.camera_alt_outlined,
                    size: 24,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Change account Image',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, top: 6),
              child: Text(
                'Uptodo',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.menu, size: 24, color: Colors.white),
                  title: Text(
                    'About US',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    size: 24,
                    color: Colors.white,
                  ),
                  title: Text(
                    'FAQ',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.flash_on, size: 24, color: Colors.white),
                  title: Text(
                    'Help & Feedback',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.thumb_up_alt_outlined,
                    size: 24,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Support US',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                    size: 24,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

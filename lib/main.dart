// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:splashScreen(),
    );
  }
}

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => NavBar(),
          ),
          (route) => false);
    });

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/authenticatorLogo.png', scale: 2.5,),
          const SafeArea(
            child: Column(children: [
              Text(
                "Authenticator locked",
                style: TextStyle(
                  color: Color(0xFF0474d4),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
          )
        ],
      ),
    ));
  }
}

class NavBar extends StatefulWidget {
  NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;

  List Page = [
    AuthenticatorPage(),
    passwordPage(),
    addressPage(),
    IDPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Page[index],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color(0xFF0474d4),
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11,
        selectedFontSize: 14,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label : "Authenticator"),
          BottomNavigationBarItem(icon: Icon(Icons.vpn_key_rounded), label : "Passwords"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label : "Addresses"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label : "Verified IDs"),
        ]
      ),
    );
  }
}

class AuthenticatorPage extends StatelessWidget {
  const AuthenticatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AccountList(
              Email: "IjatSatoru@telkomuniversity.ac.id",
              University: "Telkom University",
              Image: "assets/images/ijatSatoru.jpg"
            ),
            SizedBox(height: 1),
            AccountList(
              Email: "GojoSantoso@telkomuniversity.ac.id",
              University: "Telkom University",
              Image: "assets/images/gojoSantoso.jpg"
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF0474d4),
        title: Text(
          "Authenticator", 
          style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        titleSpacing: 10,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.search, color: Colors.white,size: 30,)
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.add, color: Colors.white,size: 30,)
          ),
        ],
        leading: IconButton(
          onPressed: () {}, 
            icon: Icon(Icons.menu, color: Colors.white,size: 30,),
        ),
      ),
    );
  }
}

class AccountList extends StatelessWidget {
  final String Email;
  final String Image;
  final String University;
  const AccountList({
    super.key,
    required this.Email,
    required this.Image,
    required this.University,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child : ElevatedButton(
        onPressed: () {} ,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(),
        ), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(Image)
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(University, style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
                Text(Email, style: TextStyle(color: Colors.grey, fontSize: 13)),
              ],
              ),     
            ),
            Icon(Icons.chevron_right_rounded, size: 30,color: Colors.grey)
          ],
        ),
      ),
    );
  }
}

class passwordPage extends StatelessWidget {
  const passwordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child : Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/illustration.png"),
          SizedBox(height: 20),
          Text("Never Forget Your Info ", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text("Securly store and automatically fill your ", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("passwords and other autofill info on apps", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("and sites. Info you store will be synced to", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("your personal account.", style: TextStyle(fontSize: 15, color: Colors.grey)),         
          SizedBox(height: 150),
          Container(
            height: 55,
            width: double.infinity,            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF0474d4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Microsoft.png", width: 25),
                SizedBox(width: 15,),
                Text("Sign In with Microsoft", style: TextStyle(fontSize: 17, color: Colors.white))
              ],
            ),
          ),
          
        ],
      ),
      ),
    ),
    //.
      appBar: AppBar(
        backgroundColor: Color(0xFF0474d4),
        title: Text(
          "Passwords", 
          style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        titleSpacing: 10,
        leading: IconButton(
          onPressed: () {}, 
            icon: Icon(Icons.menu, color: Colors.white,size: 30,),
        ),
      ),
    );
  }
}

class addressPage extends StatelessWidget {
  const addressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child : Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/illustration.png"),
          SizedBox(height: 20),
          Text("Never Forget Your Info ", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text("Securly store and automatically fill your ", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("passwords and other autofill info on apps", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("and sites. Info you store will be synced to", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("your personal account.", style: TextStyle(fontSize: 15, color: Colors.grey)),
          SizedBox(height: 150),
          Container(
            height: 55,
            width: double.infinity,            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF0474d4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Microsoft.png", width: 25),
                SizedBox(width: 15,),
                Text("Sign In with Microsoft", style: TextStyle(fontSize: 17, color: Colors.white))
              ],
            ),
          ),
          
        ],
      ),
      ),
    ),
    //.
      appBar: AppBar(
        backgroundColor: Color(0xFF0474d4),
        title: Text(
          "Addresses", 
          style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        titleSpacing: 10,
        leading: IconButton(
          onPressed: () {}, 
            icon: Icon(Icons.menu, color: Colors.white,size: 30,),
        ),
      ),
    );
  }
}

class IDPage extends StatelessWidget {
  const IDPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: SafeArea(
      child : Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/authenticator.png"),
          SizedBox(height: 20),
          Text("Accept a verified ID for more ", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          Text("control of your identity ", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),     
          SizedBox(height: 20),
          Text("Some websites and organization now ", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("offers verfied IDs. They make account", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("setup simpler and safer, while giving you", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("more visibility and control over your", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("personal data.", style: TextStyle(fontSize: 15, color: Colors.grey)),
          SizedBox(height: 20),    
          Text("A website tipically offers a Verified ID", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("through a QR code. Scan the code to get", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("started.", style: TextStyle(fontSize: 15, color: Colors.grey)),
          SizedBox(height: 20),
          SizedBox(
            height: 55,
            width: double.infinity,
            child : ElevatedButton(
              onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ScanPage(),
              ),
              ), 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0474d4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_rounded, color: Colors.white,size: 30),
                   SizedBox(width: 15),
                  Text("Scan QR Code", style: TextStyle(color: Colors.white, fontSize: 17))
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text("Learn about verified IDs", style: TextStyle(fontSize: 15, color: Color(0xFF0474d4), fontWeight: FontWeight.bold))
        ],
      ),
      ),
    ),
      appBar: AppBar(
        backgroundColor: Color(0xFF0474d4),
        title: Text(
          "Verified IDs", 
          style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        titleSpacing: 10,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ScanPage(),
              ),
            ), 
            icon: Icon(Icons.qr_code_rounded, color: Colors.white,size: 30,)),
        ],
        leading: IconButton(
          onPressed: () {}, 
            icon: Icon(Icons.menu, color: Colors.white,size: 30,),
        ),
      ),
    );
  }
}


class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 250,
                  color: Colors.black,
                  child: Image.asset("assets/images/scanner1.png", scale: 0.9)
                )
              ],
            ),
            SizedBox(height :70),
            Text("Scan a QR code to accept or request", style:TextStyle(fontSize: 17, color: Colors.white)),
            Text("a credential", style:TextStyle(fontSize: 17, color: Colors.white)),
            SizedBox(height :100),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF0474d4),
        title: Text(
          "Scan QR Code", 
          style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => const ScanPage(),
              ),
            ), 
            icon: Icon(Icons.chevron_left_rounded, color: Colors.white,size: 30,),
        ),
      ),
    );
  }
}



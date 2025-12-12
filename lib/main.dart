import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LogInPage(),
  ));
}

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('image/Payroll%20Clipart%20Login%20Screen%20Patul.png'),
          Text(
            'Discover your',
            style: TextStyle(
                fontSize: 33,
                color: Colors.orange.shade800,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Dream job here',
            style: TextStyle(
                fontSize: 33,
                color: Colors.orange.shade800,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 22),
          Text('Explore jobs around you', style: TextStyle(fontSize: 18)),
          SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 55,
                width: 170,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade800,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return AccountLoginPage();
                          }));
                    },
                    child: Text('Login',
                        style: TextStyle(color: Colors.white, fontSize: 22))),
              ),
              SizedBox(
                height: 55,
                width: 170,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return CreateAccountPage();
                          }));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AccountLoginPage extends StatefulWidget {
  const AccountLoginPage({super.key});

  @override
  State<AccountLoginPage> createState() => _AccountLoginPageState();
}

class _AccountLoginPageState extends State<AccountLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> loginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (emailController.text.isEmpty || passController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter email and password"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (savedEmail == emailController.text &&
        savedPassword == passController.text) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScandePage()),
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Incorrect email or password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Login Here',
          style: TextStyle(
            fontSize: 40,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome back!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(height: 22,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
              ),
            ),
          ),
          SizedBox(height: 22,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
              ),
            ),
          ),
          SizedBox(height: 22,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade800,
                ),
                onPressed: (){
                  loginUser();
                  },
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ),
          SizedBox(height: 22,),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateAccountPage()));
            },
            child: Text(
              'Create new account',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  Future<void> createAccount() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    if (emailController.text.isEmpty ||
        passController.text.isEmpty ||
        confirmPassController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (passController.text != confirmPassController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passController.text);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ScandePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: TextStyle(
              fontSize: 35,
              color: Colors.orange,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
              ),
            ),
          ),
          SizedBox(height: 22,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
              ),
            ),
          ),
          SizedBox(height: 22,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: TextField(
              controller: confirmPassController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
              ),
            ),
          ),
          SizedBox(height: 22,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade800,
                ),
                onPressed: (){
                  createAccount();
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class ScandePage extends StatelessWidget {
  const ScandePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33),
            color: Colors.orange.shade800,
          ),
          width: 400,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.gpp_good, size: 44, color: Colors.white),
              Text(
                'تم تسجيل الدخول',
                style: TextStyle(
                    fontSize: 29,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

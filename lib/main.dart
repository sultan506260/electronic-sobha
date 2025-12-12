import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          backgroundColor: Color(0xFF0F1020),
            title: Text('Profile',style: TextStyle(color: Colors.white),)),
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              //height: 200,
              color: Color(0xFF1E2040),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 17),
                  CircleAvatar(
                    radius: 81,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: Image.asset(
                        'image/prograemming.png',
                      ).image,
                    ),
                  ),
                  SizedBox(height: 22),
                  Text(
                    'Marwan Brieshan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  Divider(color: Colors.white,),
                  Text(
                    'flutter devlper',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  SizedBox(height: 17),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 80,
              color: Color(0xFF31366C),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email',style: TextStyle(
                      fontSize: 22,
                      color: Colors.white
                  ),),
                  Text('marwan@gmail.com ',style: TextStyle(
                    fontSize: 22,
                    color: Colors.white
                  ),)
                ],
              )

            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 80,
              color: Color(0xFF44508C),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Phone :',style: TextStyle(
              fontSize: 22,
              color: Colors.white
              ),),
                  Text('776757606',style: TextStyle(
                  fontSize: 22,
                  color: Colors.white
                  ),)
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 285,
              color: Color(0xFF5D6BA7),
              child: Column(
                children: [
                  Text('Skils :', style: TextStyle(
                      fontSize: 22,
                      color: Colors.white
                  ),),
                  Divider(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 12,),
                          Text('1- devlper ',style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),),
                          Text('2- design ',style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),),
                          Text('3- reading ',style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),),
                          Text('4- Time management ',style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),),
                          Text('5- Fhotography ',style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

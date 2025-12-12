import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Tow_page.dart';
void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Text_Fild() ,
  ));
}
class Text_Fild extends StatefulWidget {
  const Text_Fild({super.key});

  @override
  State<Text_Fild> createState() => _Text_FildState();
}

class _Text_FildState extends State<Text_Fild> {
  TextEditingController textEditingController =TextEditingController();
  TextEditingController textEditingController1=TextEditingController();
  void loge_in (){
    setState(() {
      textEditingController1.text=textEditingController.text;
    });
  }
  void navi(){
    Navigator.push(context, MaterialPageRoute(builder: (context){return Towpage( name: textEditingController.text);}));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text('text fild example'),
          ),
          body: Container(
            color: Colors.grey.shade100,
            child: Column(
              children: [
                SizedBox(height: 22,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      labelText: 'Enter the Name',
                      hintText:'Marwan' ,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0)
                    ),
                  )
      
                  ),
                ),
              SizedBox(height: 22,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: TextField(
                  readOnly: true,
                  controller: textEditingController1,
                  decoration: InputDecoration(
                    labelText: 'the name is',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0)
                    )
                  ),
                ),
              ),
                SizedBox(height: 11,),
                ElevatedButton(   style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                ), onPressed: loge_in, child: Text('Submit')),
                SizedBox(height: 11,),
                ElevatedButton( style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                ), onPressed: (){navi();}, child: Text('move on two page ')),
              ],
      
      
            ),
          ),
    );
  }
}

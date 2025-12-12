import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'display.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'file management Examples'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  File? file;
  FilePickerResult? result;

  void _readTextFile() async{
    final Directory tempDir = await getTemporaryDirectory();
    print(tempDir);

    final File file = File('${tempDir.path}/file_picker/a text file 005.txt');

    final String fileContent = await file.readAsString();

    print(fileContent);

    setState(() {

      filecontaint=fileContent.toString();

    });
  }
  void _readTextFile2(File? path) async {
    if (path == null) return;

    final String fileContent = await path.readAsString();

    setState(() {
      filecontaint = fileContent;
    });
  }

  void _saveTextFile() async {
    final dir = await getApplicationDocumentsDirectory();
    file = File('${dir.path}/${filename.text}.txt');

    await file!.writeAsString(newnote.text);

    setState(() {
      newnote.text = "";
      filename.text = "";
    });
  }



  void _incrementCounter() async{
    final Directory tempDir = await getTemporaryDirectory();
    final Directory newDirectory =
    Directory('${tempDir.path}/sample_directoryNo'+_counter.toString());
    if (await newDirectory.exists() == false) {
      await newDirectory.create();
    }

    final File file = File('${newDirectory.path}/sample_file'+_counter.toString()+'.txt');
    print(""+tempDir.toString());
    await file.writeAsString('this file writen as the try No.'+_counter.toString());


    final appDocuments = await getApplicationDocumentsDirectory();
    print(appDocuments);
    print("mazin");
    setState(() {

      _counter++;
    });
  }
  late String filecontaint="";
  TextEditingController newnote=TextEditingController();
  TextEditingController filename=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: Colors.purple.shade200
            ),
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(filecontaint),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: filename,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22)
                            ),
                            labelText: 'file Name',
                            hintText: 'Enter the a file to name to save the note to ',
                          ),
                        ),
                      ),
                    ),Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.white,
                        ),

                        child: TextField(
                          controller: newnote,
                          maxLines: 6,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22)
                            ),
                            labelText: 'Enter a note',
                            hintText: 'Enter your Note overe here',
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        _saveTextFile();
                      },
                      child: const Text('save a text',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 19,
                        ),),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (file == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("❗ لا يوجد ملف محفوظ حتى الآن")),
                          );
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DisplayPage(file: file!),
                          ),
                        );
                      },
                      child: const Text(
                        'read a text',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          result = await FilePicker.platform.pickFiles();
                          if (result != null) {
                            if (!kIsWeb) {
                              file = File(result!.files.single.path!);
                              _readTextFile2(file);
                            }
                            setState(() {});
                          } else {
                            print("user cancled the picker");
                          }
                        } catch (_) {}
                      },
                      child: const Text('Pick a Text file File',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 19,
                        ),),
                    ),
                  ]),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _readTextFile,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
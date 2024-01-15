import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'studentpage.dart';
import 'Student.dart';

class looginpage extends StatefulWidget {
  looginpage({super.key});
  State<looginpage> createState() => _StudentListState();
}


class _StudentListState extends State<looginpage> {
  bool _load = false;

  static List<Student> students = [];

  void initState() {
    super.initState();
    updateStudents();
  }

  void updateStudents() async {
    try {
      final url = Uri.https('csci410fall2023.000webhostapp.com', 'getStudents.php');
      final response = await http.get(url).timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        for (var row in jsonResponse) {
          students.add(Student(
            name: row['name'],
            url: row['url'],
          ));
        }
        setState(() {
          _load = true;
        });
      }
    } catch (e) {
      // Handle error if needed
    }
  }
  List<StudentsName> Names = List.generate(
      students.length,
          (index) => StudentsName(' ${students[index].name}', '${students[index].url}',
          '${students[index].name} Description..'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text(
          ' List Of Students  ',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
          ),
        ),
        child: ListView.builder(
            itemCount: Names.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(Names[index].name),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(Names[index].ImageUrl),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StudentsDetails (Namestudents:Names[index]))
                    );
                  },
                ),
              );
            }),
      ),

    );

  }
}
class Student {
  String name;
  double url;
  Student({
    required this.name,
    required this.url,
  });

  @override
  String toString() {
    return 'name: $name';
  }
}
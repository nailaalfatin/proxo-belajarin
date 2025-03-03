import 'package:flutter/material.dart';

class StudentsTab extends StatelessWidget {
  const StudentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage("assets/images/student1.png")),
          title: Text("Beatrisa Jasmin"),
          subtitle: Text("Siswa"),
          trailing: Icon(Icons.phone),
        ),
        ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage("assets/images/student2.png")),
          title: Text("Gabriel Kaditula"),
          subtitle: Text("Siswa"),
          trailing: Icon(Icons.phone),
        ),
      ],
    );
  }
}

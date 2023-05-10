import 'package:flutter/material.dart';

import '../model/student.dart';

class OutputView extends StatefulWidget {
  const OutputView({super.key});

  @override
  State<OutputView> createState() => _OutputViewState();
}

class _OutputViewState extends State<OutputView> {
  List<Student>? lstStudents;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    lstStudents = ModalRoute.of(context)!.settings.arguments as List<Student>?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Output View'),
        centerTitle: true,
      ),
      body: Center(
        child: lstStudents != null
            ? ListView.builder(
                itemCount: lstStudents!.length,
                itemBuilder: (context, index) {
                  var fname = lstStudents![index].fname;
                  var lname = lstStudents![index].lname;
                  return ListTile(
                    leading: const Text('SS'),
                    title: Text(fname!),
                    subtitle: Text(lname!),
                    trailing: const Icon(Icons.delete),
                  );
                },
              )
            : const Text('No students found'),
      ),
    );
  }
}

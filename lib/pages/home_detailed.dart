import 'package:flutter/material.dart';

// class ScanItemDetailed extends StatelessWidget {
//   final String name;
//   final String email;

//   ScanItemDetailed({required this.name, required this.email});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // text doesn't show up
//         title: Text('Test 2'),
//       ),
//       body: Container(
//           child: ListTile(
//         title: Text(name),
//         subtitle: Text(email),
//       )),
//     );
//   }
// }

enum PackageType { box, pack, unit, can, bottle }

/// This is the stateful widget that the main application instantiates.
class PackageTypeWidget extends StatefulWidget {
  const PackageTypeWidget({Key? key}) : super(key: key);

  @override
  State<PackageTypeWidget> createState() => _PackageTypeWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PackageTypeWidgetState extends State<PackageTypeWidget> {
  PackageType? _character = PackageType.box;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Box'),
          leading: Radio<PackageType>(
            value: PackageType.box,
            groupValue: _character,
            onChanged: (PackageType? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Pack'),
          leading: Radio<PackageType>(
            value: PackageType.pack,
            groupValue: _character,
            onChanged: (PackageType? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Single'),
          leading: Radio<PackageType>(
            value: PackageType.unit,
            groupValue: _character,
            onChanged: (PackageType? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Single'),
          leading: Radio<PackageType>(
            value: PackageType.can,
            groupValue: _character,
            onChanged: (PackageType? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Single'),
          leading: Radio<PackageType>(
            value: PackageType.bottle,
            groupValue: _character,
            onChanged: (PackageType? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
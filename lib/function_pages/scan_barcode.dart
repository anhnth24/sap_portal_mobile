// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sap_portal/function_pages/sidebar.dart';

// class ScanBarcode extends StatefulWidget {
//   const ScanBarcode({super.key});

//   @override
//   State<ScanBarcode> createState() => _ScanBarcodeState();
// }

// class _ScanBarcodeState extends State<ScanBarcode> {
//   final _canResult = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const SideBar(),
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: const Text('Canner'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You Barcode Contains the Text:',
//             ),
//             Text(
//               _canResult,
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           tooltip: 'Scan Barcode',
//           backgroundColor: Colors.purple,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(16.0))),
//           child: const Icon(
//             Icons.scanner,
//             color: Colors.white,
//           )),
//     );
//   }
// }

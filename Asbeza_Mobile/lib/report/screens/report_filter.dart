// import 'package:asbeza_mobile_app/report/models/reports_model.dart';
// import 'package:flutter/material.dart';

// //to be deleted
// void main() {
//   runApp(
//     MaterialApp(
//       home: ReportFilter(),
//     ),
//   );
// }

// class ReportFilter extends StatefulWidget {
//   @override
//   _ReportFilterState createState() => _ReportFilterState();
// }

// class _ReportFilterState extends State<ReportFilter> {
//   @override
//   Widget build(BuildContext context) {
//     //sample Input
//     var reports = <Report>[
//       Report(
//         itemName: 'Row Coffee',
//         description:
//             "Nullam sit amet diam id tortor sagittis sodales. Praesent laoreet at nisi eget ultrices. Cras id lobortis ipsum. Nullam suscipit magna in elit fermentum, quis pulvinar nisi blandit.",
//         date: DateTime.now(),
//         location: 'Addis Ababa',
//         status: "pending",
//         reporter_id: "Abebe",
//         likeCount: 34,
//       ),
//       Report(
//         itemName: 'Row Coffee',
//         description:
//             "Nullam sit amet diam id tortor sagittis sodales. Praesent laoreet at nisi eget ultrices. Cras id lobortis ipsum. Nullam suscipit magna in elit fermentum, quis pulvinar nisi blandit.",
//         date: DateTime.now(),
//         location: 'Addis Ababa',
//         status: "pending",
//         reporter_id: "Abebe",
//         likeCount: 34,
//       ),
//       Report(
//         itemName: 'Row Coffee',
//         description:
//             "Nullam sit amet diam id tortor sagittis sodales. Praesent laoreet at nisi eget ultrices. Cras id lobortis ipsum. Nullam suscipit magna in elit fermentum, quis pulvinar nisi blandit.",
//         date: DateTime.now(),
//         location: 'Addis Ababa',
//         status: "pending",
//         reporter_id: "Abebe",
//         likeCount: 34,
//       ),
//       Report(
//         itemName: 'Row Coffee',
//         description:
//             "Nullam sit amet diam id tortor sagittis sodales. Praesent laoreet at nisi eget ultrices. Cras id lobortis ipsum. Nullam suscipit magna in elit fermentum, quis pulvinar nisi blandit.",
//         date: DateTime.now(),
//         location: 'Addis Ababa',
//         status: "pending",
//         reporter_id: "Abebe",
//         likeCount: 34,
//       ),
//     ];
//     var reportList = _build_report(reports, context);

//     return Scaffold(
//       appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {},
//           ),
//           // leading: BackButton(color: Colors.white),
//           centerTitle: true,
//           title: const Text('Reports')),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//         width: double.infinity,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               _build_fiters_tab(),
//               ...reportList,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// _build_fiters_tab() {
//   return ClipRRect(
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//       child: Container(
//         width: double.infinity,
//         color: Colors.blue[100],
//         padding: EdgeInsets.all(10),
//         child:
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           const Icon(
//             Icons.filter_alt_outlined,
//           ),
//           Column(
//             children: [
//               Row(
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         print("All filter");
//                       },
//                       child: Text('All',
//                           style: TextStyle(color: Colors.blue[800]))),
//                   TextButton(
//                       onPressed: () {
//                         print("Pending filter");
//                       },
//                       child: Text('Pending',
//                           style: TextStyle(color: Colors.blue[800]))),
//                 ],
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         print("All filter");
//                       },
//                       child: Text('Accepted',
//                           style: TextStyle(color: Colors.blue[800]))),
//                   TextButton(
//                       onPressed: () {
//                         print("Pending filter");
//                       },
//                       child: Text('Declined',
//                           style: TextStyle(color: Colors.blue[800]))),
//                 ],
//               ),
//             ],
//           ),
//         ]),
//       ));
// }

// _build_report(List<Report> reports, BuildContext context) {
//   List<Widget> list = [];
//   for (var i = 0; i < reports.length; i++) {
//     var report = reports[i];
//     list.add(Container(
//       padding: EdgeInsets.only(top: 5.0),
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(width: 4.0, color: Colors.lightBlue.shade900),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 report.itemName,
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Text(report.likeCount.toString(),
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.blue[300],
//                       )),
//                   Icon(
//                     Icons.arrow_circle_up_rounded,
//                     color: Colors.blue[300],
//                     size: 14,
//                   )
//                 ],
//               )
//             ],
//           ),
//           Text(
//             report.date.toString().split(" ")[0],
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[600],
//             ),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Text(
//             report.description,
//             style: TextStyle(
//               fontSize: 14,
//             ),
//           ),
//           SizedBox(
//             height: 8.0,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Status",
//                 style: TextStyle(
//                   fontSize: 15,
//                 ),
//               ),
//               Text(
//                 report.status,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.blue[300],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 8.0,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () => showAlertDialog(context),
//                 child: Text("change Status"),
//               ),
//               IconButton(
//                   onPressed: () {
//                     print("delete Report");
//                   },
//                   icon: Icon(
//                     Icons.delete_forever,
//                     color: Colors.red,
//                   ))
//             ],
//           ),
//           SizedBox(
//             height: 10.0,
//           )
//         ],
//       ),
//     ));
//   }
//   return list;
// }

// showAlertDialog(BuildContext context) {
//   // set up the buttons
//   Widget pendingButton = TextButton(
//     child: const Text("Pending"),
//     onPressed: () {
//       print("Pending");
//       Navigator.of(context).pop(); // dismiss dialog
//     },
//   );
//   Widget acceptedButton = TextButton(
//     child: const Text("Accepted"),
//     onPressed: () {
//       print("Accepted");
//       Navigator.of(context).pop(); // dismiss dialog
//     },
//   );
//   Widget declinedButton = TextButton(
//     child: const Text("Declined"),
//     onPressed: () {
//       print("Declined");

//       Navigator.of(context).pop(); // dismiss dialog
//     },
//   );
//   Widget cancelButton = TextButton(
//     child: const Text("Cancle"),
//     onPressed: () {
//       print("cancle");
//       Navigator.of(context).pop(); // dismiss dialog
//     },
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("Change Report Status"),
//     content:
//         Text("Click one of the following to change status or cancel to abort."),
//     actions: [
//       pendingButton,
//       acceptedButton,
//       declinedButton,
//       cancelButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     barrierDismissible: false, // user must tap button for close dialog!
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../model/todo-list-data.dart';

// class TodoInput extends StatelessWidget {
//   final myController = TextEditingController();

//   addTodo(context) {
//     final value = myController.text.trim();

//     if (value != null && value.length > 0) {
//       Provider.of<TodoListData>(context, listen: false).addTodo(
//         value,
//         DateTime.now(),
//       );
//       myController.text = '';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 5.0),
//               padding: EdgeInsets.symmetric(horizontal: 20.0),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).dividerColor,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(50),
//                 ),
//               ),
//               child: TextField(
//                 onSubmitted: (newvalue) {
//                   addTodo(context);
//                 },
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: 'Add Task Here',
//                 ),
//                 textAlign: TextAlign.center,
//                 controller: myController,
//               ),
//             ),
//           ),
//           // CircleAvatar(
//           //   radius: 25,
//           //   backgroundColor: Theme.of(context).primaryColor,
//           //   child: IconButton(
//           //     onPressed: () => addTodo(context),
//           //     icon: Icon(
//           //       Icons.add,
//           //       size: 30.0,
//           //       color: Colors.white60,
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }

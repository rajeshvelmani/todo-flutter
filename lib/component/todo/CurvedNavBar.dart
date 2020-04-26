import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/todo-list-data.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key key,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = 1;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
    Provider.of<TodoListData>(context, listen: false).getTodoList(index);
  }

  @override
  Widget build(BuildContext context) {
    //   return CurvedNavigationBar(
    //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //     color: Theme.of(context).primaryColor,
    //     index: 1,
    //     items: <Widget>[
    //       getIconForNav(
    //         Icons.adjust,
    //         Colors.blueAccent,
    //       ),
    //       getIconForNav(
    //         Icons.access_time,
    //         Colors.deepOrangeAccent,
    //       ),
    //       getIconForNav(
    //         Icons.check_circle_outline,
    //         Colors.green,
    //       ),
    //     ],
    //     onTap: (index) {
    //       Provider.of<TodoListData>(context, listen: false).getTodoList(index);
    //     },
    //   );
    // }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BubbleBottomBar(
        hasNotch: false,
        // fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
          bottom: Radius.circular(50),
        ), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        backgroundColor: Theme.of(context).primaryColor,
        inkColor: Theme.of(context).accentColor,
        items: <BubbleBottomBarItem>[
          getBottomBarItem(
            getIconForNav(
              Icons.adjust,
              Colors.blueAccent,
            ),
            getIconForNav(
              Icons.check_circle,
              Colors.blueAccent,
            ),
            'All Tasks',
            Colors.blueAccent,
          ),
          getBottomBarItem(
            getIconForNav(
              Icons.access_time,
              Colors.deepOrangeAccent,
            ),
            getIconForNav(
              Icons.alarm,
              Colors.deepOrangeAccent,
            ),
            'Pending',
            Colors.deepOrangeAccent,
          ),
          getBottomBarItem(
            getIconForNav(
              Icons.check_circle_outline,
              Colors.green,
            ),
            getIconForNav(
              Icons.check_circle,
              Colors.green,
            ),
            'Completed',
            Colors.green,
          ),
        ],
      ),
    );
  }

  BubbleBottomBarItem getBottomBarItem(
    Icon icon,
    Icon activeIcon,
    String title,
    Color color,
  ) {
    return BubbleBottomBarItem(
      backgroundColor: Colors.white12,
      icon: icon,
      activeIcon: activeIcon,
      title: Text(
        title,
        style: TextStyle(color: color),
      ),
    );
  }

  Widget getIconForNav(IconData iconData, Color color) {
    return Icon(
      iconData,
      size: 30,
      color: color,
    );
  }
}

// class FABBottomAppBarItem {
//   FABBottomAppBarItem({this.iconData, this.text});
//   IconData iconData;
//   String text;
// }

// class FABBottomAppBar extends StatefulWidget {
//   FABBottomAppBar({
//     this.items,
//     this.centerItemText,
//     this.height: 60.0,
//     this.iconSize: 24.0,
//     this.backgroundColor,
//     this.color,
//     this.selectedColor,
//     this.notchedShape,
//     this.onTabSelected,
//   }) {
//     assert(this.items.length == 2 || this.items.length == 4);
//   }
//   final List<FABBottomAppBarItem> items;
//   final String centerItemText;
//   final double height;
//   final double iconSize;
//   final Color backgroundColor;
//   final Color color;
//   final Color selectedColor;
//   final NotchedShape notchedShape;
//   final ValueChanged<int> onTabSelected;

//   @override
//   State<StatefulWidget> createState() => FABBottomAppBarState();
// }

// class FABBottomAppBarState extends State<FABBottomAppBar> {
//   int _selectedIndex = 0;

//   _updateIndex(int index) {
//     widget.onTabSelected(index);
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> items = List.generate(widget.items.length, (int index) {
//       return _buildTabItem(
//         item: widget.items[index],
//         index: index,
//         onPressed: _updateIndex,
//       );
//     });
//     items.insert(items.length >> 1, _buildMiddleTabItem());

//     return BottomAppBar(
//       shape: widget.notchedShape,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: items,
//       ),
//       color: widget.backgroundColor,
//     );
//   }

//   Widget _buildMiddleTabItem() {
//     return Expanded(
//       child: SizedBox(
//         height: widget.height,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: widget.iconSize),
//             Text(
//               widget.centerItemText ?? '',
//               style: TextStyle(color: widget.color),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTabItem({
//     FABBottomAppBarItem item,
//     int index,
//     ValueChanged<int> onPressed,
//   }) {
//     Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
//     return Expanded(
//       child: SizedBox(
//         height: widget.height,
//         child: Material(
//           type: MaterialType.transparency,
//           child: InkWell(
//             onTap: () => onPressed(index),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Icon(item.iconData, color: color, size: widget.iconSize),
//                 Text(
//                   item.text,
//                   style: TextStyle(color: color),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

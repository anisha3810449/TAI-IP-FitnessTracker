
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final AppBar appBar;
  
  const MainAppBar({
    required this.appBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(onPressed: () {
        Navigator.of(context).pop();
      },
       icon: Icon(Icons.arrow_back_ios,
       color: Colors.black,
       size: 16,) ,
      ),
      title: Text('Activity',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {},
         // ignore: sort_child_properties_last
         child: Icon(
          Icons.notifications,
         size: 16,
         ),
         style:ElevatedButton.styleFrom(
          foregroundColor: Color(0xfffa7a3b), backgroundColor: Color(0xffffe6da), padding: const EdgeInsets.all(5), 
          shape: CircleBorder(),
          maximumSize: Size(30, 30),
          minimumSize: Size(30, 30)
         ),
         ),
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

}
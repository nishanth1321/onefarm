import 'package:flutter/material.dart';
import 'package:main_pro/colors.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [primarycolor, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=400"),
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                accountName: Text("Senthil"),
                accountEmail: Text("senthil@gmail.com")),
            MenuList(
              title: "order",
              iconname: Icons.border_color,
            ),
            MenuList(iconname: Icons.bookmark, title: "Address"),
            MenuList(iconname: Icons.notifications, title: "Notification"),
            MenuList(iconname: Icons.help, title: "Help"),
            MenuList(iconname: Icons.account_box, title: "About"),
            MenuList(iconname: Icons.star_half, title: "Rate Us"),
            MenuList(iconname: Icons.exit_to_app, title: "Log Out"),
          ],
        ),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  final String title;
  final IconData iconname;
  const MenuList({
    Key? key,
    required this.title,
    required this.iconname,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.white24,
        ),
        child: Icon(
          iconname,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }
}

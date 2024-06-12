import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpanda/root/theme/theme_cubit.dart';

// class DrawerWidget extends StatelessWidget {
//   const DrawerWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       // Add a ListView to the drawer. This ensures the user can scroll
//       // through the options in the drawer if there isn't enough vertical
//       // space to fit everything.
//       child: ListView(
//         // Important: Remove any padding from the ListView.
//         padding: const EdgeInsets.only(top: 60),
//         children: [
//
//           ListTile(
//             title: const Text('Item 1'),
//             onTap: () {
//               // Update the state of the app.
//               // ...
//             },
//           ),
//           ListTile(
//             title: const Text('Item 2'),
//             onTap: () {
//               // Update the state of the app.
//               // ...
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<StatefulWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  var light = true;
  int selectedIndex = 0;

  void handleScreenChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<ExampleDestination> destinations = const [
    ExampleDestination(
        'Settings', Icon(Icons.settings_outlined), Icon(Icons.settings)),
    ExampleDestination(
        'Help center', Icon(Icons.help_outline_outlined),
        Icon(Icons.help_outlined)),
    ExampleDestination(
        'More', Icon(Icons.more_horiz_outlined), Icon(Icons.more_horiz)),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: handleScreenChanged,
      selectedIndex: selectedIndex,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        ...destinations.map(
              (ExampleDestination destination) {
            return NavigationDrawerDestination(
              label: Text(destination.label),
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 70, 28, 10),
          child: Divider(),
        ),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Switch(
              // This bool value toggles the switch.
              value: state.themeMode == ThemeMode.light ? true : false,
              activeColor: Colors.red,
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                context.read<ThemeCubit>().onThemeChange(state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
              },
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 70, 28, 10),
          child: Divider(),
        ),
        const NavigationDrawerDestination(
          label: Text("Sign up or Login"),
          icon: Icon(Icons.login_outlined),
          selectedIcon: Icon(Icons.login),
        ),

      ],
    );
  }

}

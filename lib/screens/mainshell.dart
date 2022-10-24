import 'package:flutter/material.dart';
import 'package:probook_student/screens/home.dart';
import 'package:probook_student/utils/models.dart';
import 'package:probook_student/utils/user_functions.dart';
import 'package:probook_student/widgets/sidebar_button.dart';

class MainShell extends StatefulWidget {
  const MainShell({Key? key}) : super(key: key);

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  TextEditingController controller = TextEditingController();
  double index = 0;
  List<Widget> views = [
    const Home(),
  ];

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double width = 200;
    ColorScheme theme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: width,
          color: theme.surface,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/logo.png'),fit: BoxFit.cover),
                ),
              ),
              SideBarButton(
                  active: (index == 0),
                  icon: Icons.home_outlined,
                  text: 'Home Dashboard',
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  }),
              SideBarButton(
                  active: (index == 1),
                  icon: Icons.check_circle_outline,
                  text: 'Courses',
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  }),
              SideBarButton(
                  active: (index == 2),
                  icon: Icons.calendar_today_outlined,
                  text: 'Schedule',
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  }),
              SideBarButton(
                  active: (index == 3),
                  icon: Icons.people,
                  text: 'Students',
                  onTap: () {
                    setState(() {
                      index = 3;
                    });
                  }),
              SideBarButton(
                  active: (index == 4),
                  icon: Icons.newspaper,
                  text: 'School News',
                  onTap: () {
                    setState(() {
                      index = 4;
                    });
                  }),
              SideBarButton(
                  active: (index == 5),
                  icon: Icons.text_snippet,
                  text: 'HomeWorks',
                  onTap: () {
                    setState(() {
                      index = 5;
                    });
                  }),
              SideBarButton(
                  active: (index == 6),
                  icon: Icons.video_camera_front_outlined,
                  text: 'Class',
                  onTap: () {
                    setState(() {
                      index = 6;
                    });
                  }),
              SideBarButton(
                  active: (index == 7),
                  icon: Icons.short_text_outlined,
                  text: 'Tests',
                  onTap: () {
                    setState(() {
                      index = 7;
                    });
                  }),
              SideBarButton(
                  active: (index == 8),
                  icon: Icons.settings,
                  text: 'Account Settings',
                  onTap: () {
                    setState(() {
                      index = 8;
                    });
                  }),
              const SizedBox(height: 20,),
              const DarkModeSwitch(),
              const SizedBox(height: 10,)
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 200,
          child: Scaffold(
            backgroundColor: theme.background,
            appBar: AppBar(
              centerTitle: false,
              title: Container(
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: theme.onSurface),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.search_rounded),
                      border: InputBorder.none),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.message_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.warning_amber)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined),
                ),
                const NameDisplay(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.logout_outlined))
              ],
            ),
            body: const Home(),
          ),
        )
      ],
    );
  }
}

class NameDisplay extends StatelessWidget {
  const NameDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = UserActions().getCurrentUser();
    return Row(
      children: [
        Text(user.name),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(user.image), fit: BoxFit.cover)),
        )
      ],
    );
  }
}

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({Key? key}) : super(key: key);

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Dark Mode'),
          Switch(
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              })
        ],
      ),
    );
  }
}

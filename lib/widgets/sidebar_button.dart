import 'package:flutter/material.dart';

class SideBarButton extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String text;
  final Function() onTap;

  const SideBarButton(
      {Key? key,
      required this.active,
      required this.icon,
      required this.text, required this.onTap,
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 40,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color:
                      (active) ? theme.colorScheme.secondary : Colors.transparent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  icon,
                  color: (active) ? theme.colorScheme.secondary : null,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: (active) ? theme.colorScheme.secondary : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

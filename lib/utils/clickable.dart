import 'package:flutter/cupertino.dart';

class Clickable extends StatefulWidget {
  final Widget child;
  final Function onClick;

  const Clickable({super.key, required this.child, required this.onClick});

  @override
  State<StatefulWidget> createState() => ClickableState();
}

class ClickableState extends State<Clickable> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEvent details) => setState(() => isHovering = true),
      onExit: (PointerEvent details) => setState(() => isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => {widget.onClick()},
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: isHovering ? 0.6 : 1.0,
          child: widget.child,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StyledStatusBar extends StatelessWidget {
  const StyledStatusBar._({
    required this.style,
    required this.child,
    super.key,
  });

  const StyledStatusBar.light({
    required Widget child,
    Key? key,
  }) : this._(
          style: SystemUiOverlayStyle.light,
          child: child,
          key: key,
        );

  const StyledStatusBar.dark({
    required Widget child,
    Key? key,
  }) : this._(
          style: SystemUiOverlayStyle.dark,
          child: child,
          key: key,
        );

  final SystemUiOverlayStyle style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: style,
      child: child,
    );
  }
}

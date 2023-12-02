import 'package:flutter/material.dart';

class OptionsColumn extends StatelessWidget {
  const OptionsColumn({
    super.key,
    required this.title,
    required this.children,
    required this.padding,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 0,
    required this.titleFontSize,
    required this.borderColor,
  });

  final EdgeInsetsGeometry? padding;
  final List<Widget> children;
  final String title;

  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;
  final double titleFontSize;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: titleFontSize),
              ),
              const SizedBox(width: 2),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: (spacing == 0)
                ? Column(
                    crossAxisAlignment: crossAxisAlignment,
                    mainAxisSize: MainAxisSize.min,
                    children: children,
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: children.length,
                    itemBuilder: (context, i) => children[i],
                    separatorBuilder: (context, i) => SizedBox(height: spacing),
                  ),
          ),
        ),
      ],
    );
  }
}

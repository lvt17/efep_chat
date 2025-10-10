import 'package:flutter/cupertino.dart';

class GifSwitchCupertino extends StatefulWidget {
  const GifSwitchCupertino({
    super.key,
    required this.value,
    required this.onChanged,
    this.width = 81,
    this.height = 31,
    this.padding = 2,
    this.darkAsset = 'assets/dark_mode.jpeg',
    this.lightAsset = 'assets/light_mode.jpeg',
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;
  final double padding;
  final String darkAsset;
  final String lightAsset;

  @override
  State<GifSwitchCupertino> createState() => _GifSwitchCupertinoState();
}

class _GifSwitchCupertinoState extends State<GifSwitchCupertino> {
  late bool v = widget.value;

  @override
  void didUpdateWidget(covariant GifSwitchCupertino oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) v = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.width;
    final h = widget.height;
    final pad = widget.padding;
    final knob = h - pad * 2;

    return GestureDetector(
      onTap: () {
        setState(() => v = !v);
        widget.onChanged(v);
      },
      child: SizedBox(
        width: w,
        height: h,
        child: Stack(
          children: [
            // Track GIF
            ClipRRect(
              borderRadius: BorderRadius.circular(h / 2),
              child: Image.asset(
                v ? widget.darkAsset : widget.lightAsset,
                width: w,
                height: h,
                fit: BoxFit.cover,
                gaplessPlayback: true,
              ),
            ),
            // Knob
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              left: v ? w - knob - pad : pad,
              top: pad,
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Container(
                  width: knob,
                  height: knob,
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x33000000),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

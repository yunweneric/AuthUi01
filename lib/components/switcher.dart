import 'package:flutter/material.dart';
import 'package:flutter_nike_slider/model/scene.dart';
import 'package:flutter_nike_slider/utils/sizing.dart';

class Switcher extends StatefulWidget {
  final void Function(bool focus) onHover;
  final void Function(int index) onSwitch;
  final int activeIndex;
  final List<AppScene> scenes;
  const Switcher({super.key, required this.onHover, required this.activeIndex, required this.onSwitch, required this.scenes});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          onHover: (focus) {
            setState(() {
              hasFocus = focus;
            });
            widget.onHover(focus);
          },
          child: TweenAnimationBuilder(
              key: ValueKey(widget.activeIndex),
              curve: Curves.elasticOut,
              duration: const Duration(milliseconds: 1800),
              tween: Tween<Offset>(
                begin: Offset(0, Sizing.height(context) * 0.1),
                end: Offset.zero,
              ),
              builder: (context, value, child) {
                print(value.dy);
                return Transform(
                  transform: Matrix4.identity()..translate(value.dx, value.dy),
                  child: Opacity(
                    opacity: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: Sizing.width(context) * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedScale(
                            scale: hasFocus ? 1.2 : 1,
                            alignment: Alignment.centerLeft,
                            duration: Duration(milliseconds: 500),
                            child: SizedBox(
                              width: Sizing.width(context) * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.scenes[widget.activeIndex].title,
                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: Sizing.height(context) * 0.01),
                                  Text(
                                    widget.scenes[widget.activeIndex].longDesc,
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: Sizing.height(context) * 0.03),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                                ),
                                onHover: (focus) {
                                  // setState(() {
                                  //   hasFocus = focus;
                                  // });
                                  // widget.onHover(focus);
                                },
                                onPressed: () {},
                                icon: const Icon(Icons.play_arrow_rounded),
                                label: const Text("Watch Trailer"),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                widget.scenes[widget.activeIndex].duration,
                                style: Theme.of(context).textTheme.displayMedium,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        SizedBox(height: Sizing.height(context) * 0.2),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: Sizing.width(context) * 0.55,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            color: Theme.of(context).primaryColorDark,
            child: Row(
              children: widget.scenes.map((scene) => switchItem(scene)).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget switchItem(AppScene scene) {
    bool isFocus = false;
    return SizedBox(
      // width: Sizing.width(context) * 0.2,
      child: StatefulBuilder(builder: (context, setState) {
        Color textColor = isFocus || widget.activeIndex == scene.index ? Theme.of(context).primaryColorLight : Theme.of(context).primaryColorLight.withOpacity(0.2);
        return InkWell(
          onTap: () {
            widget.onSwitch(scene.index);
          },
          onHover: (focus) {
            setState(() {
              isFocus = focus;
            });
          },
          child: Row(
            children: [
              AnimatedScale(
                duration: const Duration(milliseconds: 400),
                scale: isFocus ? 1 : 0.95,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        "0${scene.index + 1}",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            scene.title,
                            style: Theme.of(context).textTheme.displayMedium!.copyWith(color: textColor),
                          ),
                          Text(
                            scene.desc,
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              if (scene.index != 2)
                Container(
                  color: Theme.of(context).primaryColorLight.withOpacity(0.2),
                  width: 2,
                  height: 40,
                )
            ],
          ),
        );
      }),
    );
  }
}

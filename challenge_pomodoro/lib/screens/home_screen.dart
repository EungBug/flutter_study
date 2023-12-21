import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<int> times = [15, 20, 25, 30, 35, 40, 45, 50, 55];
  int selectedTime = 25;
  bool isRunning = false;
  int roundCount = 0;
  int goalCount = 0;
  late int totalSeconds = selectedTime * 60;

  late Timer timer;

  void onChangeTime(int time) {
    if (isRunning) {
      timer.cancel();
    }
    setState(() {
      isRunning = false;
      selectedTime = time;
      totalSeconds = time == 15 ? 3 : time * 60;
    });
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        roundCount += 1;
        if (roundCount == 4) {
          roundCount = 0;
          goalCount += 1;
        }
        if (goalCount == 12) {
          goalCount = 0;
        }

        totalSeconds = selectedTime == 15 ? 3 : selectedTime * 60;
        isRunning = false;
        timer.cancel();
      });
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onStopPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds, bool isMinute) {
    var duration = Duration(seconds: seconds);
    var min = duration.toString().split('.').first.substring(2, 4);
    var sec = duration.toString().split('.').first.substring(5, 7);
    return isMinute ? min : sec;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'POMOTIMER',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TimeText(
                      time: format(totalSeconds, true),
                    ),
                    const Text(
                      ' : ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                    TimeText(
                      time: format(totalSeconds, false),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var time in times)
                        TimeBox(
                          time: '$time',
                          isSelected: time == selectedTime,
                          onChangeTime: () => onChangeTime(time),
                        )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Center(
                    child: IconButton(
                  icon: Icon(
                    isRunning
                        ? Icons.pause_circle_filled_rounded
                        : Icons.play_circle_fill_outlined,
                    color: Colors.white,
                  ),
                  iconSize: 100,
                  onPressed: isRunning ? onStopPressed : onStartPressed,
                )),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountBox(
                      count: roundCount,
                      total: 4,
                      title: 'ROUND',
                    ),
                    CountBox(
                      count: goalCount,
                      total: 12,
                      title: 'GOAL',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeText extends StatelessWidget {
  final String time;
  const TimeText({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 80,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TimeBox extends StatelessWidget {
  final String time;
  final bool isSelected;
  final Function onChangeTime;

  const TimeBox({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onChangeTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: isSelected ? Colors.white : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            side: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () => onChangeTime(),
        child: Text(
          time,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

class CountBox extends StatelessWidget {
  final int count;
  final int total;
  final String title;

  const CountBox({
    super.key,
    required this.count,
    required this.total,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$count/$total',
            style: TextStyle(
              color: Theme.of(context).textTheme.displaySmall!.color,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

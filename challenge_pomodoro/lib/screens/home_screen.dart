import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<int> times = [15, 20, 25, 30, 35, 40, 45, 50, 55, 60];
  int selectedTime = 25;
  bool isRunning = false;
  int roundCount = 0;
  int goalCount = 0;

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
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '12',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 100,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Text(
                      ' : ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '12',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 100,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                  onPressed: () {},
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

class TimeBox extends StatelessWidget {
  final String time;
  final bool isSelected;

  const TimeBox({
    super.key,
    required this.time,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.only(right: 10),
      width: 70,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        time,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          fontSize: 22,
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

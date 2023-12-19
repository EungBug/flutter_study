import 'package:flutter/material.dart';
import 'package:flutter_challenges_1/widget/plan.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1F1F1F),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        'assets/profile.jpg',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    const Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'MONDAY 16',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const DateScrollView(),
              const SizedBox(
                height: 40,
              ),
              Plan(
                startHour: '11',
                startMinute: '30',
                endHour: '12',
                endMinute: '20',
                title: 'DESIGN MEETING',
                attendess: const ['ALEX', 'HELENA', 'NANA'],
                bgColor: Colors.yellow.shade500,
              ),
              const Plan(
                startHour: '12',
                startMinute: '35',
                endHour: '14',
                endMinute: '10',
                title: 'DAILY PROJECT',
                attendess: [
                  'ME',
                  'RICHARD',
                  'CIRY',
                  'RORA',
                  'MINI',
                  'NANA',
                  'RUKA'
                ],
                bgColor: Color.fromARGB(255, 196, 140, 255),
              ),
              const Plan(
                startHour: '15',
                startMinute: '00',
                endHour: '16',
                endMinute: '30',
                title: 'WEEKLY PLANNING',
                attendess: ['DEN', 'NANA', 'MARK'],
                bgColor: Color.fromARGB(255, 178, 238, 49),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DateScrollView extends StatelessWidget {
  const DateScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'TODAY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.pink.shade600,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const DayText(
                  day: '17',
                ),
                const DayText(
                  day: '18',
                ),
                const DayText(
                  day: '19',
                ),
                const DayText(
                  day: '20',
                ),
                const DayText(
                  day: '21',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DayText extends StatelessWidget {
  final String day;
  const DayText({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        day,
        style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 50,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

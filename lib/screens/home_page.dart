import 'package:flutter/material.dart';
import 'package:tasks/screens/calendar_page.dart';
import 'package:tasks/theme/colors/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tasks/widgets/task_column.dart';
import 'package:tasks/widgets/active_project_card.dart';
import 'package:tasks/widgets/top_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  Text subheading(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: LightColors.kDarkBlue,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }

  static CircleAvatar calendarIcon() {
    return const CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            TopContainer(
              height: 220,
              width: width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.menu,
                          color: LightColors.kDarkBlue, size: 25.0),
                      Icon(Icons.search,
                          color: LightColors.kDarkBlue, size: 20.0),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircularPercentIndicator(
                          radius: 80.0,
                          lineWidth: 5.0,
                          animation: true,
                          percent: 0.75,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: LightColors.kRed,
                          backgroundColor: LightColors.kDarkYellow,
                          center: const CircleAvatar(
                            backgroundColor: LightColors.kBlue,
                            radius: 30.0,
                            backgroundImage: AssetImage(
                              'assets/images/avatar.png',
                            ),
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Lynx',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 10,
                                color: LightColors.kDarkBlue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'SE',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black45,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CalendarPage(),
                              ),
                            );
                          },
                          child: calendarIcon(),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  const TaskColumn(
                    icon: Icons.alarm,
                    iconBackgroundColor: LightColors.kRed,
                    title: 'ToDo',
                    subtitle: 'To Do',
                  ),
                  const SizedBox(height: 20),
                  const TaskColumn(
                    icon: Icons.blur_circular,
                    iconBackgroundColor: LightColors.kDarkYellow,
                    title: 'Progress',
                    subtitle: 'Doing',
                  ),
                  const SizedBox(height: 10.0),
                  const TaskColumn(
                    icon: Icons.check_circle_outline,
                    iconBackgroundColor: LightColors.kBlue,
                    title: 'Done',
                    subtitle: 'Done',
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  subheading('Act'),
                  const SizedBox(height: 5.0),
                  Row(
                    children: <Widget>[
                      ActiveProjectsCard(
                        cardColor: LightColors.kGreen,
                        loadingPercent: 0.25,
                        title: 'App',
                        subtitle: 'prog',
                      ),
                      SizedBox(width: 15.0),
                      ActiveProjectsCard(
                        cardColor: LightColors.kRed,
                        loadingPercent: 0.6,
                        title: 'Notes',
                        subtitle: '20s',
                      ),
                    ],
                  ),
                  const Row(
                    children: <Widget>[
                      ActiveProjectsCard(
                        cardColor: LightColors.kDarkYellow,
                        loadingPercent: 0.45,
                        title: 'Spo',
                        subtitle: '5h',
                      ),
                      SizedBox(width: 15.0),
                      ActiveProjectsCard(
                        cardColor: LightColors.kBlue,
                        loadingPercent: 0.9,
                        title: 'Flu',
                        subtitle: 'ress',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

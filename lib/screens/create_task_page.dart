import 'package:flutter/material.dart';
import 'package:tasks/theme/colors/light_colors.dart';
import 'package:tasks/widgets/top_container.dart';
import 'package:tasks/widgets/back_button.dart';
import 'package:tasks/widgets/my_text_field.dart';
import 'package:tasks/screens/home_page.dart';

class CreateNewTaskPage extends StatelessWidget {
  const CreateNewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = const Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              height: 30,
              child: Column(
                children: <Widget>[
                  const MyBackButton(),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Create new task',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyTextField(
                        label: 'Title',
                        icon: downwardIcon,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: MyTextField(
                              label: 'Date',
                              icon: downwardIcon,
                            ),
                          ),
                          HomePage.calendarIcon(),
                        ],
                      )
                    ],
                  )),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    MyTextField(
                      label: 'Start Time',
                      icon: downwardIcon,
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      label: 'End Time',
                      icon: downwardIcon,
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      label: 'Description',
                      minLines: 3,
                      maxLines: 3,
                      icon: downwardIcon,
                    ),
                    const SizedBox(height: 20),
                    _categoryWidget(width)
                  ],
                ),
              ),
            ),
            _createTaskButton(width)
          ],
        ),
      ),
    );
  }

  Widget _categoryWidget(double width) {
    return Container(
      alignment: Alignment.topLeft,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Category',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            runSpacing: 0,
            spacing: 10.0,
            children: <Widget>[
              Chip(
                label: Text("SPORT APP"),
                backgroundColor: LightColors.kRed,
                labelStyle: TextStyle(color: Colors.white),
              ),
              Chip(
                label: Text("MEDICAL APP"),
              ),
              Chip(
                label: Text("RENT APP"),
              ),
              Chip(
                label: Text("NOTES"),
              ),
              Chip(
                label: Text("GAMING PLATFORM APP"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createTaskButton(double width) {
    return SizedBox(
      height: 80,
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              width: width - 40,
              decoration: BoxDecoration(
                color: LightColors.kBlue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Create Task',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

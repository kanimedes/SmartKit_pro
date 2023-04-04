import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditprofileNotification extends StatefulWidget {
  const EditprofileNotification({Key? key}) : super(key: key);

  @override
  State<EditprofileNotification> createState() =>
      _EditprofileNotificationState();
}

class _EditprofileNotificationState extends State<EditprofileNotification> {
  bool Notifaction = false;
  bool Sound = false;
  bool Vibrate = false;
  bool Updates = false;
  bool newserviceAvailable = false;
  bool newstipsavailable = false;

  Widget _buildlisttle({required String title, required bool valuename}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      trailing: CupertinoSwitch(
          value: valuename,
          onChanged: (val) {
            valuename = !val;
            setState(() {});
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      "Notifaction",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                _buildlisttle(
                    title: "General Notifaction", valuename: Notifaction),
                _buildlisttle(title: "Sound", valuename: Sound),
                _buildlisttle(title: "Vibrate", valuename: Vibrate),
                _buildlisttle(title: "App Updates", valuename: Updates),
                _buildlisttle(
                    title: "new  service Available",
                    valuename: newserviceAvailable),
                _buildlisttle(
                    title: "news tips available", valuename: newstipsavailable),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

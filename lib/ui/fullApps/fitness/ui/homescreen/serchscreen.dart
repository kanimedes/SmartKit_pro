import 'package:flutter/material.dart';

class SerchScreen extends StatefulWidget {
  const SerchScreen({Key? key}) : super(key: key);

  @override
  State<SerchScreen> createState() => _SerchScreenState();
}

class _SerchScreenState extends State<SerchScreen> {
  int selectindex = 1;
  Widget _buildappbar() {
    return TextField(
      //textAlign: TextAlign.center,
      style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          fillColor: Theme.of(context).primaryColor.withOpacity(0.01),
          filled: true,
          hintText: "Serch",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: TextStyle(
              color: Theme.of(context).canvasColor,
              fontWeight: FontWeight.bold),
          prefixIcon: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.zoom_in,
                color: Theme.of(context).primaryColor,
              ))),
    );
  }

  Widget _buildbuttonlevel(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          selectindex = index;
          setState(() {});
        },
        child: Container(
          height: 40,
          width: 80,
          alignment: Alignment.center,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(20),
              color: selectindex == index
                  ? Theme.of(context).primaryColor
                  : Colors.transparent),
          child: Text(
            title,
            style: TextStyle(
              color: selectindex == index
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildrowbutton() {
    return Row(
      children: [
        _buildbuttonlevel("Beginner", 1),
        _buildbuttonlevel("InterMediate", 2),
        _buildbuttonlevel("Advanced", 3),
      ],
    );
  }

  Widget _buildrecent(String title) {
    return ListTile(
      title: Text(title),
      contentPadding: EdgeInsets.all(0),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.close),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                _buildappbar(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                buildrowbutton(),
                Divider(color: Colors.black38),
                Text(
                  "Recent",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildrecent("Abdominal"),
                _buildrecent("Full Body"),
                _buildrecent("Yoga Exercise"),
                _buildrecent("Aquat Movement"),
                _buildrecent("Dumbbell"),
                _buildrecent("leg Exercise"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? strs;
void getletter(String str) {
  var sl = str.split(" ").length;
  // print("lenth--/--" + sl.toString());
  if (sl == 2) {
    String fl = str.split(" ").elementAt(0);
    String sl = str.split(" ").elementAt(1);
    var l = fl[0] + sl[0];
    strs = l.toUpperCase();
    // print("flsl--/--" + strs);
  } else if (sl == 3) {
    String fl = str.split(" ").elementAt(0);
    String sl = str.split(" ").elementAt(1);
    // String tl = str.split(" ").elementAt(2);

    var l = fl[0] + sl[0];
    //  + tl[0];
    strs = l.toUpperCase();
  } else {
    String fl = str.split(" ").elementAt(0);
    var l = fl[0];
    strs = l.toUpperCase();
    // print("flsl--/--" + strs);
  }
}

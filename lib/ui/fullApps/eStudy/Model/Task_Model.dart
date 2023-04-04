class Task_Model {
  String? id;
  String? image;
  String? taskName;
  String? lessonsName;
  String? lessonsDate;
  String? taskStatus;
  String? blurUrl;
  String? localimg;

  Task_Model(
      {this.id,
      this.image,
      this.taskName,
      this.lessonsName,
      this.lessonsDate,
      this.taskStatus,
      this.blurUrl,
      this.localimg});
}

List<Task_Model> TaskList = [
  Task_Model(
    id: "1",
    localimg: "assets/images/fullApps/eStudy/tesk_doc.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Ftesk_doc.jpg?alt=media&token=bf467ae0-a4dd-449d-b53b-51d94f4e3307",
    blurUrl: "LUNwWqof~moft2WDkDt4%KWBWFof",
    taskName: "Homework - 07",
    lessonsName: "Economics",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Pending",
  ),
  Task_Model(
    id: "2",
    localimg: "assets/images/fullApps/eStudy/tesk_doc.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Ftesk_doc.jpg?alt=media&token=bf467ae0-a4dd-449d-b53b-51d94f4e3307",
    blurUrl: "LUNwWqof~moft2WDkDt4%KWBWFof",
    taskName: "Homework - 06",
    lessonsName: "Business Studies",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Pending",
  ),
  Task_Model(
    id: "3",
    localimg: "assets/images/fullApps/eStudy/tesk_txt.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Ftesk_txt.jpg?alt=media&token=9a84957b-a382-4d74-9310-ae7aeb85f8fc",
    blurUrl: "LUNwWqof~mofs+WDkDt3%KWBWFof",
    taskName: "Homework - 05",
    lessonsName: "Accountancy",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Finished",
  ),
  Task_Model(
    id: "4",
    localimg: "assets/images/fullApps/eStudy/tesk_doc.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Ftesk_doc.jpg?alt=media&token=bf467ae0-a4dd-449d-b53b-51d94f4e3307",
    blurUrl: "LUNwWqof~moft2WDkDt4%KWBWFof",
    taskName: "Homework - 04",
    lessonsName: "Economics - 1",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Finished",
  ),
  Task_Model(
    id: "5",
    localimg: "assets/images/fullApps/eStudy/tesk_pdf.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Ftesk_pdf.jpg?alt=media&token=ce46f65f-5934-4a14-9105-d02c40aa77ab",
    blurUrl: "LUNwWqt6~moft2WDogt3%KWBWFoe",
    taskName: "Homework - 03",
    lessonsName: "Mathematicas",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Finished",
  ),
  Task_Model(
    id: "6",
    localimg: "assets/images/fullApps/eStudy/tesk_pdf.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Ftesk_pdf.jpg?alt=media&token=ce46f65f-5934-4a14-9105-d02c40aa77ab",
    blurUrl: "LUNwWqt6~moft2WDogt3%KWBWFoe",
    taskName: "Homework - 02",
    lessonsName: "English",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Finished",
  ),
  Task_Model(
    id: "7",
    localimg: "assets/images/fullApps/eStudy/tesk_pdf.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Ftesk_pdf.jpg?alt=media&token=ce46f65f-5934-4a14-9105-d02c40aa77ab",
    blurUrl: "LUNwWqt6~moft2WDogt3%KWBWFoe",
    taskName: "Homework - 07",
    lessonsName: "Chemistry",
    lessonsDate: "Mar 02, 2021",
    taskStatus: "Finished",
  ),
];

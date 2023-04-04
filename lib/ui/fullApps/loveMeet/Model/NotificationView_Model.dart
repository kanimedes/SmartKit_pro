// ignore_for_file: camel_case_types

class NotificationView_Model {
  String? id;
  String? name;
  String? subTitle;
  String? time;
  String? profile;
  String? imgurl;
  String? hash;

  NotificationView_Model(
      {this.id,
      this.name,
      this.subTitle,
      this.time,
      this.profile,
      this.imgurl,
      this.hash});
}

List<NotificationView_Model> notificationViewList = [
  NotificationView_Model(
      id: "1",
      name: "Carmen Myers",
      subTitle: "Like your photo",
      time: "5:45 PM",
      profile: "assets/images/fullApps/loveMeet/profile_d.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_d.jpg?alt=media&token=a7ec8770-fe49-4587-83d1-2241efe6cf1f",
      hash: "LMO:a,~UIVIB-=9Gx[WB4oM{IV%L"),
  NotificationView_Model(
      id: "2",
      name: "Enrique Perkins",
      subTitle: "Like your photo",
      time: "11:12 AM",
      profile: "assets/images/fullApps/loveMeet/profile_j.jpg",
      hash: "L8HKOv_M00Dj9vXl\$+rD0MI[=}Zh",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_j.jpg?alt=media&token=544886db-b223-4410-8be4-a42d861f7665"),
  NotificationView_Model(
      id: "3",
      name: "Glen Ryan",
      subTitle: "Like your photo",
      time: "Today",
      profile: "assets/images/fullApps/loveMeet/profile_b.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_b.jpg?alt=media&token=7fac07a8-6540-4f27-b902-3d4efaff2d08",
      hash: "L9J@@0Kk4T\$l00009~=v~K?G9d?u"),
  NotificationView_Model(
      id: "4",
      name: "Christina Pearson",
      subTitle: "Like your photo",
      time: "Yesterday",
      profile: "assets/images/fullApps/loveMeet/profile_c.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_c.jpg?alt=media&token=4a068906-6b98-4681-b38f-a6fa4c638099",
      hash: "LNEWakI9OEM{GdV?b_t7TLtRxuW="),
];

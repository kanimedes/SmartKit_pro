import '../../helper/doctore_DesignConfig.dart';

class CommonModel {
  String? image;
  String? title;
  String? reviewText;
  String? subTitle;
  bool? like;
  CommonModel(
      {this.subTitle, this.title, this.image, this.like, this.reviewText});
}

List<CommonModel> allList = [
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Cardio Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_a.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Eye Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_b.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Brain Specialist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_c.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Dentist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_d.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Cardio Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),
      like: false,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Brain Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_f.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Eye Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_g.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Dentist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_h.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Cardio Specialist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_i.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Eye Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_j.jpg"),
      like: true,
      reviewText: "4.8(3521 reviews)"),
];
List<CommonModel> brainList = [
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Brain Specialist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_k.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Brain Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_l.jpg"),
      like: false,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Brain Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_m.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Brain Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_n.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Brain Specialist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_o.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Brain Specialist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_p.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Brain Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),
      like: true,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Brain Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_r.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Brain Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_s.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Brain Specialist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_t.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
];
List<CommonModel> cardioList = [
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Cardio Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_t.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Cardio Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_s.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Cardio-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_r.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Cardio Specialist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Cardio Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_p.jpg"),
      like: true,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Cardio Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_o.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Cardio Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_n.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Cardio Specialist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_m.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Cardio-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_l.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Cardio Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_k.jpg"),
      like: false,
      reviewText: "4.8(3521 reviews)"),
];
List<CommonModel> eyeList = [
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Eye Specialist -Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_j.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Eye Specialist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_i.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Eye Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_h.jpg"),
      like: true,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Eye Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_g.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Eye Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_f.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Eye Specialist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Eye Specialist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_d.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Eye Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_c.jpg"),
      like: false,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Eye Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_b.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Eye Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_a.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
];
List<CommonModel> dentistList = [
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Dentist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_i.jpg"),
      like: true,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Dentist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_j.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Dentist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_k.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Dentist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_l.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Dentist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_m.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Dentist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_n.jpg"),
      like: false,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Dentist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_o.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Dentist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_p.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Dentist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Dentist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_r.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
];
List<CommonModel> mouthList = [
  CommonModel(
      title: "Dr. Dianne Russell ",
      subTitle: "Mouth Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_a.jpg"),
      like: true,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Mouth Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_b.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Mouth Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_j.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Mouth Specialist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_d.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Mouth Specialist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Mouth Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_f.jpg"),
      like: false,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Mouth Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_g.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Mouth Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_h.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Mouth Specialist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_i.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Mouth Specialist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_j.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
];
List<CommonModel> childList = [
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Child Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_f.jpg"),
      like: false,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Child Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_g.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Child Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_h.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Child Specialist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_i.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Child Specialist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_j.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell ",
      subTitle: "Child Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_a.jpg"),
      like: true,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Child Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_b.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Child Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_j.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Child Specialist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_d.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Child Specialist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
];
List<CommonModel> nerveList = [
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Never Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_t.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Never Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_s.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Never-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_r.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Never Specialist-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Never Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_p.jpg"),
      like: true,
      reviewText: "4.8(3521 reviews)"),
  CommonModel(
      title: "Dr. Ronald Richards",
      subTitle: "Never Specialist-Nanyang Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_o.jpg"),
      like: true,
      reviewText: "4.9(3841 reviews)"),
  CommonModel(
      title: "Dr. Eleanor Pena",
      subTitle: "Never Specialist-Bracket Medical",
      image: DoctorDesignConfig.getImageDoctor("doctor_n.jpg"),
      like: false,
      reviewText: "4.8(3400 reviews)"),
  CommonModel(
      title: "Dr. Ralph Edwards",
      subTitle: "Never Specialist-Smithly Landon",
      image: DoctorDesignConfig.getImageDoctor("doctor_m.jpg"),
      like: true,
      reviewText: "4.9(3821 reviews)"),
  CommonModel(
      title: "Dr. Dianne Russell",
      subTitle: "Never-Ramsay Collage",
      image: DoctorDesignConfig.getImageDoctor("doctor_l.jpg"),
      like: true,
      reviewText: "4.8(3321 reviews)"),
  CommonModel(
      title: "Dr. Albert Flores",
      subTitle: "Never Specialist-Bracket Hospital",
      image: DoctorDesignConfig.getImageDoctor("doctor_k.jpg"),
      like: false,
      reviewText: "4.8(3521 reviews)"),
];
/*List<CommonModel> favList=[
  CommonModel(title:"Dr. Ronald Richards",subTitle:"Cardio Specialist-Nanyang Hospital",image:DoctorDesignConfig.getImageDoctor("doctor_a.jpg"),like: true,reviewText:"4.9(3841 reviews)"),
  CommonModel(title:"Dr. Eleanor Pena",subTitle:"Cardio Specialist-Bracket Medical",image:DoctorDesignConfig.getImageDoctor("doctor_c.jpg"),like: false,reviewText:"4.8(3400 reviews)"),
  CommonModel(title:"Dr. Ralph Edwards",subTitle:"Cardio Specialist-Smithly Landon",image:DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),like: true,reviewText:"4.9(3821 reviews)"),
  CommonModel(title:"Dr. Dianne Russell",subTitle:"Cardio Specialist-Ramsay Collage",image:DoctorDesignConfig.getImageDoctor("doctor_f.jpg"),like: true,reviewText:"4.8(3321 reviews)"),
  CommonModel(title:"Dr. Albert Flores",subTitle:"Cardio Specialist-Bracket Hospital",image:DoctorDesignConfig.getImageDoctor("doctor_h.jpg"),like: false,reviewText:"4.8(3521 reviews)"),

  CommonModel(title:"Dr. Ronald Richards",subTitle:"Cardio Specialist-Nanyang Hospital",image:DoctorDesignConfig.getImageDoctor("doctor_i.jpg"),like: true,reviewText:"4.9(3841 reviews)"),
  CommonModel(title:"Dr. Eleanor Pena",subTitle:"Cardio Specialist-Bracket Medical",image:DoctorDesignConfig.getImageDoctor("doctor_k.jpg"),like: false,reviewText:"4.8(3400 reviews)"),
  CommonModel(title:"Dr. Ralph Edwards",subTitle:"Cardio Specialist-Smithly Landon",image:DoctorDesignConfig.getImageDoctor("doctor_m.jpg"),like: true,reviewText:"4.9(3821 reviews)"),
  CommonModel(title:"Dr. Dianne Russell",subTitle:"Cardio Specialist-Ramsay Collage",image:DoctorDesignConfig.getImageDoctor("doctor_o.jpg"),like: true,reviewText:"4.8(3321 reviews)"),
  CommonModel(title:"Dr. Albert Flores",subTitle:"Cardio Specialist-Bracket Hospital",image:DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),like: true,reviewText:"4.8(3521 reviews)"),

];*/
List<CommonModel> searchResult = [];
List<CommonModel> data = [];

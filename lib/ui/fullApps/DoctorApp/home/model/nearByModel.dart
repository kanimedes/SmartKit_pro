import '../../helper/doctore_DesignConfig.dart';

class NearByModel {
  String? image, doctorName, specialist, count;
  double? noOfStar;
  NearByModel(
      {this.specialist,
      this.image,
      this.doctorName,
      this.count,
      this.noOfStar});
}

List<NearByModel> nearbyList = [
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),
      doctorName: "Dr. Eleanor Pena",
      specialist: "Child Specialist",
      count: "230",
      noOfStar: 5),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_p.jpg"),
      doctorName: "Dr. Ronald Richards",
      specialist: "Eye Specialist",
      count: "40",
      noOfStar: 4),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_g.jpg"),
      doctorName: "Dr. Dianne Russella",
      specialist: "Dentist",
      count: "100",
      noOfStar: 3),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),
      doctorName: "Dr. Ralph Edwards",
      specialist: "Brain Specialist",
      count: "150",
      noOfStar: 4),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_r.jpg"),
      doctorName: "Dr. Albert Flores",
      specialist: "Mouth Specialist",
      count: "220",
      noOfStar: 5),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_s.jpg"),
      doctorName: "Dr. Ronald Richards",
      specialist: "Never Specialist",
      count: "350",
      noOfStar: 5),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_k.jpg"),
      doctorName: "Dr. Eleanor Pena",
      specialist: "Child Specialist",
      count: "500",
      noOfStar: 4),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_l.jpg"),
      doctorName: "Dr. Ralph Edwards",
      specialist: "Eye Specialist",
      count: "120",
      noOfStar: 3),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_m.jpg"),
      doctorName: "Dr. Dianne Russell",
      specialist: "Brain Specialist",
      count: "168",
      noOfStar: 5),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_n.jpg"),
      doctorName: "Dr.Amit Shah",
      specialist: "Mouth Specialist",
      count: "350",
      noOfStar: 4),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_o.jpg"),
      doctorName: "Dr. Jyoti Parmar",
      specialist: "Never Specialist",
      count: "180",
      noOfStar: 5),
];
List<NearByModel> nearbyListHome = [
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),
      doctorName: "Dr. Eleanor Pena",
      specialist: "Child Specialist",
      count: "230",
      noOfStar: 5),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_p.jpg"),
      doctorName: "Dr. Ronald Richards",
      specialist: "Eye Specialist",
      count: "40",
      noOfStar: 4),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_g.jpg"),
      doctorName: "Dr. Dianne Russella",
      specialist: "Dentist",
      count: "100",
      noOfStar: 3),
  NearByModel(
      image: DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),
      doctorName: "Dr. Ralph Edwards",
      specialist: "Brain Specialist",
      count: "150",
      noOfStar: 4),
];

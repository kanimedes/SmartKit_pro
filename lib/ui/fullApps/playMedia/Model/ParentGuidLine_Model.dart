class ParentGuidLine_Model{
  String? id;
  String? name;
  String? status;

  ParentGuidLine_Model({this.id, this.name, this.status});

}

List<ParentGuidLine_Model> parentGuidLineList = [
  ParentGuidLine_Model(
    id: "1",
    name: "Restricted",
    status: "1",
  ),
  ParentGuidLine_Model(
    id: "2",
    name: "General Audiences",
    status: "0",
  ),
  ParentGuidLine_Model(
    id: "3",
    name: "Family comedy",
    status: "1",
  ),
  ParentGuidLine_Model(
    id: "4",
    name: "Violence and gore: Mild",
    status: "0",
  ),
  ParentGuidLine_Model(
    id: "5",
    name: "Alcohol, drugs and smoking: Mild",
    status: "0",
  ),
  ParentGuidLine_Model(
    id: "6",
    name: "Frightening and intense scenes: Mild",
    status: "0",
  )
];
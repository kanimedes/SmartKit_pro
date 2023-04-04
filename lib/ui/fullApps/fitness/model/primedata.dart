class primedata {
  final String id;
  final String month;
  final String amount;
  primedata({
    required this.id,
    required this.month,
    required this.amount,
  });
}

List<primedata> primelist = [
  primedata(
    id: "0",
    month: "1 month",
    amount: "16.99",
  ),
  primedata(
    id: "1",
    month: "6 month",
    amount: "66.99",
  ),
  primedata(
    id: "2",
    month: "12 month",
    amount: "116.99",
  ),
];

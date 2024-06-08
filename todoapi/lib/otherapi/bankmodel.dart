class Bankmodel{
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bankmodel({
    required this.cardExpire, required this.cardNumber, required this.cardType,
    required this.currency, required this.iban});

  factory Bankmodel.fromJson(Map<String,dynamic> api){
    return Bankmodel(
        cardExpire: api['cardExpire'],
        cardNumber: api['cardNumber'],
        cardType: api['cardType'],
        currency: api['currency'],
        iban: api['iban']);
  }

}
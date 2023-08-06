class ToJsonOrderId {
  final String token;
  final String amount;
  final String currency;
  final List<dynamic> items;

  ToJsonOrderId({
    required this.token,
    required this.amount,
    required this.currency,
    required this.items,
});

  Map<String,dynamic>toJson(){
    return {
      'auth_token':token,
      'delivery_needed':'false',
      'amount_cents':amount,
      'currency':currency,
      'items':items,
    };
  }
}
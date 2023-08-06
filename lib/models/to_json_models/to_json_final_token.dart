class ToJsonFinalToken {
  final String token;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String amount;
  final String orderId;
  final String currency;
  final int integrationId;

  ToJsonFinalToken({
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.amount,
    required this.orderId,
    required this.currency,
    required this.integrationId,
  });

  Map<String, dynamic> toJson() {
    return {
      "auth_token": token,
      "amount_cents": amount,
      "expiration": 50000000,
      "order_id": orderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": currency,
      "integration_id": integrationId,
      "lock_order_when_paid": "false"
    };
  }
}

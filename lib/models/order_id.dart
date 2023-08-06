class OrderIdModel {
  final int id;
  final DateTime createdAt;
  final bool deliveryNeeded;
 final Merchant merchant;
  final dynamic collector;
  final int amountCents;
  final dynamic shippingData;
  final String currency;
  final bool isPaymentLocked;
  final bool isReturn;
  final bool isCancel;
  final bool isReturned;
  final bool isCanceled;
  final dynamic merchantOrderId;
  final dynamic walletNotification;
  final int paidAmountCents;
  final bool notifyUserWithEmail;
 final List< dynamic> items;
  final String orderUrl;
  final int commissionFees;
  final int deliveryFeesCents;
  final int deliveryVatCents;
  final String paymentMethod;
  final dynamic merchantStaffTag;
  final String apiSource;
final  Data data;
  final String token;
  final String url;

  OrderIdModel({
    required this.id,
    required this.createdAt,
    required this.deliveryNeeded,
    required this.merchant,
    this.collector,
    required this.amountCents,
    this.shippingData,
    required this.currency,
    required this.isPaymentLocked,
    required this.isReturn,
    required this.isCancel,
    required this.isReturned,
    required this.isCanceled,
    this.merchantOrderId,
    this.walletNotification,
    required this.paidAmountCents,
    required this.notifyUserWithEmail,
    required this.items,
    required this.orderUrl,
    required this.commissionFees,
    required this.deliveryFeesCents,
    required this.deliveryVatCents,
    required this.paymentMethod,
    this.merchantStaffTag,
    required this.apiSource,
    required this.data,
    required this.token,
    required this.url,
  });

  factory OrderIdModel.fromJson(Map<String, dynamic> json) => OrderIdModel(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    deliveryNeeded: json["delivery_needed"],
    merchant: Merchant.fromJson(json["merchant"]),
    collector: json["collector"],
    amountCents: json["amount_cents"],
    shippingData: json["shipping_data"],
    currency: json["currency"],
    isPaymentLocked: json["is_payment_locked"],
    isReturn: json["is_return"],
    isCancel: json["is_cancel"],
    isReturned: json["is_returned"],
    isCanceled: json["is_canceled"],
    merchantOrderId: json["merchant_order_id"],
    walletNotification: json["wallet_notification"],
    paidAmountCents: json["paid_amount_cents"],
    notifyUserWithEmail: json["notify_user_with_email"],
    items: List<dynamic>.from(json["items"].map((x) => x)),
    orderUrl: json["order_url"],
    commissionFees: json["commission_fees"],
    deliveryFeesCents: json["delivery_fees_cents"],
    deliveryVatCents: json["delivery_vat_cents"],
    paymentMethod: json["payment_method"],
    merchantStaffTag: json["merchant_staff_tag"],
    apiSource: json["api_source"],
    data: Data.fromJson(json["data"]),
    token: json["token"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "delivery_needed": deliveryNeeded,
    "merchant": merchant.toJson(),
    "collector": collector,
    "amount_cents": amountCents,
    "shipping_data": shippingData,
    "currency": currency,
    "is_payment_locked": isPaymentLocked,
    "is_return": isReturn,
    "is_cancel": isCancel,
    "is_returned": isReturned,
    "is_canceled": isCanceled,
    "merchant_order_id": merchantOrderId,
    "wallet_notification": walletNotification,
    "paid_amount_cents": paidAmountCents,
    "notify_user_with_email": notifyUserWithEmail,
    "items": List<dynamic>.from(items.map((x) => x)),
    "order_url": orderUrl,
    "commission_fees": commissionFees,
    "delivery_fees_cents": deliveryFeesCents,
    "delivery_vat_cents": deliveryVatCents,
    "payment_method": paymentMethod,
    "merchant_staff_tag": merchantStaffTag,
    "api_source": apiSource,
    "data": data.toJson(),
    "token": token,
    "url": url,
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Merchant {
 final int id;
 final DateTime createdAt;
 final List<String> phones;
 final List<String> companyEmails;
  final String companyName;
  final String state;
  final String country;
  final String city;
  final String postalCode;
  final String street;

  Merchant({
    required this.id,
    required this.createdAt,
    required this.phones,
    required this.companyEmails,
    required this.companyName,
    required this.state,
    required this.country,
    required this.city,
    required this.postalCode,
    required this.street,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    phones: List<String>.from(json["phones"].map((x) => x)),
    companyEmails: List<String>.from(json["company_emails"].map((x) => x)),
    companyName: json["company_name"],
    state: json["state"],
    country: json["country"],
    city: json["city"],
    postalCode: json["postal_code"],
    street: json["street"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "phones": List<dynamic>.from(phones.map((x) => x)),
    "company_emails": List<dynamic>.from(companyEmails.map((x) => x)),
    "company_name": companyName,
    "state": state,
    "country": country,
    "city": city,
    "postal_code": postalCode,
    "street": street,
  };
}

class Price {
  final int id;
  final int product_id;
  final String qty_type;
  final int qty_weight;
  final int regular_price;
  final int discount_type;
  final int discount_value;
  final int sale_price;

  Price(
      {required this.id,
      required this.product_id,
      required this.qty_type,
      required this.qty_weight,
      required this.regular_price,
      required this.discount_type,
      required this.discount_value,
      required this.sale_price});

  factory Price.fromJson(Map<String, dynamic> data) => Price(
      id: data['id'],
      product_id: data['product_id'],
      qty_type: data['qty_type'],
      qty_weight: data['qty_weight'],
      regular_price: data['regular_price'],
      discount_type: data['discount_type'],
      discount_value: data['discount_value'],
      sale_price: data['sale_price']);
}

import 'dart:convert';

List<SaleOrders> saleorderFromJson(String str) =>
    List<SaleOrders>.from(json.decode(str).map((x) => SaleOrders.fromJson(x)));

String saleorderToJson(List<SaleOrders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SaleOrders {
  int? docEntry;
  String? docStatus;
  String? canceled;
  String? createDate;
  String? docDate;
  String? docDueDate;
  String? cardCode;
  String? cardName;
  double? docTotal;
  double? vatSum;
  String? comments;
  List<Line>? line;

  SaleOrders(
      {this.docEntry,
      this.docStatus,
      this.canceled,
      this.createDate,
      this.docDate,
      this.docDueDate,
      this.cardCode,
      this.cardName,
      this.docTotal,
      this.vatSum,
      this.comments,
      this.line});

  SaleOrders.fromJson(Map<String, dynamic> json) {
    docEntry = json['docEntry'];
    docStatus = json['docStatus'];
    canceled = json['canceled'];
    createDate = json['createDate'];
    docDate = json['docDate'];
    docDueDate = json['docDueDate'];
    cardCode = json['cardCode'];
    cardName = json['cardName'];
    docTotal = json['docTotal'];
    vatSum = json['vatSum'];
    comments = json['comments'];
    if (json['line'] != null) {
      line = <Line>[];
      json['line'].forEach((v) {
        line!.add(Line.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['docEntry'] = docEntry;
    data['docStatus'] = docStatus;
    data['canceled'] = canceled;
    data['createDate'] = createDate;
    data['docDate'] = docDate;
    data['docDueDate'] = docDueDate;
    data['cardCode'] = cardCode;
    data['cardName'] = cardName;
    data['docTotal'] = docTotal;
    data['vatSum'] = vatSum;
    data['comments'] = comments;
    if (line != null) {
      data['line'] = line!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Line {
  int? docEntry;
  int? lineNum;
  String? itemCode;
  String? dscription;
  double? quantity;
  double? price;
  double? discPrcnt;
  double? lineTotal;
  String? whsCode;
  double? vatPrcnt;
  String? vatGroup;

  Line(
      {this.docEntry,
      this.lineNum,
      this.itemCode,
      this.dscription,
      this.quantity,
      this.price,
      this.discPrcnt,
      this.lineTotal,
      this.whsCode,
      this.vatPrcnt,
      this.vatGroup});

  Line.fromJson(Map<String, dynamic> json) {
    docEntry = json['docEntry'];
    lineNum = json['lineNum'];
    itemCode = json['itemCode'];
    dscription = json['dscription'];
    quantity = json['quantity'];
    price = json['price'];
    discPrcnt = json['discPrcnt'];
    lineTotal = json['lineTotal'];
    whsCode = json['whsCode'];
    vatPrcnt = json['vatPrcnt'];
    vatGroup = json['vatGroup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['docEntry'] = docEntry;
    data['lineNum'] = lineNum;
    data['itemCode'] = itemCode;
    data['dscription'] = dscription;
    data['quantity'] = quantity;
    data['price'] = price;
    data['discPrcnt'] = discPrcnt;
    data['lineTotal'] = lineTotal;
    data['whsCode'] = whsCode;
    data['vatPrcnt'] = vatPrcnt;
    data['vatGroup'] = vatGroup;
    return data;
  }
}

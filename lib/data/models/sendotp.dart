class SendOtpModel {
  String? statusCode;
  String? statusMessage;
  String? datetime;
  dynamic? data;

  SendOtpModel({this.statusCode, this.statusMessage, this.datetime, this.data});

  SendOtpModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    datetime = json['datetime'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['status_message'] = this.statusMessage;
    data['datetime'] = this.datetime;
    data['data'] = this.data;
    return data;
  }
}
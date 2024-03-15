class jsonimgemodel {
  String? statuscode;
  String? status;
  List<Data>? data;

  jsonimgemodel({this.statuscode, this.status, this.data});

  jsonimgemodel.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = this.statuscode;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? iD;
  String? imagePath;
  int? bannerTypeID;
  bool? isACtive;
  String? addDate;
  int? msrno;
  int? companyMemberID;
  String? name;

  Data(
      {this.iD,
      this.imagePath,
      this.bannerTypeID,
      this.isACtive,
      this.addDate,
      this.msrno,
      this.companyMemberID,
      this.name});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    imagePath = json['ImagePath'];
    bannerTypeID = json['BannerTypeID'];
    isACtive = json['IsACtive'];
    addDate = json['AddDate'];
    msrno = json['Msrno'];
    companyMemberID = json['CompanyMemberID'];
    name = json['Name'];
  }

  get img => null;

  get serviceID => null;

  get operatorName => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ImagePath'] = this.imagePath;
    data['BannerTypeID'] = this.bannerTypeID;
    data['IsACtive'] = this.isACtive;
    data['AddDate'] = this.addDate;
    data['Msrno'] = this.msrno;
    data['CompanyMemberID'] = this.companyMemberID;
    data['Name'] = this.name;
    return data;
  }
}

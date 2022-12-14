///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class SuccessModel {
/*
{
  "status": "success",
  "message": "This document is verified",
  "resource_type": "Employee",
  "resource_id": 10006,
  "resource_name": "Anneke Preusig",
  "issue_date": "29 July, 2022",
  "issuer_name": "Admin"
}
*/

  String? status;
  String? message;
  String? resourceType;
  int? resourceId;
  String? resourceName;
  String? issueDate;
  String? issuerName;

  SuccessModel({
    this.status,
    this.message,
    this.resourceType,
    this.resourceId,
    this.resourceName,
    this.issueDate,
    this.issuerName,
  });
  SuccessModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    message = json['message']?.toString();
    resourceType = json['resource_type']?.toString();
    resourceId = json['resource_id']?.toInt();
    resourceName = json['resource_name']?.toString();
    issueDate = json['issue_date']?.toString();
    issuerName = json['issuer_name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['resource_type'] = resourceType;
    data['resource_id'] = resourceId;
    data['resource_name'] = resourceName;
    data['issue_date'] = issueDate;
    data['issuer_name'] = issuerName;
    return data;
  }
}

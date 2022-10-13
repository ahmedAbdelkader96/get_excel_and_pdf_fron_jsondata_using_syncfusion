class SalesActivity {
  /// Creates the employee class with required details.
  SalesActivity(
      {this.ID,
        this.CompanyID,
        this.CompanyBranchID,
        this.EmpID,
        this.LogStatusID,
        this.LogType,
        this.LogDateTime,
        this.ServerLogDateTime,
        this.AutomaticFromSystem,
        this.MapUrl,
        this.Address,
        this.Barcode,
        this.DeviceID,
        this.TMSEmpCode,
        this.ImportID,
        this.TmsEmployeeID,
        this.ReferenceAppName,
        this.LocationTypeID,
        this.OfflineFlag,
        this.ValidateCheck,
        this.ValidateNote,
        this.ValidateNoteAr,
        this.CreatedUser,
        this.CreatedDate,
        this.Note});

  final int   ID;
  final int   CompanyID;
  final int   CompanyBranchID;
  final int   EmpID;
  final String  LogStatusID;
  final String  LogType;
  final String  LogDateTime;
  final String  ServerLogDateTime;
  final bool  AutomaticFromSystem;
  final String  MapUrl;
  final String  Address;
  final String  Barcode;
  final int  DeviceID;
  final String  TMSEmpCode;
  final int  ImportID;
  final int  TmsEmployeeID;
  final String  ReferenceAppName;

  final String  LocationTypeID;
  final bool  OfflineFlag;
  final bool  ValidateCheck;
  final String  ValidateNote;
  final String  ValidateNoteAr;
  final int  CreatedUser;
  final String  CreatedDate;
  final String  Note;



  factory SalesActivity.fromJson(Map<dynamic, dynamic> json) {
    return SalesActivity(
      ID: json['ID'],
      CompanyID: json['CompanyID'],
      CompanyBranchID: json['CompanyBranchID'],
      EmpID: json['EmpID'],
      LogStatusID: json['LogStatusID'],
      LogType: json['LogType'],
      LogDateTime: json['LogDateTime'],
      ServerLogDateTime: json['ServerLogDateTime'],
      AutomaticFromSystem: json['AutomaticFromSystem'],
      MapUrl: json['MapUrl'],
      Address: json['Address'],
      Barcode: json['Barcode'],
      DeviceID: json['DeviceID'],
      TMSEmpCode: json['TMSEmpCode'],
      ImportID: json['ImportID'],
      TmsEmployeeID: json['TmsEmployeeID'],
      ReferenceAppName: json['ReferenceAppName'],


      LocationTypeID: json['LocationTypeID'],
      OfflineFlag: json['OfflineFlag'],
      ValidateCheck: json['ValidateCheck'],
      ValidateNote: json['ValidateNote'],
      ValidateNoteAr: json['ValidateNoteAr'],
      CreatedUser: json['CreatedUser'],
      CreatedDate: json['CreatedDate'],
      Note: json['Note'],
    );
  }

}

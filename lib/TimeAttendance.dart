import 'dart:convert';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:http/http.dart' as http;


import 'package:http/http.dart'as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart'
    hide Alignment, Column, Row;
//import 'mobile.dart' if (dart.library.html) 'web.dart';
import 'models/TimeAttendance.dart';

import 'helper/save_file_mobile_desktop.dart'
if (dart.library.html) 'helper/save_file_web.dart' as helper;

class TimeAttendanceExportedPage extends StatefulWidget {
  const TimeAttendanceExportedPage(this.data,{Key key}) : super(key: key);
  final List<TimeAttendance> data;
  @override
  _TimeAttendanceExportedPageState createState() => _TimeAttendanceExportedPageState();
}

class _TimeAttendanceExportedPageState extends State<TimeAttendanceExportedPage> {
  List<TimeAttendance> records = <TimeAttendance>[];
  RecordsDataGridSource recordsDataGridSource;

  final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();

  @override
  void initState() {
    super.initState();
    print("dat is : "+widget.data.toString());
    records = getEmployeeData();
    recordsDataGridSource = RecordsDataGridSource(recordsData: records);;

  }


  Future<void> exportDataGridToExcel() async {

    final Workbook workbook = _key.currentState.exportToExcelWorkbook();

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    await helper.saveAndLaunchFile(bytes, 'DataGrid.xlsx');
  }
  Future<void> exportDataGridToPdf() async {
    final PdfDocument document =
    _key.currentState.exportToPdfDocument();
    final List<int> bytes = document.save() as List<int> ;
    //File('DataGrid.pdf').writeAsBytes(bytes);
    await helper.saveAndLaunchFile(bytes, 'DataGrid.pdf');
    document.dispose();
  }
  // Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  //   final path = (await getExternalStorageDirectory()).path;
  //   final file = File('$path/$fileName');
  //   await file.writeAsBytes(bytes, flush: true);
  //   OpenFile.open('$path/$fileName');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Syncfusion Flutter DataGrid Export')),
        body: Column(children: <Widget>[
          Container(
              margin: const EdgeInsets.all(12.0),
              child: Row(children: <Widget>[
                SizedBox(
                    height: 40.0,
                    width: 150.0,
                    child: MaterialButton(
                        color: Colors.blue,
                        child: const Center(
                            child: Text('Export to Excel',
                                style: TextStyle(color: Colors.white))),
                        onPressed: exportDataGridToExcel)),
                SizedBox(
                    height: 40.0,
                    width: 150.0,
                    child: MaterialButton(
                        color: Colors.blue,
                        child: const Center(
                            child: Text('Export to Excel',
                                style: TextStyle(color: Colors.white))),
                        onPressed: exportDataGridToPdf)),

              ])),
          Expanded(
              child: SfDataGrid(
                  key: _key,
                  source: recordsDataGridSource,
                  columns: <GridColumn>[
                    GridColumn(
                        columnName: 'ID',
                        label: Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: const Text('ID'))),
                    GridColumn(
                        columnName: 'CompanyID',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('CompanyID'))),
                    GridColumn(
                        columnName: 'CompanyBranchID',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('CompanyBranchID',
                                overflow: TextOverflow.ellipsis))),
                    GridColumn(
                        columnName: 'EmpID',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('EmpID'))),
                    GridColumn(
                        columnName: 'LogStatusID',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('LogStatusID'))),
                    GridColumn(
                        columnName: 'LogType',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('LogType'))),
                    GridColumn(
                        columnName: 'LogDateTime',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('LogDateTime'))),
                    GridColumn(
                        columnName: 'ServerLogDateTime',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('ServerLogDateTime'))),
                    GridColumn(
                        columnName: 'AutomaticFromSystem',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('AutomaticFromSystem'))),
                    GridColumn(
                        columnName: 'MapUrl',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('MapUrl'))),
                    GridColumn(
                        columnName: 'Address',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Address'))),
                    GridColumn(
                        columnName: 'Barcode',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Barcode'))),
                    GridColumn(
                        columnName: 'DeviceID',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('DeviceID'))),
                    GridColumn(
                        columnName: 'TMSEmpCode',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('TMSEmpCode'))),
                    GridColumn(
                        columnName: 'ImportID',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('ImportID'))),
                    GridColumn(
                        columnName: 'TmsEmployeeID',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('TmsEmployeeID'))),
                    GridColumn(
                        columnName: 'ReferenceAppName',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('ReferenceAppName'))),

                    GridColumn(
                        columnName: 'LocationTypeID',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('LocationTypeID'))),
                    GridColumn(
                        columnName: 'OfflineFlag',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('OfflineFlag'))),
                    GridColumn(
                        columnName: 'ValidateCheck',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('ValidateCheck'))),
                    GridColumn(
                        columnName: 'ValidateNote',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('ValidateNote'))),
                    GridColumn(
                        columnName: 'ValidateNoteAr',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('ValidateNoteAr'))),
                    GridColumn(
                        columnName: 'CreatedUser',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('CreatedUser'))),
                    GridColumn(
                        columnName: 'CreatedDate',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('CreatedDate'))),
                    GridColumn(
                        columnName: 'Note',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Note'))),


                  ]))
        ]));
  }

  List<TimeAttendance> getEmployeeData() {
    return <TimeAttendance>[
      for(int x = 0 ; x<widget.data.length ; x++)
        TimeAttendance(ID:widget.data[x].ID, CompanyID:widget.data[x].CompanyID, CompanyBranchID:widget.data[x].CompanyBranchID
            , EmpID:widget.data[x].EmpID, LogStatusID:widget.data[x].LogStatusID
            , LogType:widget.data[x].LogType, LogDateTime:widget.data[x].LogDateTime, ServerLogDateTime:widget.data[x].ServerLogDateTime, AutomaticFromSystem:widget.data[x].AutomaticFromSystem,
            MapUrl:widget.data[x].MapUrl, Address: "widget.data[x].Address.toString()"  , Barcode:widget.data[x].Barcode,
            DeviceID:widget.data[x].DeviceID,TMSEmpCode: widget.data[x].TMSEmpCode,ImportID: widget.data[x].ImportID, TmsEmployeeID:widget.data[x].TmsEmployeeID, ReferenceAppName:widget.data[x].ReferenceAppName,
            LocationTypeID:widget.data[x].LocationTypeID , OfflineFlag: widget.data[x].OfflineFlag , ValidateCheck:widget.data[x].ValidateCheck , ValidateNote:widget.data[x].ValidateNote , ValidateNoteAr:widget.data[x].ValidateNoteAr , CreatedUser:widget.data[x].CreatedUser,
            CreatedDate:widget.data[x].CreatedDate ,Note:widget.data[x].Note ),
      //Employee(0,0,0,0,"String LogStatusID","String LogType","String LogDateTime","String ServerLogDateTime",false,"String MapUrl","String Address","String Barcode", 0, "String TMSEmpCode", 0, 0,"String ReferenceAppName"),

    ];
  }
}


class RecordsDataGridSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  RecordsDataGridSource({ List<TimeAttendance> recordsData}) {
    _employeeData = recordsData
        .map<DataGridRow>((TimeAttendance dataGridRow) =>
        DataGridRow(cells: <DataGridCell>[
          DataGridCell<int>(columnName: 'ID', value: dataGridRow.ID),
          DataGridCell<int>(columnName: 'CompanyID', value: dataGridRow.CompanyID),
          DataGridCell<int>(columnName: 'CompanyBranchID', value: dataGridRow.CompanyBranchID),
          DataGridCell<int>(columnName: 'EmpID', value: dataGridRow.EmpID),
          DataGridCell<String>(columnName: 'LogStatusID', value: dataGridRow.LogStatusID.toString()),
          DataGridCell<String>(columnName: 'LogType', value: dataGridRow.LogType.toString()),
          DataGridCell<String>(columnName: 'LogDateTime', value: dataGridRow.LogDateTime.toString()),
          DataGridCell<String>(columnName: 'ServerLogDateTime', value: dataGridRow.ServerLogDateTime.toString()),
          DataGridCell<bool>(columnName: 'AutomaticFromSystem', value: dataGridRow.AutomaticFromSystem),
          DataGridCell<String>(columnName: 'MapUrl', value: dataGridRow.MapUrl.toString()),
          DataGridCell<String>(columnName: 'Address', value: dataGridRow.Address.toString()),
          DataGridCell<String>(columnName: 'Barcode', value: dataGridRow.Barcode.toString()),
          DataGridCell<int>(columnName: 'DeviceID', value: dataGridRow.DeviceID),
          DataGridCell<String>(columnName: 'TMSEmpCode', value: dataGridRow.TMSEmpCode.toString()),
          DataGridCell<int>(columnName: 'ImportID', value: dataGridRow.ImportID),
          DataGridCell<int>(columnName: 'TmsEmployeeID', value: dataGridRow.TmsEmployeeID),
          DataGridCell<String>(columnName: 'ReferenceAppName', value: dataGridRow.ReferenceAppName.toString()),

          DataGridCell<String>(columnName: 'LocationTypeID', value: dataGridRow.LocationTypeID.toString()),
          DataGridCell<bool>(columnName: 'OfflineFlag', value: dataGridRow.OfflineFlag),
          DataGridCell<bool>(columnName: 'ValidateCheck', value: dataGridRow.ValidateCheck),
          DataGridCell<String>(columnName: 'ValidateNote', value: dataGridRow.ValidateNote.toString()),
          DataGridCell<String>(columnName: 'ValidateNoteAr', value: dataGridRow.ValidateNoteAr.toString()),
          DataGridCell<int>(columnName: 'CreatedUser', value: dataGridRow.CreatedUser),
          DataGridCell<String>(columnName: 'CreatedDate', value: dataGridRow.CreatedDate.toString()),
          DataGridCell<String>(columnName: 'Note', value: dataGridRow.Note.toString()),


        ]))
        .toList();
  }

  List<DataGridRow> _employeeData = <DataGridRow>[];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((DataGridCell cell) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(cell.value.toString()),
          );
        }).toList());
  }
}
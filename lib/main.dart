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

// Local import
import 'TimeAttendance.dart';
import 'helper/save_file_mobile_desktop.dart'
if (dart.library.html) 'helper/save_file_web.dart' as helper;
import 'models/ProjectTimeSheet.dart';
import 'models/SalesActivity.dart';
import 'models/TimeAttendance.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

/// The application that contains datagrid on it.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Maain(),
    );
  }
}

class Maain extends StatefulWidget {
  const Maain({Key key}) : super(key: key);

  @override
  State<Maain> createState() => _MaainState();
}

class _MaainState extends State<Maain> {

  List<TimeAttendance> TimeAttendancedata = <TimeAttendance>[];
   getTimeAttendancedata() async {
    try {

      final Uri uri = Uri.parse(
          'https://proxytracer.trio365.com//api/sec/TTS_ExploreData?CompanyID=1&LanguageID=1&UserID=51&Data={"FromDate":"2022-07-1","ToDate":"2022-08-1","Type":"TimeAttendance"}');
      final response = await http.get(uri, headers: {"Authorization": "Bearer hSGIY-HkCgN4teNX7HpzhqfgJ5djb803YD10hGfH7wo8Z4tMVsnlQhVefw8kQWGZz6UW7qSRrB1vD3ZjHQT0MPZeuK9AmyQPdJogWe2p-eAWKMPagRQ98w_pydVF8D-6nPv0NEOJb1fSaLMzrsHqYk0qwsDDq77AWbkTAieEbVmqDrMWqKDUMF8ZFj6JNFznia4qONiJ6noTWHqctM9MZWULpf3G_ebfBnmss9I8pfj7Kk0ptRE1NgQFNl3VeQrgyG5A_z7tskF3voZhwfqXbrhQ3DkXoxpLAAFZWCHZYtJyzogDvwwAf9MNLSoj3f1wU-JCxw31BLVAl5NA2nFLSQ"});
      print("response.body is : "+response.body.toString());

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

        //return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();

        setState(() {
          TimeAttendancedata = parsed.map<TimeAttendance>((json) => TimeAttendance.fromJson(json)).toList() ;
        });
        print("data is : "+TimeAttendancedata.toString());
      } else {
        TimeAttendancedata =[];
      }
    } catch (e) {
      TimeAttendancedata =[];
    }
  }



  List<SalesActivity> SalesActivitiesdata = <SalesActivity>[];
  getSalesActivitiesdata() async {
    try {

      final Uri uri = Uri.parse(
          'https://proxytracer.trio365.com//api/sec/TTS_ExploreData?CompanyID=1&LanguageID=1&UserID=51&Data={"FromDate":"2022-07-1","ToDate":"2022-08-1","Type":"SalesActivities"}');
      final response = await http.get(uri, headers: {"Authorization": "Bearer hSGIY-HkCgN4teNX7HpzhqfgJ5djb803YD10hGfH7wo8Z4tMVsnlQhVefw8kQWGZz6UW7qSRrB1vD3ZjHQT0MPZeuK9AmyQPdJogWe2p-eAWKMPagRQ98w_pydVF8D-6nPv0NEOJb1fSaLMzrsHqYk0qwsDDq77AWbkTAieEbVmqDrMWqKDUMF8ZFj6JNFznia4qONiJ6noTWHqctM9MZWULpf3G_ebfBnmss9I8pfj7Kk0ptRE1NgQFNl3VeQrgyG5A_z7tskF3voZhwfqXbrhQ3DkXoxpLAAFZWCHZYtJyzogDvwwAf9MNLSoj3f1wU-JCxw31BLVAl5NA2nFLSQ"});
      print("response.body is : "+response.body.toString());

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

        setState(() {
          SalesActivitiesdata = parsed.map<TimeAttendance>((json) => TimeAttendance.fromJson(json)).toList() ;
        });
        print("data is : "+SalesActivitiesdata.toString());
      } else {
        SalesActivitiesdata =[];
      }
    } catch (e) {
      SalesActivitiesdata =[];
    }
  }





  List<ProjectTimeSheet> ProjectTimeSheetsdata = <ProjectTimeSheet>[];
  getTimeSheetsdata() async {
    try {

      final Uri uri = Uri.parse(
          'https://proxytracer.trio365.com//api/sec/TTS_ExploreData?CompanyID=1&LanguageID=1&UserID=51&Data={"FromDate":"2022-07-1","ToDate":"2022-08-1","Type":"ProjectTimeSheets"}');
      final response = await http.get(uri, headers: {"Authorization": "Bearer hSGIY-HkCgN4teNX7HpzhqfgJ5djb803YD10hGfH7wo8Z4tMVsnlQhVefw8kQWGZz6UW7qSRrB1vD3ZjHQT0MPZeuK9AmyQPdJogWe2p-eAWKMPagRQ98w_pydVF8D-6nPv0NEOJb1fSaLMzrsHqYk0qwsDDq77AWbkTAieEbVmqDrMWqKDUMF8ZFj6JNFznia4qONiJ6noTWHqctM9MZWULpf3G_ebfBnmss9I8pfj7Kk0ptRE1NgQFNl3VeQrgyG5A_z7tskF3voZhwfqXbrhQ3DkXoxpLAAFZWCHZYtJyzogDvwwAf9MNLSoj3f1wU-JCxw31BLVAl5NA2nFLSQ"});
      print("response.body is : "+response.body.toString());

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

        setState(() {
          ProjectTimeSheetsdata = parsed.map<TimeAttendance>((json) => TimeAttendance.fromJson(json)).toList() ;
        });
        print("data is : "+ProjectTimeSheetsdata.toString());
      } else {
        ProjectTimeSheetsdata =[];
      }
    } catch (e) {
      ProjectTimeSheetsdata =[];
    }
  }


  @override
  void initState() {
    super.initState();
    getTimeAttendancedata();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
        onPressed: (){
          print("data is : "+TimeAttendancedata.toString());
          if(TimeAttendancedata!=null&&TimeAttendancedata.isNotEmpty){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>TimeAttendanceExportedPage(TimeAttendancedata)));
          }
        },
      ),),
    );
  }
}


/// The home page of the application which hosts the datagrid.




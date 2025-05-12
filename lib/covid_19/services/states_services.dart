import 'dart:convert';

import 'package:e_com_flutter/covid_19/model/WorldStateModel.dart';
import 'package:e_com_flutter/covid_19/utilities/AppUrl.dart';
import 'package:http/http.dart' as http;

class StatesServices{

  Future<WorldStateModel> fetchWorldStateRecords() async{
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      return WorldStateModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }

}
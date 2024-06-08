import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todoapi/otherapi/apihelper.dart';

import 'mdatamodel.dart';


class FilterProduct extends StatefulWidget{
  @override
  State<FilterProduct> createState() => _FilterProductState();
}

class _FilterProductState extends State<FilterProduct> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getproduct();
  }
  void getproduct() async {
   // String url = "https://api.greenfoot.in/api/Product/filters";
    var response = await http.get(Uri.parse(ApiHelper.getfilter),headers:{
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
          'eyJzdWIiOiJkOTQ0ZGFkMi0wYWIzLTQyMTgtYjM4Yy0zNDVjNGVjYTE3NTYiLCJodHRwOi8vc2NoZW1hcy'
          '54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImQ5NDRkYWQyL'
          'TBhYjMtNDIxOC1iMzhjLTM0NWM0ZWNhMTc1NiIsImp0aSI6IjQxZWZhYzJkLWI3MjAtNDI0ZC1hMjlmLWI2NGJmOTljOTRhNy'
          'IsIm5iZiI6MTcxMDU4NTUzMywiZXhwIjoxNzQyMTIxNTMzLCJpc3MiOiJsb2NhbGhvc3Q6NDQzNTMiLCJhdWQiOiJsb2NhbGhvc'
          '3Q6NDQzNTMifQ.IeoX8RMCIhjvzSRi719uvc6Dk984eoExq3KivkM3wDQ'
    }
    );
    if (response.statusCode == 200) {
      var mData = response.body;
      print(mData);
      var rawData = jsonDecode(mData);
      MDataModel product = MDataModel.fromJson(rawData);
      print(product);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child:  Center(child: Text("Hello")),
      ),
    );
  }

}



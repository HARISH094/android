import 'package:flutter/material.dart';
import 'package:hrapp/Models/Approve_leave_model.dart';
import '../../../API_Services/API_Services.dart';
import '../../../Utils/utils.dart';
import 'Rleave_detailscreen.dart';

class Rleave_listscreen extends StatefulWidget {
  const Rleave_listscreen({super.key});

  @override
  State<Rleave_listscreen> createState() => _Rleave_listscreenState();
}

class _Rleave_listscreenState extends State<Rleave_listscreen> {

  bool isLoading = true;
  Approve_leave_model? cApprove_leave_model;
  List<leavelist>? datalist;
  @override
 void initState() {
    super.initState();
    super.initState();
    Rleaveapi();
  }

  Rleaveapi() {
    isLoading = true;
    setState(() {
    });
    ApiServices().approveleavelist().then((value) {
      if (value != null) {
        print("User");
        print(value);
        cApprove_leave_model = value;
        datalist = cApprove_leave_model!.data;
        print(datalist);

        print("datalist");
        print(datalist);
      }
      else {
        toastMessage(context, "Something went wrong", Colors.red);
      }
      isLoading = false;
      setState(() {
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leave Details"),
      ),
      body: isLoading == true
          ? loaderWidget() :Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade100,
              Colors.white,
              Colors.blue.shade300,
            ],
          ),
        ),
            child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: datalist!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
            final list = datalist![index];
            return Column(
              key: Key('$index'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Rleavedetailscreen(data:list,)));
                    },
                    child: ListTile(
                      title: Text("${datalist![index].title}"),
                      subtitle: Text("${datalist![index].bioid}"),
                      trailing: Text("${datalist![index].reason}"),
                    ),
                  ),
                ),
                Divider(thickness: 1,),
              ],
            );
                    },
                  ),
          ),
    );
  }
}



/*import "package:flutter/material.dart";
import "package:flutter_login_register/screen/weight_list/weight_process.dart";

import "../../models/weight_info.dart";
import "../../services/db_utils.dart";


DbUtils utils = DbUtils();

class ListWeightGroup extends StatefulWidget {
  @override
  _ListWeightGroupState createState() => _ListWeightGroupState();
}

class _ListWeightGroupState extends State<ListWeightGroup> {
  List<WeightInfo> weightList = [];

  void getData() async {
    await utils.members().then((result) => {
          setState(() {
            weightList = result;
          })
        });
    print(weightList);
  }

  void showAlert(String alertTitle, String alertContent) {
    AlertDialog alertDialog;
    alertDialog =
        AlertDialog(title: Text(alertTitle), content: Text(alertContent));
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Kilolar Listelendi: " + weightList.length.toString())),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Adı',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Kilosu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: weightList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(weightList[index].name),
                        Text(weightList[index].weight.toString()),
                      ],
                    ),
                    onTap: () {
                      showAlert("group " + index.toString() + " clicked",
                          "group " + index.toString() + " clicked");
                    },
                    onLongPress: () async {
                      await utils
                          .deleteWeightGroup(weightList[index].id)
                          .then((value) => {
                                showAlert(
                                    "group " + index.toString() + " deleted",
                                    "group " + index.toString() + " deleted")
                              });
                      getData();
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeightHome()),
                    );
                  },
                  child: Text("Return Homepage")),
            ),
          ],
        ),
      ),
    );
  }
}
*/
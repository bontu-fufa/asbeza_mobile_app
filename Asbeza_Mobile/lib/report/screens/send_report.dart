import 'package:flutter/material.dart';
import 'package:asbeza_mobile_app/item/models/item_model.dart';

class SendReport extends StatefulWidget {
  const SendReport({Key? key}) : super(key: key);

  @override
  _SendReportState createState() => _SendReportState();
}

class _SendReportState extends State<SendReport> {
  @override
  Widget build(BuildContext context) {
    Item i = Item(id: 1, name: 'Onion', min_price: 12, max_price: 14);

    final locationTextController = TextEditingController();
    final descriptionTextController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            // leading: BackButton(color: Colors.white),
            centerTitle: true,
            title: const Text('Send Reports')),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            width: double.infinity,
                            color: Colors.blue[100],
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(i.name),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Max Price : " +
                                        i.min_price.toString()),
                                    Text("Min Price : " +
                                        i.max_price.toString()),
                                  ],
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Add Report Location and Description"),
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: locationTextController,
                              minLines: 1,
                              maxLines: 10,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.location_city_rounded),
                                hintText: "Location of the shop",
                                labelText: 'Location ',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter location';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: descriptionTextController,
                              minLines: 1,
                              maxLines: 10,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.description),
                                hintText: "Your report's full description",
                                labelText: 'Description ',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter description';
                                }
                                return null;
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Submiting your Report Data')),
                                  );
                                }
                              },
                              child: Text('Submit Report'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

_buil_report_form(Item item) {
  var f = Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Description:",
            style: TextStyle(
              fontSize: 20,
            )),
        const Padding(
          padding: EdgeInsets.fromLTRB(70, 10, 50, 10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
              hintText: 'Describtion',
            ),
          ),
        ),
        Text("Location:",
            style: TextStyle(
              fontSize: 20,
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(70, 10, 50, 10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Location',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(200, 20, 100, 30),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Submit',
            ),
            style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                side: BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                minimumSize: Size(150, 50),
                padding:
                    EdgeInsets.only(left: 80, right: 80, top: 15, bottom: 15)),
          ),
        )
      ],
    ),
  );
  return Container(
    child: Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: double.infinity,
              color: Colors.blue[100],
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(item.name),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Max Price : " + item.min_price.toString()),
                      Text("Min Price : " + item.max_price.toString()),
                    ],
                  )
                ],
              ),
            )),
        SizedBox(
          height: 10,
        ),
        Text("Add Report Location and Description"),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          minLines: 1,
          maxLines: 10,
          decoration: const InputDecoration(
            icon: Icon(Icons.location_city_rounded),
            hintText: "Location of the shop",
            labelText: 'Location ',
          ),
        ),
        TextFormField(
          minLines: 1,
          maxLines: 10,
          decoration: const InputDecoration(
            icon: Icon(Icons.description),
            hintText: "Your report's full description",
            labelText: 'Description ',
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Submit Report'),
        )
      ],
    ),
  );
}

void main() {
  runApp(
    const MaterialApp(
      home: SendReport(),
    ),
  );
}

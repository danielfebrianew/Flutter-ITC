import 'package:flutter/material.dart';
import 'package:login_application/api/api_services.dart';
import 'package:login_application/user_model.dart';

class FirstAssignmentPage extends StatefulWidget {
  const FirstAssignmentPage({Key? key}) : super(key: key);

  @override
  State<FirstAssignmentPage> createState() => _FirstAssignmentPageState();
}

FetchUser _userList = FetchUser();

class _FirstAssignmentPageState extends State<FirstAssignmentPage> {
  String? query = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: FutureBuilder<List<UserList>>(
            future: _userList.getUserList(query),
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            insetPadding:
                                const EdgeInsets.fromLTRB(10, 175, 10, 300),
                            title: const Text(
                              "Description",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                Text('Name : ${data?[index].name}'),
                                Text('Email : ${data?[index].email}'),
                                Text('Phone : ${data?[index].phone}'),
                                Text('Website : ${data?[index].website}'),
                                Text(
                                  'Address : ${data?[index].address!.street}, ${data?[index].address!.suite}, ${data?[index].address!.city}',
                                ),
                              ],
                            ),
                            backgroundColor: Colors.amber.shade50,
                          ),
                        );
                      },
                      title: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 50,
                            decoration: BoxDecoration(
                              // image: DecorationImage(image: ),
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '${data?[index].id}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${data?[index].name}'),
                              Text('${data?[index].email}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}

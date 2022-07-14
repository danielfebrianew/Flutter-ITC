import 'package:flutter/material.dart';
import 'package:login_application/api/api_services.dart';
import '../user_model.dart';

FetchUser _userList = FetchUser();

class SearchUser extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
        query = "";
      },
    );
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<UserList>>(
      future: _userList.getUserList(query),
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: data?.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 70,
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
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search User'),
    );
  }
}

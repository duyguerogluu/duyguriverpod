import 'package:duyguriverpod/models/user_model.dart';
import 'package:duyguriverpod/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: users.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : FutureBuilder(
                future: users.getData(),
                builder: (context, snapshot) {
                  print("Connection State: ${snapshot.connectionState}");
                  print("Has Error: ${snapshot.hasError}");
                  print("Has Data: ${snapshot.hasData}");
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Hata: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text("Veri bulunamadı."),
                    );
                  } else {
                    List<UserModel?> user = snapshot.data!;
                    return ListView.builder(
                        itemCount: user.length,
                        itemBuilder: (context, index) {
                          return buildCard(user[index]!);
                        });
                  }
                },
              ),
      ),
    );
  }

  Widget buildCard(UserModel model) {
    return Card(
      child: Column(
        children: [
          Text(model.firstName),
        ],
      ),
    );
  }
}

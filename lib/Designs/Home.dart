import 'package:blocapis/Repository/user_repository.dart';
import 'package:blocapis/Models/user%20model.dart';
import 'package:blocapis/blocs/app%20states.dart';
import 'package:blocapis/blocs/app_blocs.dart';
import 'package:blocapis/blocs/app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("The Bloc App",style:TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromARGB(255, 129, 232, 133),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(userList[index].avatar),
                    ),
                    title: Text(userList[index].firstName),
                    subtitle: Text(userList[index].lastName),
                  ),
                );
              },
            );
          }

          if (state is UserErrorState) {
            return Center(child: Text("Error"));
          }

          return Container();
        }),
      ),
    );
  }
}

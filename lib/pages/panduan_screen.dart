import 'package:flutter/material.dart';
import 'package:uts_pm2_silvianurb/data/datasource/remote_datasource.dart';
import 'package:uts_pm2_silvianurb/pages/bloc/user_bloc.dart';
import 'package:uts_pm2_silvianurb/pages/input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Panduan extends StatefulWidget {
  const Panduan({Key? key}) : super(key: key);

  @override
  _PanduanState createState() => _PanduanState();
}

class _PanduanState extends State<Panduan> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(remoteDataSource: RemoteDataSource())..add(LoadUser()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Panduan Brew'),
        ),
        body: MyRefreshIndicator(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => InputPage(),
              ),
            );
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyRefreshIndicator extends StatelessWidget {
  void _showDeleteConfirmationSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data berhasil dihapus'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserBloc>().add(LoadUser());
      },
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserError) {
            // Tambahkan handling error jika diperlukan
          } else if (state is UserLoaded) {
            // Tambahkan handling jika data berhasil dimuat
          }
        },
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            final data = state.kopis;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10.0), // Sesuaikan radius sesuai keinginan
                    child: Image.network(
                      data[index].avatar,
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(data[index].name),
                  subtitle: Text(data[index].email),
                  trailing: PopupMenuButton(
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                    onSelected: (String value) {
                      if (value == 'edit') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InputPage(
                              userToEdit: data[index],
                              isEditing: true,
                            ),
                          ),
                        );
                      } else if (value == 'delete') {
                        context
                            .read<UserBloc>()
                            .add(DeleteUser(data[index].id));
                        _showDeleteConfirmationSnackBar(context);
                      }
                    },
                  ),
                );
              },
            );
          } else {
            // Handle state lainnya jika diperlukan
            return SizedBox();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uts_pm2_silvianurb/pages/panduan_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uts_pm2_silvianurb/data/model/user.dart';
import 'package:uts_pm2_silvianurb/pages/bloc/user_bloc.dart';

class InputPage extends StatefulWidget {
  final User? userToEdit;
  final bool isEditing;

  InputPage({Key? key, this.userToEdit, this.isEditing = false})
      : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _avatarController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.userToEdit != null) {
      _avatarController.text = widget.userToEdit!.avatar;
      _nameController.text = widget.userToEdit!.name;
      _emailController.text = widget.userToEdit!.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit Panduan' : 'Input Panduan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Panduan(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _avatarController,
                decoration: InputDecoration(labelText: 'Avatar Link'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an avatar URL.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address.';
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final newUser = User(
                      id: widget.userToEdit?.id ?? 0,
                      avatar: _avatarController.text,
                      name: _nameController.text,
                      email: _emailController.text,
                    );
                    if (widget.userToEdit != null) {
                      context.read<UserBloc>().add(UpdateUser(newUser));
                    } else {
                      context.read<UserBloc>().add(CreateUser(newUser));
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Panduan(),
                      ),
                    );
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _avatarController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

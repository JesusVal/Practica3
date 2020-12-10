import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/creadas/bloc/mis_noticias_bloc.dart';
import 'package:noticias/models/noticia.dart';

class CrearMisNoticias extends StatefulWidget {
  final MisNoticiasBloc bloc;
  CrearMisNoticias({Key key, this.bloc}) : super(key: key);

  @override
  _CrearMisNoticiasState createState() => _CrearMisNoticiasState();
}

class _CrearMisNoticiasState extends State<CrearMisNoticias> {
  MisNoticiasBloc _bloc;

  final TextEditingController _tituloController = TextEditingController();

  final TextEditingController _descripcionController = TextEditingController();

  final TextEditingController _contentController = TextEditingController();

  bool _camara = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear noticia'),
      ),
      body: BlocProvider(
        create: (context) {
          _bloc = widget.bloc..add(FetchNewsEvent());
          return _bloc;
        },
        child: BlocConsumer<MisNoticiasBloc, MisNoticiasState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Titulo:'),
                        TextField(
                          controller: _tituloController,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Descripción:'),
                        TextField(
                          controller: _descripcionController,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Content:'),
                        TextField(
                          controller: _contentController,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.blueAccent,
                        ),
                        Checkbox(
                          value: _camara,
                          onChanged: (value) {
                            setState(() {
                              _camara = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                      child: Text('Cargar'),
                      color: Colors.lightBlue,
                      onPressed: () {
                        var noticia = Noticia(
                            source: null,
                            author: 'JesusVal',
                            title: _tituloController.text,
                            description: _descripcionController.text,
                            url: '',
                            urlToImage: '',
                            publishedAt: '',
                            content: _contentController.text);
                        _bloc.add(CreateNewEvent(
                          noticia: noticia,
                          camera: _camara,
                        ));
                        _tituloController.clear();
                        _descripcionController.clear();
                        _contentController.clear();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

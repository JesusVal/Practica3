import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/noticias/bloc/noticias_bloc.dart';
import 'package:noticias/noticias/item_noticia.dart';

class Buscar extends StatefulWidget {
  final NoticiasBloc bloc;
  Buscar({Key key, this.bloc}) : super(key: key);

  @override
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {
  NoticiasBloc _bloc;
  final TextEditingController _searchController = TextEditingController();

  Future<dynamic> _showDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Noticia a buscar",
            ),
            content: TextField(
              controller: _searchController,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            actions: [
              FlatButton(
                child: Text("Buscar"),
                onPressed: () {
                  _bloc.add(
                    NoticiasBuscarEvent(
                      search: _searchController.text.toLowerCase(),
                    ),
                  );
                  _searchController.clear();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busqueda'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _showDialog(context);
            },
          )
        ],
      ),
      body: Container(
        child: BlocProvider(
          create: (context) {
            _bloc = widget.bloc;
            return _bloc;
          },
          child: BlocConsumer<NoticiasBloc, NoticiasState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is NoticasBuscarResultState) {
                return ListView.builder(
                  itemCount: state.noticias.length,
                  itemBuilder: (context, idx) {
                    return ItemNoticia(
                      noticia: state.noticias[idx],
                    );
                  },
                );
              }
              return Container(
                child: Center(
                  child: Text('Ninguna noticia coincide con la busqueda'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

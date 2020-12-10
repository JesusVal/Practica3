import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/creadas/bloc/mis_noticias_bloc.dart';
import 'package:noticias/noticias/item_noticia.dart';

class MisNoticias extends StatefulWidget {
  final MisNoticiasBloc bloc;
  const MisNoticias({Key key, this.bloc}) : super(key: key);

  @override
  _MisNoticiasState createState() => _MisNoticiasState();
}

class _MisNoticiasState extends State<MisNoticias> {
  MisNoticiasBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis noticias'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _bloc.add(FetchNewsEvent());
            },
          )
        ],
      ),
      body: BlocProvider(
        create: (context) {
          _bloc = widget.bloc..add(FetchNewsEvent());
          return _bloc;
        },
        child: BlocConsumer<MisNoticiasBloc, MisNoticiasState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is FetchedNewsState) {
              return ListView.builder(
                itemCount: state.noticias.length,
                itemBuilder: (context, idx) => ItemNoticia(
                  noticia: state.noticias[idx],
                ),
              );
            }
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}

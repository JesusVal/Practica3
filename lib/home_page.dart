import 'package:flutter/material.dart';
import 'package:noticias/buscar/buscar.dart';
import 'package:noticias/creadas/bloc/mis_noticias_bloc.dart';
import 'package:noticias/creadas/crear/crear_mis_noticias.dart';
import 'package:noticias/creadas/mis_noticias.dart';
import 'package:noticias/noticias/bloc/noticias_bloc.dart';
import 'package:noticias/noticias/noticias.dart';
import 'package:noticias/nuevo/crear_noticia.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MisNoticiasBloc _misnoticiasBloc = MisNoticiasBloc();
  final NoticiasBloc _noticiasBloc = NoticiasBloc();

  dynamic _pagesList;
  int _currentPageIndex = 0;

  final _bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.article,
      ),
      label: "Inicio",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
      ),
      label: "Buscar",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.create,
      ),
      label: "Añadir",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.description,
      ),
      label: "Ver creadas",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
    _misnoticiasBloc.add(FetchNewsEvent());
    _pagesList = [
      // Noticias(bloc: _noticiasBloc),
      Noticias(
        bloc: _noticiasBloc,
      ),
      Buscar(
        bloc: _noticiasBloc,
      ),
      MisNoticias(
        bloc: _misnoticiasBloc,
      ),
      // CrearNoticia()
      CrearMisNoticias(
        bloc: _misnoticiasBloc,
      )
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  // int _currentPageIndex = 0;
  // final _pagesList = [
  //   Noticias(),
  //   Buscar(),
  //   MisNoticias(),
  //   CrearNoticia(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPageIndex,
        children: _pagesList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.indigo,
        currentIndex: _currentPageIndex,
        onTap: _onItemTapped,
        items: _bottomTabs,
      ),
    );
  }
}

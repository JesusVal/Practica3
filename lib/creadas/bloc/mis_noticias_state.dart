part of 'mis_noticias_bloc.dart';

abstract class MisNoticiasState extends Equatable {
  const MisNoticiasState();

  @override
  List<Object> get props => [];
}

class MisNoticiasInitial extends MisNoticiasState {}

class CreatedNewState extends MisNoticiasState {}

class FetchedNewsState extends MisNoticiasState {
  final List<Noticia> noticias;
  FetchedNewsState({this.noticias});
}

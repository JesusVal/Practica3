part of 'noticias_bloc.dart';

abstract class NoticiasEvent extends Equatable {
  const NoticiasEvent();

  @override
  List<Object> get props => [];
}

class GetNewsEvent extends NoticiasEvent {}

class NoticiasBuscarEvent extends NoticiasEvent {
  final String search;
  NoticiasBuscarEvent({this.search});
  @override
  List<Object> get props => [search];
}

part of 'mis_noticias_bloc.dart';

abstract class MisNoticiasEvent extends Equatable {
  const MisNoticiasEvent();

  @override
  List<Object> get props => [];
}

class CreateNewEvent extends MisNoticiasEvent {
  final Noticia noticia;
  final bool camera;
  CreateNewEvent({this.noticia, this.camera});
}

class FetchNewsEvent extends MisNoticiasEvent {}

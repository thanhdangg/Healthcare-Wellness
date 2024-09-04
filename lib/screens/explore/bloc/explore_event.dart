// import 'package:equatable/equatable.dart';

// abstract class ExploreEvent extends Equatable {
//   const ExploreEvent();

//   @override
//   List<Object?> get props => [];
// }

part of 'explore_bloc.dart';

abstract class ExploreEvent {}

class FetchRecentNews extends ExploreEvent {}

class FetchNewsByCategory extends ExploreEvent {
  final String category;
  FetchNewsByCategory({required this.category});
}

// class FetchRecommended extends ExploreEvent {}

// import 'package:equatable/equatable.dart';

// abstract class ExploreEvent extends Equatable {
//   const ExploreEvent();

//   @override
//   List<Object?> get props => [];
// }
abstract class ExploreEvent {}

class FetchRecentNews extends ExploreEvent {}

class FetchRecommended extends ExploreEvent {}

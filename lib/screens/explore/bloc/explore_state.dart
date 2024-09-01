// import 'package:equatable/equatable.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';

// abstract class ExploreState extends Equatable {
//   const ExploreState();

//   @override
//   List<Object?> get props => [];
// }
abstract class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final List<Article> recentNews;
  final List<Article> recommended;

  ExploreLoaded({
    required this.recentNews,
    required this.recommended,
  });

  @override
  List<Object?> get props => [recentNews, recommended];
}

class ExploreError extends ExploreState {
  final String message;

  ExploreError(this.message);

  // @override
  // List<Object?> get props => [message];
}

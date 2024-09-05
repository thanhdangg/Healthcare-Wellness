part of 'saved_bloc.dart';

abstract class SavedEvent {}

class GetSavedArticlesDB extends SavedEvent {}

class UpdateSavedArticlesDB extends SavedEvent {}

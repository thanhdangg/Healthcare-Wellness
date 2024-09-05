import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/screens/saved/bloc/saved_bloc.dart';
import 'package:healthcare_wellness/utils/enums.dart';

@RoutePage()
class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  late SavedBloc _savedBloc;
  @override
  void initState() {
    _savedBloc = BlocProvider.of<SavedBloc>(context);
    _savedBloc.add(GetSavedArticlesDB());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SavedBloc, SavedState>(builder: (context, state) {
        if (state.status == BlocStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.savedArticleList?[index].title ?? ''),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: state.savedArticleList?.length ?? 0,
          physics: const BouncingScrollPhysics(),
        );
      }),
    );
  }
}

import 'package:e_commerce_app/Features/home/domain/entities/first_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/presentation/blocs/home/home_bloc.dart';

import 'package:e_commerce_app/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/Features/home/presentation/widgets/text_form_field_search_widget.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_route_const.dart';
import '../../../../injection_injectable_package.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  final HomeBloc blocHome = getIt<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormFieldSearchWidget(
                    keyboardType: TextInputType.text,
                    fieldHint: "Search Now",
                    myController: searchController,
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      // Navigator.of(context).pushReplacementNamed("home_page");
                      GoRouter.of(context)
                          .pushReplacementNamed(MyAppRouteConst.homePage);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Color(0xff919394),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              bloc: blocHome,
              builder: (context, state) {
                if (state.statusFirstListView == HomeStatus.loaded) {
                  return ListView.builder(
                    itemCount: state.firstListView.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Text(state.firstListView[index].title),
                        ),
                      );
                    },
                  );
                } else if (state.statusFirstListView == HomeStatus.loading) {
                  return const LoadingWidget();
                } else {
                  return const Center(child: Text("Error"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<FirstListViewEntity> filterList = [];
  final HomeBloc blocHome = getIt<HomeBloc>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      MaterialButton(
        onPressed: () {
          close(context, null);
        },
        child: const Text(
          "Cancel",
          style: TextStyle(
            color: Color(0xff919394),
          ),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: blocHome,
      builder: (context, state) {
        if (state.statusFirstListView == HomeStatus.loaded) {
          return ListView.builder(
            itemCount: state.firstListView.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text(state.firstListView[index].title),
                ),
              );
            },
          );
        } else if (state.statusFirstListView == HomeStatus.loading) {
          return const LoadingWidget();
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return BlocBuilder<HomeBloc, HomeState>(
        bloc: blocHome,
        builder: (context, state) {
          if (state.statusFirstListView == HomeStatus.loaded) {
            return ListView.builder(
              itemCount: state.firstListView.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(
                      state.firstListView[index].title,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state.statusFirstListView == HomeStatus.loading) {
            return const LoadingWidget();
          } else {
            return const LoadingWidget();
          }
        },
      );
    } else {
      return BlocBuilder<HomeBloc, HomeState>(
        bloc: blocHome,
        builder: (context, state) {
          if (state.statusFirstListView == HomeStatus.loaded) {
            filterList = state.firstListView
                .where((element) => element.title.contains(query.toLowerCase()))
                .toList();
            return ListView.builder(
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(
                      filterList[index].title,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state.statusFirstListView == HomeStatus.loading) {
            return const LoadingWidget();
          } else {
            return const LoadingWidget();
          }
        },
      );
    }
  }
}

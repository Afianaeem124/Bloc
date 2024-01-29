import 'package:blflutter/bloc/fav_list.dart/fav_list_bloc.dart';
import 'package:blflutter/bloc/fav_list.dart/fav_list_events.dart';
import 'package:blflutter/bloc/fav_list.dart/fav_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blflutter/Model/fav_list_model.dart';

class FavouriteListScreen extends StatefulWidget {
  const FavouriteListScreen({super.key});

  @override
  State<FavouriteListScreen> createState() => _FavouriteListScreenState();
}

class _FavouriteListScreenState extends State<FavouriteListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteListBloc>().add(FetchFavouritelistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite App',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          BlocBuilder<FavouriteListBloc, FavouriteListState>(
            builder: (context, state) {
              return Visibility(
                visible: state.temfavouriteList.isNotEmpty ? true : false,
                child: IconButton(
                    onPressed: () {
                      context.read<FavouriteListBloc>().add(DeleteFavouritelistEvent());
                    },
                    icon: const Icon(Icons.delete, color: Colors.black)),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<FavouriteListBloc, FavouriteListState>(builder: (context, state) {
        switch (state.staTus) {
          case status.laoding:
            return const CircularProgressIndicator();
          case status.failure:
            return const Text('error');
          case status.succcess:
            return ListView.builder(
                itemCount: state.favouriteList.length,
                itemBuilder: (context, index) {
                  final item = state.favouriteList[index];
                  return Card(
                    child: ListTile(
                        leading: Checkbox(
                            value: state.temfavouriteList.contains(item) ? true : false,
                            onChanged: (value) {
                              if (value!) {
                                context.read<FavouriteListBloc>().add(SelectFavouritelistEvent(item: item));
                              } else {
                                context.read<FavouriteListBloc>().add(UnSelectFavouritelistEvent(item: item));
                              }
                            }),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                            onPressed: () {
                              FavouriteListModel itemModel = FavouriteListModel(Id: item.Id, value: item.value, isFavourite: item.isFavourite ? false : true);
                              context.read<FavouriteListBloc>().add(AddFavouritelistEvent(item: itemModel));
                            },
                            icon: item.isFavourite ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_outline))),
                  );
                });
        }
      }),
    );
  }
}

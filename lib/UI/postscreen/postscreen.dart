import 'package:blflutter/bloc/Post_Screen/Post_screen_events.dart';
import 'package:blflutter/bloc/Post_Screen/post_screen_bloc.dart';
import 'package:blflutter/bloc/Post_Screen/post_screen_states.dart';
import 'package:blflutter/utils/enums.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostScreenBloc>().add(FetchPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('bui');
    }
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PostScreenBloc, PostScreenState>(builder: ((context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PostStatus.failuer:
            return Text(state.message.toString());
          case PostStatus.success:
            if (kDebugMode) {
              print('builoo');
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'Search', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    onChanged: (filtertext) {
                      context.read<PostScreenBloc>().add(FilterListEvent(filtertext));
                    },
                  ),
                ),
                Expanded(
                  child: state.searchmessage.isNotEmpty
                      ? Center(child: Text(state.searchmessage.toString()))
                      : ListView.builder(
                          itemCount: state.tempostList.isEmpty ? state.postList.length : state.tempostList.length,
                          itemBuilder: (context, index) {
                            if (state.tempostList.isEmpty) {
                              final item = state.postList[index];

                              return Card(child: ListTile(title: Text(state.postList[index].email.toString()), subtitle: Text(item.body.toString())));
                            } else {
                              final item = state.tempostList[index];

                              return Card(child: ListTile(title: Text(item.email.toString()), subtitle: Text(item.body.toString())));
                            }
                          }),
                ),
              ],
            );

          // default:
        }
      })),
    );
  }
}

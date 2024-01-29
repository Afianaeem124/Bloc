import 'package:blflutter/Repositry/fav_list_repo.dart';
import 'package:blflutter/UI/postscreen/postscreen.dart';
import 'package:blflutter/bloc/Post_Screen/post_screen_bloc.dart';
import 'package:blflutter/bloc/counter/counter_bloc.dart';
import 'package:blflutter/bloc/fav_list.dart/fav_list_bloc.dart';
import 'package:blflutter/bloc/imagepicker/bloc/imagepicker_bloc.dart';
import 'package:blflutter/bloc/switch/switch_bloc.dart';
import 'package:blflutter/bloc/todo/todoBloc.dart';
import 'package:blflutter/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SwitchBloc>(create: (_) => SwitchBloc()),
        BlocProvider<CounterBloc>(create: (_) => CounterBloc()),
        BlocProvider<TodoBloc>(create: (_) => TodoBloc()),
        BlocProvider<PostScreenBloc>(create: (_) => PostScreenBloc()),
        BlocProvider<FavouriteListBloc>(create: (_) => FavouriteListBloc(FavouriteRepository())),
        BlocProvider<ImagepickerBloc>(create: (_) => ImagepickerBloc(ImagePickerUtils())),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: const TextTheme(bodyLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const PostScreen()),
    );
  }
}

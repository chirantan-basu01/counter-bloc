import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:counter_bloc/counter_bloc/counter_bloc.dart';
import 'package:counter_bloc/counter_bloc/counter_event.dart';
import 'package:counter_bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_bloc/color_bloc.dart';
import 'color_bloc/color_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text("Counter Bloc"),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          BlocBuilder<ColorBloc, ColorState>(
            builder: (context, state) {
              return Container(
                color: state.color,
                width: 200,
                height: 200,
              );
            },
          ),

          const SizedBox(height: 10),

          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 35),
              );
            },
          ),

          // BlocSelector<CounterBloc, CounterState, bool>(
          //   selector: (state) => state.counter >= 3 ? true : false,
          //   builder: (context, state) {
          //     return Center(
          //       child: Container(
          //         color: state ? Colors.green : Colors.red,
          //         width: 200,
          //         height: 200,
          //       ),
          //     );
          //   },
          // ),

          // BlocBuilder<CounterBloc, CounterState>(
          //   buildWhen: (previous, current) {
          //     return current.counter >= 5;
          //   },
          //   builder: (context, state) {
          //     return Text(
          //       state.counter.toString(),
          //       style: const TextStyle(fontSize: 35),
          //     );
          //   },
          // ),

          // BlocConsumer<CounterBloc, CounterState>(builder: (context, state) {
          //   return Text(
          //     state.counter.toString(),
          //     style: const TextStyle(fontSize: 35),
          //   );
          // }, listener: (context, state) {
          //   if (state.counter >= 5) {
          //     final snackBar = SnackBar(
          //       /// need to set following properties for best effect of awesome_snackbar_content
          //       elevation: 0,
          //       behavior: SnackBarBehavior.floating,
          //       backgroundColor: Colors.transparent,
          //       content: AwesomeSnackbarContent(
          //         title: 'Working !!',
          //         message: 'This is an example of Bloc Listener',
          //
          //         /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          //         contentType: ContentType.success,
          //       ),
          //     );
          //
          //     ScaffoldMessenger.of(context)
          //       ..hideCurrentSnackBar()
          //       ..showSnackBar(snackBar);
          //   }
          // }),

          // BlocListener<CounterBloc, CounterState>(
          //   listenWhen: (previous,current) => true,
          //   listener: (context, state) {
          //     if (state.counter >= 5) {
          //       final snackBar = SnackBar(
          //         /// need to set following properties for best effect of awesome_snackbar_content
          //         elevation: 0,
          //         behavior: SnackBarBehavior.floating,
          //         backgroundColor: Colors.transparent,
          //         content: AwesomeSnackbarContent(
          //           title: 'Working !!',
          //           message: 'This is an example of Bloc Listener',
          //
          //           /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          //           contentType: ContentType.success,
          //         ),
          //       );
          //
          //       ScaffoldMessenger.of(context)
          //         ..hideCurrentSnackBar()
          //         ..showSnackBar(snackBar);
          //     }
          //   },
          //   child: const Text("Bloc Listener"),
          // ),

          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncrementEvent());
                  context.read<ColorBloc>().add(CounterIncrementEvent());
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecrementEvent());
                  context.read<ColorBloc>().add(CounterDecrementEvent());
                },
                child: const Icon(Icons.remove),
              )
            ],
          ),
        ],
      ),
    );
  }
}

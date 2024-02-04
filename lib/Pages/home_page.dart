import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorial/Blocs/internet_bloc/internet_bloc.dart';
import 'package:flutter_block_tutorial/Blocs/internet_bloc/internet_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        // bloc consumer is combination of listener and builder
        child: BlocConsumer<InternetBloc, InternetState>(
          // listener checks the state in background doesn't build any ui
          listener: (context, state) {
            if(state is InternetGainedState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Center(child: Text("Internet Connected!")),
                backgroundColor: Colors.green
                )
              );
            }else if(state is InternetLostState){
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Center(child: Text("Internet Lost!")),
                      backgroundColor: Colors.red
                  )
              );
            }
          },
          // builder is used to build ui that is to be displayed on the screen
          builder: (context, state) {
            if(state is InternetGainedState){
              return const Text("Connected");
            }else if(state is InternetLostState){
              return const Text("Not Connected");
            }else{
              return const Text("Loading....");
            }
          },
        ),
        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //     if(state is InternetGainedState){
        //       return const Text("Connected");
        //     }else if(state is InternetLostState){
        //       return const Text("Not Connected");
        //     }else{
        //       return const Text("Loading....");
        //     }
        //   },
        // ),
      )),
    );
  }
}

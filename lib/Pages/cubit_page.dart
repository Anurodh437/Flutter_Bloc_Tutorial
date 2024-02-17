import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorial/Cubit/internet_cubit.dart';

class CubitPage extends StatelessWidget {
  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        // bloc consumer is combination of listener and builder
        child: BlocConsumer<InternetCubit, InternetState>(
          // listener checks the state in background doesn't build any ui
          listener: (context, state) {
            if(state == InternetState.Gained){
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Center(child: Text("Internet Connected!")),
                      backgroundColor: Colors.green
                  )
              );
            }else if(state == InternetState.Lost){
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Center(child: Text("Internet Lost!")),
                      backgroundColor: Colors.red
                  )
              );
            }
          },
          // builder is used to build ui that is to be displayed on the screen
          builder: (context, state) {
            if(state == InternetState.Gained){
              return const Text("Connected");
            }else if(state == InternetState.Lost){
              return const Text("Not Connected");
            }else{
              return const Text("Loading....");
            }
          },
        ),
        // bloc builder is used to build ui
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

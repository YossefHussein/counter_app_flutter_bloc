import 'package:counter_app_flutter_bloc/bloc/cubit.dart';
import 'package:counter_app_flutter_bloc/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  // this is mean run my app
  runApp(const AppCounter());
}

class AppCounter extends StatelessWidget {
  const AppCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('counter is : ${AppCubit.get(context).counter}'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Click on any button to test counter'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            AppCubit.get(context).plus();
                          },
                          child: const Text('plus'),
                        ),
                        Text(
                          '${AppCubit.get(context).counter}',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            AppCubit.get(context).minus();
                            AppCubit.get(context).removeZeroError();
                          },
                          child: const Text('minus'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

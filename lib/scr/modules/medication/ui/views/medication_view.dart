import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubits.dart';
import '../stores/stores.dart';

class MedicationView extends StatefulWidget {
  const MedicationView({super.key});

  @override
  State<MedicationView> createState() => _MedicationViewState();
}

class _MedicationViewState extends State<MedicationView> {
  late final MedicationCubit cubit;
  late final MedicationStore store;

  @override
  void initState() {
    super.initState();
    cubit = context.read()..getMedications();
    store = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicationCubit, MedicationState>(
      bloc: cubit,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is MedicationLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
            appBar: AppBar(
              title: const Text('Medicamentos'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/medication/form');
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                Text('Teste'),
              ],
            ));
      },
    );
  }
}

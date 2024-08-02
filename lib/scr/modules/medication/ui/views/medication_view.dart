import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/ui/theme/colors/colors.dart';
import '../../../../shared/ui/widgets/company_logo.dart';
import '../cubits/cubits.dart';
import '../stores/stores.dart';
import 'components/medication_listview.dart';
import 'components/register_medical_dialog.dart';

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
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (context) => RegisterMedicalDialog(cubit: cubit, store: store),
        ),
        label: const Text('Adicionar'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const CompanyLogo(),
            Expanded(
              child: BlocConsumer<MedicationCubit, MedicationState>(
                bloc: cubit,
                listener: (context, state) {
                  if (state is MedicationCreated) {
                    cubit.getMedications();
                    store.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Medicamento adicionado com sucesso!')),
                    );
                  } else if (state is MedicationDeleted) {
                    cubit.getMedications();
                    store.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Medicamento deletado com sucesso!')),
                    );
                  } else if (state is MedicationError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is MedicationLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is MedicationError) {
                    return Center(child: Text(state.message.message));
                  }

                  if (state is MedicationEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sentiment_satisfied_alt_outlined,
                            size: 100,
                            color: BrandColor.base,
                          ),
                          const SizedBox(height: 8),
                          const Text('Nenhum medicamento cadastrado'),
                        ],
                      ),
                    );
                  }

                  if (state is MedicationLoaded) {
                    return MedicationList(medications: state.medications, cubit: cubit);
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

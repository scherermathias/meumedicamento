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
      floatingActionButton: _buildFloatingActionButton(),
      body: SafeArea(
        child: Column(
          children: [
            const CompanyLogo(),
            Expanded(child: _buildMedicationListView()),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () => _showRegisterDialog(context),
      label: const Text('Adicionar'),
    );
  }

  void _showRegisterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => RegisterMedicalDialog(cubit: cubit, store: store),
    );
  }

  Widget _buildMedicationListView() {
    return BlocConsumer<MedicationCubit, MedicationState>(
      bloc: cubit,
      listener: _handleStateChanges,
      builder: (context, state) {
        if (state is MedicationLoading) return const Center(child: CircularProgressIndicator());
        if (state is MedicationError) return _buildErrorView(state.message.message);
        if (state is MedicationEmpty) return _buildEmptyStateView();
        if (state is MedicationLoaded) {
          return MedicationList(medications: state.medications, cubit: cubit);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  void _handleStateChanges(BuildContext context, MedicationState state) {
    if (state is MedicationCreated || state is MedicationDeleted) {
      cubit.getMedications();
      store.clear();
      _showSuccessSnackBar(state is MedicationCreated
          ? 'Medicamento adicionado com sucesso!'
          : 'Medicamento deletado com sucesso!');
    } else if (state is MedicationError) {
      _showErrorSnackBar(state.message.message);
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildErrorView(String message) {
    return Center(child: Text(message));
  }

  Widget _buildEmptyStateView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sentiment_satisfied_alt_outlined, size: 100, color: BrandColor.base),
          const SizedBox(height: 8),
          const Text('Nenhum medicamento cadastrado'),
        ],
      ),
    );
  }
}

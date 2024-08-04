import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../shared/extensions/extensions.dart';
import '../../cubits/cubits.dart';
import '../../stores/stores.dart';

class RegisterMedicalDialog extends StatefulWidget {
  final MedicationCubit cubit;
  final MedicationStore store;

  const RegisterMedicalDialog({super.key, required this.cubit, required this.store});

  @override
  State<RegisterMedicalDialog> createState() => _RegisterMedicalDialogState();
}

class _RegisterMedicalDialogState extends State<RegisterMedicalDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicationCubit, MedicationState>(
      bloc: widget.cubit,
      listener: _handleStateChanges,
      builder: (context, state) {
        final bool isLoading = state is MedicationLoading;
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: widget.store.formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLottieAnimation(),
                  _buildTitle(context),
                  const SizedBox(height: 15),
                  _buildNameField(),
                  const SizedBox(height: 15),
                  _buildDosageField(),
                  const SizedBox(height: 15),
                  _buildDateTimeSelector(),
                  const SizedBox(height: 25),
                  _buildSaveButton(isLoading),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLottieAnimation() {
    return Lottie.asset('assets/lotties/pill.json', height: 150, repeat: false);
  }

  Widget _buildTitle(BuildContext context) {
    return Text('Cadastrar Medicamento', style: Theme.of(context).textTheme.headlineMedium);
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: widget.store.nameController,
      decoration: const InputDecoration(labelText: 'Nome', hintText: 'Exemplo: Paracetamol'),
      validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
    );
  }

  Widget _buildDosageField() {
    return TextFormField(
      controller: widget.store.dosageController,
      decoration: const InputDecoration(labelText: 'Dosagem', hintText: 'Exemplo: 10mg'),
      validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
    );
  }

  Widget _buildDateTimeSelector() {
    return Row(
      children: [
        Expanded(
            child: Text(
                'Data e hora: ${widget.store.dateTime?.format() ?? 'Não definido'} às ${widget.store.dateTime?.formatHour() ?? 'Não definido'}')),
        const SizedBox(width: 15),
        ElevatedButton(
          onPressed: () => _selectDateTime(context),
          child: const Text('Selecionar'),
        ),
      ],
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    ).then(
      (selectedDate) async {
        if (selectedDate != null) {
          final selectedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

          if (mounted) {
            if (selectedTime != null) {
              setState(() {
                widget.store.dateTime = DateTime(
                  selectedDate.year,
                  selectedDate.month,
                  selectedDate.day,
                  selectedTime.hour,
                  selectedTime.minute,
                );
              });
            }
          }
        }
      },
    );
  }

  Widget _buildSaveButton(bool isLoading) {
    return ElevatedButton(
      onPressed: () async {
        if (_validateForm()) {
          await widget.store.save();
        }
      },
      child: isLoading
          ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator())
          : const Text('Salvar'),
    );
  }

  bool _validateForm() {
    if (!widget.store.formKey.currentState!.validate()) {
      return false;
    }
    if (widget.store.dateTime == null) {
      _showValidationError('Por favor, selecione a data e hora.');
      return false;
    }
    return true;
  }

  void _showValidationError(String message) {
    if (mounted) {
      // Check if the widget is still mounted
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  void _handleStateChanges(BuildContext context, MedicationState state) {
    if (state is MedicationCreated) {
      Navigator.of(context).pop();
    } else if (state is MedicationError) {
      _showValidationError(state.message.message);
    }
  }
}

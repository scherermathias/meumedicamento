import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../shared/extensions/extensions.dart';
import '../../cubits/cubits.dart';
import '../../stores/stores.dart';

class RegisterMedicalDialog extends StatefulWidget {
  final MedicationCubit cubit;
  final MedicationStore store;

  const RegisterMedicalDialog({
    super.key,
    required this.cubit,
    required this.store,
  });

  @override
  State<RegisterMedicalDialog> createState() => _RegisterMedicalDialogState();
}

class _RegisterMedicalDialogState extends State<RegisterMedicalDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicationCubit, MedicationState>(
      bloc: widget.cubit,
      listener: (context, state) {
        if (state is MedicationCreated) {
          Navigator.of(context).pop();
        }

        if (state is MedicationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final bool isLoading = state is MedicationLoading;

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: widget.store.formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/lotties/pill.json',
                    height: 150,
                    repeat: false,
                  ),
                  Text(
                    'Cadastrar Medicamento',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: widget.store.nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Exemplo: Paracetamol',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: widget.store.dosageController,
                    decoration:
                        const InputDecoration(labelText: 'Dosagem', hintText: 'Exemplo: 10mg'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Data e hora: ${widget.store.dateTime?.format() ?? 'Não definido'}\nàs ${widget.store.dateTime?.formatHour() ?? 'Não definido'} ',
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 30)),
                          );

                          if (selectedDate != null) {
                            final selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

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
                        },
                        child: const Text('Selecionar'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () async => await widget.store.save(),
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Salvar'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

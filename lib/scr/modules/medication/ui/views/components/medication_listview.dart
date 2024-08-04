import 'package:flutter/material.dart';

import '../../../../../shared/extensions/extensions.dart';
import '../../../data/models/models.dart';
import '../../cubits/cubits.dart';

class MedicationList extends StatelessWidget {
  final List<MedicationEntity> medications;
  final MedicationCubit cubit;

  const MedicationList({
    super.key,
    required this.medications,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: medications.length,
      itemBuilder: (context, index) {
        final medication = medications[index];

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/icons/pills.png',
              width: 40,
            ),
            title: Text('Nome: ${medication.name}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Dosagem: ${medication.dosage}'),
                Text('Data e hora: ${medication.dateTime.formatDateAndTime()}'),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _showDeleteConfirmationDialog(context, medication.id!),
            ),
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String medicationId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar exclusão'),
          content: const Text('Você tem certeza que deseja excluir este medicamento?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                cubit.deleteMedication(id: medicationId);
                Navigator.of(context).pop();
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_project/feaures/about_us/data/local/app_database.dart';
import 'package:logger/logger.dart';

class DatabaseTester extends StatelessWidget {
  final AppDatabase _db = AppDatabase();
  final Logger logger = Logger();

  DatabaseTester({super.key});

  Future<void> _insertDummyData(BuildContext context) async {
    try {
      final String id = "test_user_${DateTime.now().millisecondsSinceEpoch}";
      const bool accepted = true;
      final DateTime acceptedDate = DateTime.now();

      await _db.insertConsent(id, accepted, acceptedDate);

      if(!context.mounted) return;

      logger.i("Insertado: ID: $id, Aceptado: $accepted, Fecha: $acceptedDate");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Datos insertados con ID: $id")),
      );
    } catch (e) {
      logger.e("Error al insertar datos: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al insertar datos: $e")),
      );
    }
  }

  Future<void> _showDatabaseRecords(BuildContext context) async {
    try {
      final allRecords = await _db.getAllConsents();

      if(!context.mounted) return;

      logger.i("Registros recuperados: $allRecords");

      // Mostrar registros en un AlertDialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registros en la Base de Datos'),
            content: allRecords.isNotEmpty
                ? SizedBox(
                    height: 300,
                    child: ListView.separated(
                      itemCount: allRecords.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final record = allRecords[index];
                        return ListTile(
                          title: Text('ID: ${record['id']}'),
                          subtitle: Text(
                            'Aceptado: ${record['accepted'] == 1 ? 'Sí' : 'No'}\n'
                            'Fecha: ${record['acceptedDate']}',
                          ),
                        );
                      },
                    ),
                  )
                : const Center(child: Text('No hay registros en la base de datos')),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cerrar'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      logger.w("Error al obtener datos: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al obtener datos: $e")),
      );
    }
  }

  Future<void> _debugDatabase() async {
    // Este método imprime todos los registros directamente en la consola
    try {
      final allRecords = await _db.getAllConsents();
      logger.i("Registros actuales en la base de datos:");
      for (final record in allRecords) {
        logger.i(record);
      }
    } catch (e) {
      logger.e("Error al depurar la base de datos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Database Tester")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _insertDummyData(context),
              icon: const Icon(Icons.add),
              label: const Text("Insertar Datos de Ejemplo"),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _showDatabaseRecords(context),
              icon: const Icon(Icons.visibility),
              label: const Text("Ver Registros en la Base de Datos"),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _debugDatabase, // Imprimir directamente en la consola
              icon: const Icon(Icons.bug_report),
              label: const Text("Depurar Base de Datos"),
            ),
          ],
        ),
      ),
    );
  }
}

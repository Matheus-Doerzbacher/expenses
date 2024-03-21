import 'package:expenses/layers/domain/entities/expense_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpenseWidget extends StatefulWidget {
  const NewExpenseWidget({super.key});

  @override
  State<NewExpenseWidget> createState() => _NewExpenseWidgetState();
}

class _NewExpenseWidgetState extends State<NewExpenseWidget> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  CategoryEnum _selectCategory = CategoryEnum.travel;

  final formatter = DateFormat.yMd();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Titulo'),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true), // OR keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    label: Text('Valor'),
                    prefixText: 'R\$ ',
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate != null
                        ? formatter.format(_selectedDate!)
                        : 'Selecione uma data'),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectCategory,
                items: CategoryEnum.values.map(
                  (category) {
                    final nameCategory = category.name.toUpperCase();
                    String nameDropdown = '';
                    if (nameCategory == "FOOD") {
                      nameDropdown = "Comida";
                    } else if (nameCategory == "TRAVEL") {
                      nameDropdown = "Viagem";
                    } else if (nameCategory == "LEISURE") {
                      nameDropdown = "Lazer";
                    } else {
                      nameDropdown = "Trabalho";
                    }
                    return DropdownMenuItem(
                      value: category,
                      child: Text(nameDropdown),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _selectCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Voltar'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (kDebugMode) {
                    print(_titleController.text);
                    print(_amountController.text);
                  }
                  _titleController.clear();
                },
                child: const Text('Salvar Tarefa'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_crud/models/item.dart';

class ItemFormPage extends StatefulWidget {
  final Item? item;
  final Function(Item) onSave;

  ItemFormPage({this.item, required this.onSave});

  @override
  _ItemFormPageState createState() => _ItemFormPageState();
}

class _ItemFormPageState extends State<ItemFormPage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _nameController.text = widget.item!.name;
      _descriptionController.text = widget.item!.description;
    }
  }

  void _saveItem() {
    final newItem = Item(
      id: widget.item?.id,
      name: _nameController.text,
      description: _descriptionController.text,
    );
    widget.onSave(newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item == null ? 'Add Item' : 'Edit Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Item Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveItem,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

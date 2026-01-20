import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'models/note.dart';

class NoteEditorView extends StatefulWidget {
  final Note? note; // If null, create new. If exists, edit.

  const NoteEditorView({super.key, this.note});

  @override
  State<NoteEditorView> createState() => _NoteEditorViewState();
}

class _NoteEditorViewState extends State<NoteEditorView> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _courseController = TextEditingController();
  final _semesterController = TextEditingController();
  final _tagController = TextEditingController();
  
  List<String> _tags = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content ?? '';
      _courseController.text = widget.note!.course ?? '';
      _semesterController.text = widget.note!.semester ?? '';
      _tags = List.from(widget.note!.tags);
    }
  }

  Future<void> _saveNote() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Title is required")));
      return;
    }

    setState(() => _isLoading = true);
    final user = Supabase.instance.client.auth.currentUser;
    
    final data = {
      'user_id': user!.id,
      'title': title,
      'content': _contentController.text.trim(),
      'course': _courseController.text.trim().isEmpty ? null : _courseController.text.trim(),
      'semester': _semesterController.text.trim().isEmpty ? null : _semesterController.text.trim(),
      'tags': _tags,
      'updated_at': DateTime.now().toIso8601String(),
    };

    try {
      if (widget.note == null) {
        // Create
        await Supabase.instance.client.from('notes').insert(data);
      } else {
        // Update
        await Supabase.instance.client.from('notes').update(data).eq('id', widget.note!.id);
      }
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _deleteNote() async {
    if (widget.note == null) return;
    
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Note?"),
        content: const Text("This action cannot be undone."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancel")),
          TextButton(onPressed: () => Navigator.pop(context, true), style: TextButton.styleFrom(foregroundColor: Colors.red), child: const Text("Delete")),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => _isLoading = true);
      try {
        await Supabase.instance.client.from('notes').delete().eq('id', widget.note!.id);
        if (mounted) Navigator.pop(context);
      } catch (e) {
        if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  void _addTag() {
    final tag = _tagController.text.trim();
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
        _tagController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? "New Note" : "Edit Note"),
        actions: [
          if (widget.note != null)
            IconButton(icon: const Icon(Icons.delete_outline, color: Colors.red), onPressed: _deleteNote),
          IconButton(icon: const Icon(Icons.check), onPressed: _saveNote),
        ],
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator()) 
        : SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "Note Title",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: false,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _courseController,
                        decoration: const InputDecoration(labelText: "Course (e.g. CS101)"),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: _semesterController,
                        decoration: const InputDecoration(labelText: "Semester (e.g. Fall 2024)"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Tags Input
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _tagController,
                        decoration: const InputDecoration(
                          labelText: "Add Tags",
                          prefixIcon: Icon(Icons.tag),
                        ),
                        onSubmitted: (_) => _addTag(),
                      ),
                    ),
                    IconButton(icon: const Icon(Icons.add), onPressed: _addTag),
                  ],
                ),
                if (_tags.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 8,
                      children: _tags.map((tag) => Chip(
                        label: Text(tag),
                        onDeleted: () => setState(() => _tags.remove(tag)),
                      )).toList(),
                    ),
                  ),
                ],

                const SizedBox(height: 16),
                const Divider(),
                
                TextField(
                  controller: _contentController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: "Start typing...",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: false,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

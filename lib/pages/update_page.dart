import 'package:drift_train/drift/drift_helper.dart';
import 'package:drift_train/drift/memo_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpdatePage extends StatelessWidget {
  UpdatePage({Key? key, required this.memo}) : super(key: key);

  final Memo memo;
  final _formKey = GlobalKey<FormState>();

  final MemoRepository _memoRepository = MemoRepository();

  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _categoryController.text = memo.folder ?? "";
    _contentController.text = memo.content;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: _contentController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "input Memo please";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      label: Text("Input Memo"),
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(
                      label: Text("Input Category"),
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _memoRepository.updateMemo(Memo(
                            id: memo.id,
                            content: _contentController.text,
                            folder: _categoryController.text));
                      }

                      context.pop();
                    },
                    child: const Text("수정하기")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

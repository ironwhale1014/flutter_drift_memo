import 'package:drift_train/componets/memo_tile.dart';
import 'package:drift_train/drift/drift_helper.dart';
import 'package:drift_train/drift/memo_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasePage extends StatelessWidget {
  BasePage({Key? key, this.folder}) : super(key: key);

  String? folder;

  final _formKey = GlobalKey<FormState>();

  final MemoRepository _memoRepository = MemoRepository();

  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      saveMemo();
                    },
                    child: const Text("Save")),
                Expanded(
                  child: StreamBuilder<List<Memo>>(
                      stream: (folder == null)
                          ? _memoRepository.readAll()
                          : _memoRepository.readMemoWithCategory(folder!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Memo> memos1 = snapshot.data!;
                          return ListView.builder(
                              itemCount: memos1.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    context.pushNamed("update",
                                        extra: memos1[index]);
                                  },
                                  child: MemoTile(
                                    memo: memos1[index],
                                    memoRepository: _memoRepository,
                                  ),
                                );
                              });
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  void saveMemo() {
    if (_formKey.currentState!.validate()) {
      if (_categoryController.text.isEmpty) {
        _memoRepository.saveMemo(
          content: _contentController.text,
        );
      } else {
        _memoRepository.saveMemo(
            content: _contentController.text,
            category: _categoryController.text);
      }
      _contentController.clear();
      _categoryController.clear();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/add_note_controller.dart';
import 'package:notes/view/widgets/custom_text_form_field.dart';

class AddNoteView extends StatelessWidget {
  static const String id = '/AddNoteView';
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddNoteControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Note'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: SingleChildScrollView(
              child: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    CustomTextFormField(
                        labeltext: 'Title',
                        controller: controller.title,
                        validator: controller.validate),
                    CustomTextFormField(
                        labeltext: 'content',
                        controller: controller.content,
                        maxlines: 6,
                        validator: controller.validate),
                    CustomTextFormField(
                      labeltext: 'Tags',
                      controller: controller.tags,
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                              onPressed: controller.addNote,
                              icon: const Icon(Icons.save),
                              label: const Text('Add')),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

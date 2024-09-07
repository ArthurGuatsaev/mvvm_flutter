import 'package:flutter/material.dart';

class SignTextField extends StatelessWidget {
  final String? hint;
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? validate;
  final TextEditingController controller;
  const SignTextField({
    super.key,
    required this.formKey,
    required this.controller,
    this.hint,
    this.validate,
  });
  bool validateForm(GlobalKey<FormState>? fromKey) =>
      fromKey?.currentState?.validate() ?? false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // размер с учетом места для показа сообщения ошибки
      child: Column(
        children: [
          Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              validator: validate,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              onChanged: (_) => validateForm(formKey),
              decoration: InputDecoration(
                  hintText: hint,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.blue))),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../view_model/login_view_model.dart';
import '../../sign_textview/sign_texfield.dart';

class AppLogin extends StatefulWidget {
  final BaseLoginPageViewModel viewModel;
  const AppLogin({super.key, required this.viewModel});

  @override
  State<AppLogin> createState() => _AppLoginState();
}

class _AppLoginState extends State<AppLogin> {
  late final nameController = TextEditingController();
  late final pswController = TextEditingController();

  late final _formKeyName = GlobalKey<FormState>();
  late final _formKeyEmail = GlobalKey<FormState>();

  /// проверка на валидность веденных данных во всех полях формы
  bool validateForm(GlobalKey<FormState> fromKey) =>
      fromKey.currentState?.validate() ?? false;

  /// проверка на готовность всех форм для дальнейшего использования
  bool validateAll() =>
      validateForm(_formKeyName) && validateForm(_formKeyEmail) ? true : false;

  @override
  Widget build(BuildContext context) {
    final isLoading = widget.viewModel.authBlock.state.isLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignTextField(
              formKey: _formKeyName,
              controller: nameController,
              hint: 'Enter your name',
              validate: (p0) => (p0 == null || p0.length < 4) ? 'ferror' : null,
            ),
            SignTextField(
              formKey: _formKeyEmail,
              controller: pswController,
              hint: 'Enter your password',
              validate: (p0) => (p0 == null || p0.length < 4) ? 'error' : null,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        if (!validateAll()) return;
                        widget.viewModel
                            .signUp(nameController.text, pswController.text);
                      },
                child: isLoading
                    ? const CircularProgressIndicator.adaptive()
                    : const Text('Enter')),
          ],
        ),
      ),
    );
  }
}

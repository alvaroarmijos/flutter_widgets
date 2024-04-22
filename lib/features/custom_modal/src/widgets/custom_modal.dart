import 'package:flutter/material.dart';
import 'package:lalo_dart_general_examples/features/custom_modal/widgets.dart';

enum ModalOptions {
  all,
  privateKey,
  recoveryPhrase,
  removeWallet,
}

class CustomModal extends StatefulWidget {
  const CustomModal({super.key});

  @override
  State<CustomModal> createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  ModalOptions modalOptions = ModalOptions.all;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return AnimatedContainer(
      height: modalOptions == ModalOptions.all ? 300 : 370,
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: 50),
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                switch (modalOptions) {
                  ModalOptions.all => Text(
                      'Options',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ModalOptions.privateKey =>
                    const Icon(Icons.lock_clock_outlined),
                  ModalOptions.recoveryPhrase => Container(),
                  ModalOptions.removeWallet => Container(),
                },
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            switch (modalOptions) {
              ModalOptions.all => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ModalListTile(
                      title: const Text('View Private Key'),
                      leading: const Icon(Icons.lock_clock_outlined),
                      onTap: () => setState(() {
                        modalOptions = ModalOptions.privateKey;
                      }),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const ModalListTile(
                      title: Text('View Recovery Phrase'),
                      leading: Icon(Icons.view_comfy_alt_outlined),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ModalListTile(
                      title: const Text(
                        'Remove Wallet',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      leading: const Icon(
                        Icons.warning_amber_outlined,
                        color: Colors.red,
                      ),
                      backgroundColor: Colors.red.withOpacity(0.1),
                    ),
                  ],
                ),
              ModalOptions.privateKey => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Private Key',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Your Private Key is the key used to back up your wallet. Keep it secret and secure at all times.',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const LabelItem(
                      label: 'Keep your private key safe',
                      icon: Icons.security,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const LabelItem(
                      label: 'Don\'t share it with anyone else',
                      icon: Icons.sms_outlined,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const LabelItem(
                      label: 'If you lose it we can\'t recover it',
                      icon: Icons.do_disturb_alt_outlined,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => setState(() {
                            modalOptions = ModalOptions.all;
                          }),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              theme.colorScheme.primary,
                            ),
                          ),
                          icon: const Icon(
                            Icons.lock_open_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () => setState(() {
                            modalOptions = ModalOptions.all;
                          }),
                          label: const Text(
                            'Reveal',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ModalOptions.recoveryPhrase => Container(),
              ModalOptions.removeWallet => Container(),
            }
          ],
        ),
      ),
    );
  }
}

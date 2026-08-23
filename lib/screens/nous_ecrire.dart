import 'package:app_multi_screens/utilities/Responsive.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NousEcrire extends StatefulWidget {
  const NousEcrire({super.key});

  @override
  State<NousEcrire> createState() => _NousEcrireScreenState();
}

class _NousEcrireScreenState extends State<NousEcrire> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController =
  TextEditingController();

  final TextEditingController _emailController =
  TextEditingController();

  final TextEditingController _subjectController =
  TextEditingController();

  final TextEditingController _messageController =
  TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();

    super.dispose();
  }

  void _sendMessage() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Votre message a été envoyé avec succès.',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );

    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nous écrire'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = Responsive().isTablet(context);

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 100 : 20,
              vertical: 25,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ------------------------------------------------
                  // HEADER
                  // ------------------------------------------------

                  Center(
                    child: Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.mail_outline,
                        size: 45,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Text(
                      'Nous écrire',
                      style:
                      theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Center(
                    child: Text(
                      'Une question, une suggestion ou besoin '
                          'd’aide ? Écrivez-nous.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color:
                        theme.colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ------------------------------------------------
                  // NOM
                  // ------------------------------------------------

                  Text(
                    'Nom complet',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Entrez votre nom',
                      prefixIcon: const Icon(
                        Icons.person_outline,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(14),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Veuillez entrer votre nom';
                      }

                      if (value.trim().length < 2) {
                        return 'Le nom doit contenir au moins 2 caractères';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // ------------------------------------------------
                  // EMAIL
                  // ------------------------------------------------

                  Text(
                    'Adresse email',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller: _emailController,
                    keyboardType:
                    TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'exemple@email.com',
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(14),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Veuillez entrer votre email';
                      }

                      final emailRegex = RegExp(
                        r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                      );

                      if (!emailRegex.hasMatch(
                        value.trim(),
                      )) {
                        return 'Veuillez entrer une adresse email valide';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // ------------------------------------------------
                  // SUJET
                  // ------------------------------------------------

                  Text(
                    'Sujet',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller: _subjectController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Objet de votre message',
                      prefixIcon: const Icon(
                        Icons.subject,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(14),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Veuillez indiquer le sujet';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // ------------------------------------------------
                  // MESSAGE
                  // ------------------------------------------------

                  Text(
                    'Message',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller: _messageController,
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText:
                      'Écrivez votre message ici...',
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(
                          bottom: 90,
                        ),
                        child: Icon(
                          Icons.message_outlined,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(14),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Veuillez écrire votre message';
                      }

                      if (value.trim().length < 10) {
                        return 'Le message doit contenir au moins 10 caractères';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  // ------------------------------------------------
                  // BOUTON ENVOYER
                  // ------------------------------------------------

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: _sendMessage,
                      icon: const Icon(
                        Icons.send,
                      ),
                      label: const Text(
                        'Envoyer le message',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ------------------------------------------------
                  // INFORMATIONS
                  // ------------------------------------------------

                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [

                          ListTile(
                            leading: Icon(
                              Icons.email_outlined,
                            ),
                            title: Text('Email'),
                            subtitle: Text(
                              'contact@myachat.com',
                            ),
                          ),

                          Divider(),

                          ListTile(
                            leading: Icon(
                              Icons.phone_outlined,
                            ),
                            title: Text('Téléphone'),
                            subtitle: Text(
                              '+226 00 00 00 00',
                            ),
                          ),

                          Divider(),

                          ListTile(
                            leading: Icon(
                              Icons.location_on_outlined,
                            ),
                            title: Text('Adresse'),
                            subtitle: Text(
                              'Ouagadougou, Burkina Faso',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
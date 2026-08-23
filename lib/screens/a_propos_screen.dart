import 'package:app_multi_screens/utilities/Responsive.dart';
import 'package:app_multi_screens/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AProposScreen extends StatelessWidget {
  const AProposScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text('À propos'),
        centerTitle: true,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = Responsive().isTablet(context);

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 80 : Responsive().isDeskTop(context)?100:20,
              vertical: 24,
            ),
            child: Column(
              children: [

                // LOGO
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                        color: Colors.black.withOpacity(0.15),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: theme.colorScheme.primary,
                          child: const Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                            size: 55,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // NOM APPLICATION
                Text(
                  'MYACHAT',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Votre expérience shopping, simplement.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: 30),

                // PRESENTATION
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: theme.colorScheme.primary,
                              size: 28,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'À propos de nous',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        Text(
                          'MYACHAT est une application moderne qui vous '
                              'permet de découvrir facilement vos produits, '
                              'consulter leurs informations et profiter '
                              'd’une expérience d’achat simple et agréable.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // NOS SERVICES
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Icon(
                              Icons.auto_awesome,
                              color: theme.colorScheme.primary,
                              size: 28,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Nos avantages',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor:
                            theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.flash_on,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          title: const Text(
                            'Rapide',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Une navigation fluide et rapide.',
                          ),
                        ),

                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor:
                            theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.search,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          title: const Text(
                            'Simple',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Trouvez facilement les produits recherchés.',
                          ),
                        ),

                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor:
                            theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.favorite,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          title: const Text(
                            'Personnalisé',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Une expérience pensée pour vous.',
                          ),
                        ),

                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor:
                            theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.security,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          title: const Text(
                            'Fiable',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Une application conçue avec soin.',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // STATISTIQUES
                GridView.count(
                  crossAxisCount: isTablet ? 3 : 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  children: [
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: theme.colorScheme.primary,
                            size: 30,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '100+',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Produits'),
                        ],
                      ),
                    ),

                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people,
                            color: theme.colorScheme.primary,
                            size: 30,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '1K+',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Utilisateurs'),
                        ],
                      ),
                    ),

                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: theme.colorScheme.primary,
                            size: 30,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '4.9',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Note'),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // CONTACT
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [

                      const ListTile(
                        leading: Icon(Icons.email_outlined),
                        title: Text('Email'),
                        subtitle: Text('contact@myachat.com'),
                      ),

                      const Divider(height: 1),

                      const ListTile(
                        leading: Icon(Icons.phone_outlined),
                        title: Text('Téléphone'),
                        subtitle: Text('+226 00 00 00 00'),
                      ),

                      const Divider(height: 1),

                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('Site web'),
                        subtitle: const Text('www.myachat.com'),
                        trailing: const Icon(Icons.open_in_new),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // VERSION
                Text(
                  'MYACHAT',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'Version 1.0.0',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  '© 2026 MYACHAT',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton( onPressed: () { context.pushNamed("nous_ecrire"); }, child: Text("Nous ecrire"),)
              ],
            ),
          );
        },
      ),
    );
  }
}
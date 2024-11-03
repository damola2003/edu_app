
import 'package:education_app/theme_color.dart/theme_provider.dart';
import 'package:education_app/utils/constants.dart';
import 'package:education_app/utils/settings_tils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 14, right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    const Text(
                      "Settings",
                      style: Constants.mediumHeaderStyle,
                    ),
                    Constants.appLogo
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // if(Theme == lightTheme)

                  Text("Dark Mode"),
                  InkWell(
                    onTap: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                    child: Icon(Icons.light_mode),
                  ),
                ],
              ),
              SettingsUtils(
                text: "Help",
                icon: Icons.help_outline_outlined,
                onTap: () {},
              ),
              SettingsUtils(
                text: "Share",
                icon: Icons.share,
                onTap: () {},
              ),
              SettingsUtils(
                text: "English",
                icon: Icons.web_asset,
                onTap: () {},
              ),
              const SizedBox(height: 50),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

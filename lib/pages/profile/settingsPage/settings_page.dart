import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/utils/themes/theme_manager.dart';
import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/constants.dart';
import '../components/profile_menu_item.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {

  static const keyLanguage = 'key-language';

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    bool light1 = true;

    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        // Thumb icon when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.check);
        }
        return const Icon(Icons.close);
      },
    );

    final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'settings'.tr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                    isDarkMode ? Icons.sunny : Icons.nightlight_round_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                //  Menu
                PopupMenuButton(
                  child: Row(children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      // padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blueAccent.withOpacity(0.3),
                      ),
                      child: Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'language'.tr,
                      style: Theme.of(context).textTheme.headlineMedium,
                      // TextStyle(
                      //     fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
                    ),
                  ]),
                  position: PopupMenuPosition.under,
                  splashRadius: 30,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png"),
                            width: 40,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('english'.tr),
                        ],
                      ),
                      value: 'en',
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/1200px-Flag_of_Vietnam.svg.png"),
                            width: 40,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('vietnamese'.tr),
                        ],
                      ),
                      value: 'vi',
                    ),
                  ],
                  onSelected: (value) {
                    var locale = Locale(value.toString());
                    Get.updateLocale(locale);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        // padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blueAccent.withOpacity(0.3),
                        ),
                        child: Icon(
                          Icons.nightlight,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'night_mode'.tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ]),
                    Switch(
                      // thumbIcon: thumbIcon,
                      value: ThemeManager().isDark,
                      onChanged: (bool value) {
                        ThemeManager().isDark = value;
                      },

                    ),
                  ],
                ),

              ],
            ),
          ),
        ));
  }
}

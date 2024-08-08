import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:soko_aerial_interns_app/utils/app_theme.dart';
import 'package:soko_aerial_interns_app/widgets/reusable_widgets/custom_bottom_navigation_bar.dart';
import '../../data/repositories/user_repository.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfileScreen extends StatefulWidget {
  final UserRepository userRepository;

  const ProfileScreen({super.key, required this.userRepository});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkModeEnabled = false;
  bool areNotificationsEnabled = false;
  String userName = 'Jane Doe';
  String userEmail = 'janedoe23@email.com';

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userName = user.displayName ?? 'User';
        userEmail = user.email ?? 'user@example.com';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, '/home'),
        ),
        title: const Text('Profile', style: AppTheme.headerTextStyle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildProfileHeader(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: ListView(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                children: [
                  _buildSettingsItem('Privacy settings', onTap: () {}),
                  const SizedBox(height: 15),
                  _buildTextItem('About Soko Aerial'),
                  const SizedBox(height: 10),
                  _buildSwitchItem('Dark mode', isDarkModeEnabled, (value) {
                    setState(() => isDarkModeEnabled = value);
                  }),
                  const SizedBox(height: 10),
                  _buildSwitchItem('Notifications', areNotificationsEnabled,
                      (value) {
                    setState(() => areNotificationsEnabled = value);
                  }),
                  const SizedBox(height: 15),
                  _buildSettingsItem('Help center', onTap: () {}),
                  const SizedBox(height: 20),
                  _buildSettingsItem('Privacy policy', onTap: () {}),
                  const SizedBox(height: 60),
                  _buildLogoutButton(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2), // where 2 is for Profile
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/mentor.jpeg'),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to camera/image selection screen
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.camera_alt,
                      size: 25, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            userName,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            userEmail,
            style: AppTheme.subHeaderTextStyle,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Intern',
                style: AppTheme.subHeaderTextStyle,
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                onPressed: () {
                  // Navigate to edit portfolio screen
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(String title, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTheme.titleStyle),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget _buildTextItem(String title) {
    return GestureDetector(
      child: Text(title, style: AppTheme.titleStyle),
      onTap: () {
        _launchURL('https://www.sokoaerial.com');
      },
    );
  }
    void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildSwitchItem(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTheme.titleStyle),
        CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: AppTheme.primaryColor,
        ),
      ],
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: const Text(
        'Logout',
        style: TextStyle(
            color: AppTheme.primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

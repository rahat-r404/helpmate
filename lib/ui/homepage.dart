import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:help_app/ui/head_drawer.dart';
import 'package:help_app/ui/privacy_policy.dart';
import 'package:help_app/ui/send_feedback.dart';
import 'package:help_app/ui/settings.dart';
import 'package:help_app/ui/title_part.dart';

import 'contacts.dart';
import 'dashboard.dart';
import 'events.dart';
import 'notes.dart';
import 'notifications.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'HelpMate',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle_rounded))
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeadDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const GNav(
        rippleColor: Colors.lightGreenAccent,
        hoverColor: Colors.greenAccent,
        backgroundColor: Colors.white,
        color: Colors.black,
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 900),
        activeColor: Colors.white,
        tabBackgroundColor: Colors.green,
        gap: 8,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        tabs: [
          GButton(icon: Icons.home,
          text: 'Home',),
          GButton(icon: Icons.call,
          text: 'Call',),
          GButton(icon: Icons.search,
          text: 'Search',),
          GButton(icon: Icons.all_inbox,
          text: 'Inbox',),
        ],
      ),
      body: Column(
        children: const [PageTitle()],
      ),
    );
  }
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }
  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
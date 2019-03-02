import 'package:flutter/material.dart';
import '../pages/add_guest_page.dart';
import '../pages/home_page.dart';
import '../scoped_model/main.dart';
import 'package:scoped_model/scoped_model.dart';
import '../pages/auth_page.dart';
import '../pages/edit_vehicles_page.dart';
import '../pages/community_service_page.dart';
import '../pages/vehicle_log_page.dart';
import 'package:flutter/cupertino.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(
              "Trociety",
            ),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            title: Text("Home"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HomePage();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text("Edit My Vehicle(s)"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return EditVehiclesPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text("Add Guest Vehicle"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AddGuestPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text("Community Services"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return CommunityService();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text("Vehicle Log"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return VehicleLog();
                  },
                ),
              );
            },
          ),
          Container(
            child: ScopedModelDescendant(
              builder: (BuildContext context, Widget child, MainModel model) {
                return ListTile(
                  title: Text("Logout"),
                  onTap: () => model.signOut().then((_) {
                        return Navigator.pushReplacementNamed(context, "/");
                      }),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

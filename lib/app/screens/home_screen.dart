import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanber_flutter_ta/app/controllers/controllers.dart';
import 'package:sanber_flutter_ta/app/routes/app_routes.dart';
import 'package:sanber_flutter_ta/app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final contactC = Get.put(ContactController());
  final homeC = Get.put(HomeController());

  final authC = Get.find<AuthController>();

  @override
  void initState() {
    authC.getAllContact();
    super.initState();
    //YOUR CHANGE PAGE METHOD HERE
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          title: const Text(
            'iContact App',
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                homeC.showSideNav();
              },
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
          backgroundColor: Colors.redAccent[700],
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              bottom: 20,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                onChanged: (value) => authC.getAllContact(),
                controller: authC.searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  hintText: "Silahkan cari kontak disini...",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      // print(searchUserC.keySearchController.text.toString());
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.redAccent[700],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Obx(() {
              if (authC.listContact.length > 0) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: authC.listContact.length,
                  itemBuilder: (context, index) {
                    final data = authC.listContact.value[index];
                    return CardChat(
                      idContact: data.contactId,
                      title: data.nama,
                      subtitle: data.phone,
                      onTap: () {
                        homeC.showSideNav(isShow: false);
                        authC.getContactDetail(data.contactId);
                      },
                      onDel: () {
                        contactC.delContact(data.contactId);
                      },
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("Tidak ada kontak yang disimpan!"),
                );
              }
            }),
          ),
          Obx(() {
            if (homeC.isShowSideNav.value) {
              return Positioned(
                right: 0,
                child: SideNavPanel(),
              );
            }
            return Container();
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeC.showSideNav(isShow: false);
          Get.toNamed(Routes.CONTACT_FORM);
        },
        backgroundColor: Colors.redAccent[700],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SideNavPanel extends StatelessWidget {
  final homeC = Get.find<HomeController>();
  final authC = Get.find<AuthController>();

  SideNavPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(-1, 1), // Shadow position
          ),
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(1, 1), // Shadow position
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Column(
        children: [
          SideNavButton(
            text: "Profil",
            icon: Icons.person,
            onTap: () {
              homeC.showSideNav(isShow: false);
              Get.toNamed(Routes.PROFIL);
            },
          ),
          SideNavButton(
            text: "Logout",
            icon: Icons.logout_outlined,
            onTap: () {
              authC.logout();
            },
          ),
        ],
      ),
    );
  }
}

class SideNavButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function() onTap;

  const SideNavButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Center(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: Colors.redAccent[700],
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.redAccent[700],
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:orange_project/constant/constant.dart';

import '../widget/custom_icon_button.dart';
import '../widget/custom_option_profile.dart';
import '../widget/custom_text.dart';
import 'layout_view.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //back button and title
              Row(
                children: [
                  CustomIconButton(
                      icon: Icons.arrow_back_ios_new_outlined,
                      screen: LayoutView()
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomText(title: 'Profile', fontSize: 20,),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // image and name and id

              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/1.jpg'),
                      radius: 60,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(title: 'Abdo Al3nani', fontSize: 24,fontWeight: FontWeight.bold,),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(title: 'Account iD 1235652', fontSize: 16,color: secondColor,)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),


              //your options
              Column(
                children: [
                  CustomOptionProfile(
                title: 'Bank Details',
                icon: Icons.account_balance,

              ),
                  CustomOptionProfile(
                  title: 'Add child',
                    icon: Icons.add_reaction_outlined,

                  ),
                  CustomOptionProfile(
                    title: 'Notification',
                    icon: Icons.notifications_active_outlined,

                  ),
                  CustomOptionProfile(
                    title: 'Security',
                    icon: Icons.security,

                  ),
                  CustomOptionProfile(
                    title: 'Help & support',
                    icon: Icons.help_outline_outlined,

                  ),
                  CustomOptionProfile(
                    title: 'invite friend',
                    icon: Icons.share,

                  ),
                  SizedBox(
                    height: 20,
                  ),




                  //Logout
                  Row(
                    children: [
                      Icon(Icons.logout_outlined,color: secondColor,),
                      const SizedBox(
                        width: 20,
                      ),
                      CustomText(title: 'Logout', fontSize: 20,color: secondColor,)

                    ],
                  ),


                ],
              ),


            ],






          ),
        ),
      ),
    );
  }
}

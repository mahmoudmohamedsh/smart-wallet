import 'package:flutter/material.dart';
import 'package:orange_project/constant/constant.dart';

import '../widget/custom_button.dart';
import '../widget/custom_form_field.dart';
import '../widget/custom_icon_button.dart';
import '../widget/custom_text.dart';
import '../widget/custom_transfer_item.dart';
import 'layout_view.dart';
class TransferView extends StatefulWidget {
  const TransferView({Key? key}) : super(key: key);

  @override
  State<TransferView> createState() => _TransferViewState();
}

class _TransferViewState extends State<TransferView> {
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
                  CustomText(title: 'Transfer', fontSize: 20,),
                ],
              ),
              const SizedBox(
                height: 20,
              ),



              // card
              Container(
                width: double.infinity,
                height: 220,

                child: Image.asset('assets/images/c.png',fit: BoxFit.cover,),
              ),


              //send money to my cards
              CustomText(title: 'send money to my cards', fontSize: 20),
              const SizedBox(
                height: 20,
              ),
              CustomTransferItem(image: 'assets/images/m.png'),
              const SizedBox(
                height: 12,
              ),
              CustomTransferItem(image: 'assets/images/h.png'),
              const SizedBox(
                height: 12,
              ),
              CustomTransferItem(image: 'assets/images/v1.png'),
              const SizedBox(
                height: 12,
              ),
              CustomTransferItem(image: 'assets/images/o.png'),
              const SizedBox(
                height: 12,
              ),


              //send money to
              CustomText(title: 'send money to my cards', fontSize: 20),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                height: 81,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(58, 58, 58, 0.43),
                    borderRadius: BorderRadius.circular(8)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/1.jpg'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: '+ Add new child', fontSize: 16,color: secondColor,)
                        ],
                      ),
                      Spacer(),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),

                    ],
                  ),
                ),

              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                height: 81,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(58, 58, 58, 0.43),
                    borderRadius: BorderRadius.circular(8)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/1.jpg'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: 'Abdelhady Nabil', fontSize: 16,color: Colors.white,)
                        ],
                      ),
                      Spacer(),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),

                    ],
                  ),
                ),

              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                height: 81,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(58, 58, 58, 0.43),
                    borderRadius: BorderRadius.circular(8)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/1.jpg'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: 'Mahmoud mohamed', fontSize: 16,)
                        ],
                      ),
                      Spacer(),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),

                    ],
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

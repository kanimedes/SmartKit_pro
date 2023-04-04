import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/animation/opacity.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/animation/showup.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';

import 'login/login_content.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List LargeText=[
    "Search your job",
    "Browse jobs list",
    "Apply to best jobs",
    "Make your career"
  ];

  List onboImage=[
    "onbo_a.jpg",
    "onbo_b.jpg",
    "onbo_c.jpg",
    "onbo_d.jpg"
  ];

  List Description=[
    "Figure out your top five priorities whether it is company culture ,salary.",
    "Our job list include several industries, so you can find the best job for you.",
    "You can apply to your desirable jobs very quickly ans easily with ease",
    "We help you find your dream job based on your skillset, location, demand"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (_,index){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              opacityAnimation(
                delay: 500,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    image: DecorationImage(
                      image: AssetImage(JobappConstant.getImagePath(onboImage[index]))
                    )
                  ),
                ),
              ),
              SizedBox(height: 50,),
              ShowUp(
                delay: 300,
                child: Text(LargeText[index],
                  style: TextStyle(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondary, fontSize: 26,
                      fontWeight: FontWeight.bold, decoration: TextDecoration.none
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                child: ShowUp(
                  delay: 300,
                  child: Text(
                      Description[index],
                      style: TextStyle(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onSecondary, fontSize: 18,
                          decoration: TextDecoration.none
                      ),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (indexDots) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 2,left: 5),
                    width: index == indexDots ? 25 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: index == indexDots ? Theme
                          .of(context)
                          .colorScheme
                          .primary : Theme
                          .of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.6),
                    ),
                  );
                }),
              ),
             Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20,end: 20,bottom: 30),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:
                        (context) => loginContent(),));
                    },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index==3?SizedBox():ShowUp(
                        delay:300,
                        child: Text("Skip",
                          style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onSecondary, fontSize: 18,
                              fontWeight: FontWeight.bold, decoration: TextDecoration.none
                          ),
                        ),
                      ),
                      Container(
                        width: index==3?320:180,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius:BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: ShowUp(
                            delay: 300,
                            child: Text(index==3?"Explore":"Next",
                              style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .secondary, fontSize: 18,
                                  fontWeight: FontWeight.bold, decoration: TextDecoration.none
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}



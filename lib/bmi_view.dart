import 'package:calculater/app_colors.dart';
import 'package:calculater/res_view.dart';
import 'package:flutter/material.dart';

class BmiView extends StatefulWidget {

  @override
  State<BmiView> createState() => _BmiViewState();
}

class _BmiViewState extends State<BmiView> {
int age=19;

int weight =60;
int height=150;
bool ismale=true;
Color getcolor(bool ismale){
  if(ismale){
    return AppColors.redColor;
  }else{
    return AppColors.ContainerColor;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: Text('BMI CALCULATOR APP',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                  setState(() {
                   ismale= true;
                                 });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: getcolor(ismale),
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male_rounded,color: AppColors.whiteColor,size: 40,),
                            SizedBox(height: 15,),
                            Text('male',style: TextStyle(color: AppColors.whiteColor,fontSize: 25,),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        ismale= false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: getcolor(!ismale),
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female_rounded,color: AppColors.whiteColor,size: 40,),
                            SizedBox(height: 15,),
                            Text('female',style: TextStyle(color: AppColors.whiteColor,fontSize: 25,),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),

            Expanded(child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.ContainerColor,
                borderRadius: BorderRadius.circular(20),

              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height',style: TextStyle(color: AppColors.whiteColor,fontSize: 20),),
                    SizedBox(height: 10,),
                    Text('$height cm',style: TextStyle(color: AppColors.whiteColor,fontSize: 30,fontWeight: FontWeight.bold),),
                    Slider(
                        value: height.toDouble(),
                        min: 90,
                        thumbColor: AppColors.redColor,
                        activeColor: AppColors.redColor,
                        inactiveColor: AppColors.btnColor,
                        max: 220,
                        onChanged: (value){
                          setState(() {
                            height=value.toInt();

                          });
                        })
                  ],
                ),
              ),


    )),
//age
            Expanded(child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.ContainerColor,
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Age',style: TextStyle(color: AppColors.whiteColor,fontSize: 20),),
                          SizedBox(height: 10,),
                          Text(age.toString(),style: TextStyle(color: AppColors.whiteColor,fontSize: 25,fontWeight: FontWeight.bold),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  style: IconButton.styleFrom(backgroundColor: AppColors.btnColor,  ),

                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  }, icon: Icon(Icons.remove,color: AppColors.whiteColor,)),
                              IconButton(
                                  style: IconButton.styleFrom(backgroundColor: AppColors.btnColor,  ),

                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  }, icon: Icon(Icons.add,color: AppColors.whiteColor,)),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.ContainerColor,
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Weight',style: TextStyle(color: AppColors.whiteColor,fontSize: 20),),
                          SizedBox(height: 10,),
                          Text('$weight kg',style: TextStyle(color: AppColors.whiteColor,fontSize: 25,fontWeight: FontWeight.bold),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  style: IconButton.styleFrom(backgroundColor: AppColors.btnColor,  ),

                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  }, icon: Icon(Icons.remove,color: AppColors.whiteColor,)),
                              IconButton(
                                  style: IconButton.styleFrom(backgroundColor: AppColors.btnColor,  ),

                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  }, icon: Icon(Icons.add,color: AppColors.whiteColor,)),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
            SizedBox(height: 15,),

          SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.redColor,foregroundColor: AppColors.whiteColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  onPressed: (){

                    double res= weight/(height* .01 * height*.01);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ResultView(res: res),));
                  }, child:Text('CALCULATE')))
          ],
        ),
      ),
    );
  }
}

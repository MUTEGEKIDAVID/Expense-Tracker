import 'package:expanse_repository/expanse_repository.dart';
import 'package:expensetracker/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
class AddExpanse extends StatefulWidget {
  const AddExpanse({super.key});

  @override
  State<AddExpanse> createState() => _AddExpanseState();
}

class _AddExpanseState extends State<AddExpanse> {

  TextEditingController expanseController= new TextEditingController();
  TextEditingController categoryController= new TextEditingController();
  TextEditingController dateController= new TextEditingController();
  DateTime selectdate = DateTime.now();

  List<String> mycategoriesicons =[
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];



  @override
  void initState() {

    super.initState();
    dateController.text= DateFormat('dd/MM/yy').format(DateTime.now())   ;
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Add Expanses",
              style:TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500
              )
              ),
              SizedBox(height: 16,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: TextFormField(
                  controller: expanseController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.dollarSign,
                      size: 16,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none
                    )
                  ),
                ),
              ),
              SizedBox(height: 32,),
          TextFormField(
            onTap: (){

            },
            readOnly: true,
            controller: categoryController,
            decoration: InputDecoration(
              hintText: 'Category',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  FontAwesomeIcons.list,
                  size: 16,),
                suffixIcon: IconButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (cxt){
                      bool isExpanded = false;
                      String iconSelected ='';
                      late Color categorycolor=Colors.white;
                      TextEditingController categoryNameController= new TextEditingController();
                      TextEditingController categoryIconController= new TextEditingController();
                      TextEditingController categorycolorController= new TextEditingController();
                      return StatefulBuilder(
                        builder: (cxt,setState) {
                          return AlertDialog(
                            title: Center(
                              child: Text("Create Category", style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold

                              ),),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: categoryNameController,
                                  //controller: dateController,

                                  readOnly: false,
                                  decoration: InputDecoration(

                                      hintText: 'Name',
                                      isDense: true,
                                      filled: true,
                                      fillColor: Colors.white,

                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              12),
                                          borderSide: BorderSide.none
                                      )
                                  ),
                                ),
                                SizedBox(height: 16,),
                                TextFormField(
                                  controller: categoryIconController,
                                  onTap: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },

                                  readOnly: true,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Icon',
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: Icon(
                                          FontAwesomeIcons.chevronDown,
                                          size: 12),

                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(12)
                                          ),
                                          borderSide: BorderSide.none
                                      )
                                  ),
                                ),
                                isExpanded ? Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(12)
                                      )
                                  ),
                                  child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5
                                    ),
                                    itemCount: mycategoriesicons.length,
                                      itemBuilder: (context,i){
                                      return GestureDetector(
                                        onTap: (){
                                          setState((){
                                            iconSelected=mycategoriesicons[i];

                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          height:50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 3,
                                                color: iconSelected==mycategoriesicons[i]? Colors.green:Colors.grey
                                            ),
                                            borderRadius:BorderRadius.circular(12),

                                            image:DecorationImage(
                                              image: AssetImage(
                                                'assets/${mycategoriesicons[i]}.png'
                                              )

                                            )
                                          ),
                                        ),
                                      );

                                      }
                                  ),

                                ) : Container(),
                                SizedBox(height: 16,),
                                TextFormField(
                                  controller: categorycolorController,
                                  onTap: (){
                                    showDialog(
                                        context: context,
                                        builder: (cxt2){
                                          return BlocProvider.value(
                                            value:context.read<CreateCategoryBloc>(),
                                            child: AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ColorPicker(
                                                    pickerColor: Colors.blue,
                                                    onColorChanged: (Color value) {
                                                      setState((){
                                                        categorycolor=value;
                                                      });

                                                    },

                                                  ),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    height: 50,
                                                    child:TextButton(
                                                        style: TextButton.styleFrom(

                                                          backgroundColor: Colors.black,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12)
                                                          ),


                                                        ),
                                                        onPressed: (){
                                                          Navigator.pop(cxt2);
                                                        },
                                                        child:Text("Save",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors.white
                                                          ),
                                                        )
                                                    ),                                                )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },

                                  readOnly: true,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Color',
                                      filled: true,
                                      fillColor: categorycolor,

                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              12),
                                          borderSide: BorderSide.none
                                      )
                                  ),
                                ),
                                SizedBox(height: 16,),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child:TextButton(
                                      style: TextButton.styleFrom(

                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12)
                                        ),


                                      ),
                                      onPressed: (){
                                        //create category and pop
                                        Category categ =Category.empty;
                                        categ.CategoryID= Uuid().v1();
                                        categ.name= categoryNameController.text;
                                        categ.icon= iconSelected;
                                        categ.color= categorycolor.toString();

                                        context.read<CreateCategoryBloc>().add(createCategory( category: categ));


                                        //Navigator.pop(context);
                                      },
                                      child:Text("Save",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white
                                        ),
                                      )
                                  ),                                                )

                              ],
                            ),
                          );
                        }


                      );

                    }
                    );

                  },

                  icon:Icon(FontAwesomeIcons.plus,
                  size: 16,
                  ),
                  ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none
                )
            ),
          ),
              SizedBox(height: 16,),
              TextFormField(
                controller: dateController,
                onTap: () async{
                 DateTime? newdate= await showDatePicker(
                      context: context,
                      initialDate: selectdate,
                      firstDate: DateTime.now(),
                      lastDate:  DateTime.now().add(Duration(days:365))
                  );

                 if(newdate !=null){
                   setState(() {
                     dateController.text= DateFormat('dd/MM/yy').format(newdate);
                     selectdate=newdate;

                   });

                 }
                },
                readOnly: true,
                decoration: InputDecoration(
                    hintText: 'date',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.clock,
                      size: 16,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none
                    )
                ),
              ),
              SizedBox(height: 32,),
              SizedBox(
                width: double.infinity,
                height:kToolbarHeight,
                child: TextButton(
                  style: TextButton.styleFrom(

                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),


                  ),
                    onPressed: (){},
                    child:Text("Save",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                    ),
                    )
                ),
              )
            ],
          ),
        )

      ),
    );
  }
}


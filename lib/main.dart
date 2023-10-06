import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Screens/login_page.dart';
//import 'pacakge:flutter/signup_page.dart';
import 'expenses.dart';
void main(){
 // WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(MaterialApp(
    home : LoginPage(),
  ));
}

class BudgetTracker extends StatefulWidget {
  const BudgetTracker({super.key});

  @override
  State<BudgetTracker> createState() => _BudgetTrackerState();
}

class _BudgetTrackerState extends State<BudgetTracker> {
  List <Expense> expense_list = [
    Expense( category: 'Groceries' , amount: -1000),
    Expense( category: 'Bills' , amount: -3000),
    Expense( category: 'Appliances',amount: -25000),
    Expense( category: 'Salary', amount : 50000)
  ];
  @override
  Widget build(BuildContext context) {

    int calculate_total (List){
      return expense_list.fold(0, (previousValue, element) => previousValue+ element.amount !);
    }
    int Total = calculate_total(expense_list);
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      body:
      Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0,0.0,0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              //color: Colors.white,
              child: Center(
                child: Text(
                  'Budget Tracker',
                  style: TextStyle(
                    fontSize:35.0,
                    fontWeight: FontWeight.bold,
                    color:Colors.deepPurple[600],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              //color: Colors.white,
              child: Icon (
                Icons.person,
                size: 150.0,
              )
            ),
            Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 50.0,
                  fontFamily:'MontserratAlternates',
                ),
              ),

            ),
            Center(
               child: Text(
                 'back !',
                 style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 50.0,
                fontFamily:'MontserratAlternates',
          ),
               ),
            ),
            Container(
              width: 400,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Expanded(
                   flex:4,
                   child: Text(
                     '    Total : ',
                     style: TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                 ),
                  Expanded(
                    flex:2,
                    child: Text(
                      '     $Total',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Tooltip(
                      message: 'Tap to view Categories',
                      triggerMode: TooltipTriggerMode.longPress,

                      child: IconButton(
                          onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> expenses_page()));
                      },
                        color:Colors.black87, icon: Icon(Icons.expand_circle_down_outlined),
                       // tooltip: 'View Categories',

                      ),
                    )
                  ),
                ],
              )
            ),
            FloatingActionButton(
                onPressed: (){},
               backgroundColor: Colors.white,
               child: Icon(Icons.add ,color: Colors.deepPurple[400],),
            )

    ],
    ),
    ),

    );
  }
}
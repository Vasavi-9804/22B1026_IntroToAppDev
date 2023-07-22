
import 'package:popup_card/popup_card.dart';
import 'package:flutter/material.dart';
class expenses_page extends StatefulWidget {
  const expenses_page({super.key});

  @override
  State<expenses_page> createState() => _expenses_pageState();
}
class Expense {
  String? category;
  int? amount;

  Expense ( {this.category,this.amount} );
}
Widget layout_expenses ( Expense){
  return  Column(
    children: [
      Row(
        children: [
          Expanded(
            flex:7,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),

              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '  ${Expense.category}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple[500],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      Expense.amount.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: IconButton(onPressed: (){

              }, icon: Icon(Icons.delete_rounded,color: Colors.black87,size: 35,)))
        ],
      ),
      SizedBox (
        height: 6.0,
      )
    ],
  );
}
Widget PopUpItemBody (){
  return  Container(

    child: Column(

      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'New Entry',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                'Category :',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),

              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width:45,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          children: [
            Expanded(

              flex: 2,
              child: Text(
                'Amount :',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
              ),
            ),
             Expanded(
               flex: 1,
                child: SizedBox(
                   width:5,
          ),
        )
            ],
        ),
      ],
    ),
  );
}
class _expenses_pageState extends State<expenses_page> {
  int calculate_total (List){
    return expense_list.fold(0, (previousValue, element) => previousValue+ element.amount !);
  }
  List <Expense> expense_list = [
    Expense( category: 'Groceries' , amount: -1000),
    Expense( category: 'Bills' , amount: -3000),
    Expense( category: 'Appliances',amount: -25000),
    Expense( category: 'Salary', amount : 50000)
  ];


@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container (
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex:1,
                      child: FloatingActionButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        elevation: 0.0,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_back , color: Colors.deepPurple[600],size: 30,),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        'Budget Tracker',
                        style: TextStyle(
                          color: Colors.deepPurple[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                        ),
                      ),
                    ),
                    Expanded(
                        flex:1,child: Icon(Icons.person,size: 35,)),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Center(
                child: Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.deepPurple[600],
                   // fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 20,
          ),
          Container(
            height:100 ,
            child: Card(
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 30.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),

              child: Row(
                children: [
                  Expanded(
                    flex:4,
                    child: Text(
                      '    Total : ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple[600],
                      ),
                    ),
                  ),
                  Expanded(
                    flex:2,
                    child: Text(
                      '     ${ expense_list.fold(0, (previousValue, element) => previousValue+ element.amount !)}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
         ),
          ),
          Column(
            children: expense_list.map((Expense)=> layout_expenses(Expense)).toList(),
          ),
            SizedBox(
              height: 30,
            ),
          PopupItemLauncher(
              tag: 'test',
              child: Material(
                color: Colors.white,
                elevation: 20,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                child: const Icon(
                  Icons.add_rounded,
                  size: 56,
                ),
              ),
              popUp: PopUpItem(
                padding: EdgeInsets.all(50), // Padding inside of the card
                color: Colors.deepPurpleAccent, // Color of the card
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Shape of the card
                elevation: 2, // Elevation of the card
                tag: 'test', // MUST BE THE SAME AS IN `PopupItemLauncher`
                child: PopUpItemBody(), // Your custom child widget.
              ),
          ),

          ],

        ),

      ),

    );
  }
}



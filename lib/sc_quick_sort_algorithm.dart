import 'package:flutter/material.dart';

class QuickSortAlgorithmScreen extends StatefulWidget {
  const QuickSortAlgorithmScreen({Key? key}) : super(key: key);

  @override
  _AlgorithmHomeScreenState createState() => _AlgorithmHomeScreenState();
}

class _AlgorithmHomeScreenState extends State<QuickSortAlgorithmScreen> {
  late String numbers;
  List<String> number = [];
  List<int> result = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text(
                  "الگوریتم مرتب سازی سریع",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                centerTitle: true,
                backgroundColor: const Color(0xFF1A374D),
              ),
              backgroundColor: const Color(0xFFF7F7F7),
              body: SingleChildScrollView(
                reverse: true,
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30, right: 10, left: 10),
                        child: Text(
                          "مساله:\n       مرتب سازی عناصر آرایه s از کوچیک به بزرگ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30, right: 10, left: 10),
                        child: Text(
                          "ورودی ها:\n         آرایه s",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 30, right: 10, left: 10, bottom: 20),
                        child: Text(
                          "خروجی ها:\n            مرتب شده ارایه s",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 30, right: 10, left: 10, bottom: 10),
                        child: Text(
                          "زبان های استفاده شده برای طراحی نرم افزار:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "دارت( DART ) و فلاتر ( FLUTTER )",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 30, right: 10, left: 10, bottom: 10),
                        child: Text(
                          "طراحی شده توسط:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: Text(
                            "علی مشکانی / رضا صومعه",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 30, right: 10, bottom: 15),
                        child: Text(
                          "لیست اعداد را طبق نمونه وارد کنید:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      // input button for create array
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: const Border(
                                bottom:
                                    BorderSide(width: 0.5, color: Colors.black),
                                top:
                                    BorderSide(width: 0.5, color: Colors.black),
                                left:
                                    BorderSide(width: 0.5, color: Colors.black),
                                right:
                                    BorderSide(width: 0.5, color: Colors.black),
                              )),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              numbers = value;
                              number = numbers.split(",");
                              result = [];
                              //print(number.runtimeType);
                            },
                            textDirection: TextDirection.ltr,
                            decoration: const InputDecoration(
                                hintText: "مثال: 1,5,3,2,4",
                                border: InputBorder.none),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 60, bottom: 30),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                result =
                                    number.map((e) => int.parse(e)).toList();
                                //print(result.runtimeType);
                                var i = quickSort(result, 0 , result.length - 1);
                                print("i");
                                print(i);
                                //print(s);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green[700]),
                              width: MediaQuery.of(context).size.width - 50,
                              height: 50,
                              child: const Center(
                                  child: Text(
                                "برای محاسبه جمع اینجا بزنید",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18),
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }

  partition(arr, start, end){
    // Taking the last element as the pivot
    var pivotValue = arr[end];
    var pivotIndex = start;
    for (var i = start; i < end; i++) {
      if (arr[i] < pivotValue) {
        // Swapping elements
        var b = arr[i];
        arr[i] = arr[pivotIndex];
        arr[pivotIndex] = b;
        // Moving to next element
        pivotIndex++;
      }
    }
    // Putting the pivot value in the middle
    var c = arr[pivotIndex];
    arr[pivotIndex] = arr[end];
    arr[end] = c;
    return pivotIndex;
  }

  quickSort(arr, start, end) {
    // Base case or terminating case
    if (start >= end) {
      return;
    }

    // Returns pivotIndex
    var index = partition(arr, start, end);

    // Recursively apply the same logic to the left and right subarrays
    quickSort(arr, start, index - 1);
    quickSort(arr, index + 1, end);
  }
}

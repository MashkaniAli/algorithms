# Flutter Algorithm
![pub package](https://img.shields.io/pub/v/algorithm)

<p align="center"><b>This design is for an algorithm design lesson.</b></p>

`QuickSort & Sum` is a ready-to-use widget for calculating algorithms.
Shows the capabilities of the filter

<p align="center">
  <a href='https://imgur.com/a/5H9k8de'>
    <img src='https://github.com/MashkaniAli/algorithms/blob/master/demo/demo.gif' width=320>
  </a>
</p>

## Examples

### Basic example quickSort algorithm

```dart
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuickSortAlgorithmScreen extends StatefulWidget {
  const QuickSortAlgorithmScreen({Key? key}) : super(key: key);

  @override
  _AlgorithmHomeScreenState createState() => _AlgorithmHomeScreenState();
}

class _AlgorithmHomeScreenState extends State<QuickSortAlgorithmScreen> {
  List<String> number = [];
  List<int> result = [];
  List<int> finalResult = [];

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
                              number = value.split(",");
                              //print(number.runtimeType);
                            },
                            textDirection: TextDirection.ltr,
                            decoration: const InputDecoration(
                                hintText: "مثال: 1,5,3,2,4",
                                border: InputBorder.none,
                                labelText: 'لیست اعداد'),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 60, bottom: 30),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                result =
                                    number.map((e) => int.parse(e)).toList();
                                int high = result.length - 1;
                                int low = 0;
                                finalResult = quickSort(result, low, high);
                                print(finalResult);
                                String exit = "لیست اعداد مرتب شده:  " + finalResult.toString();
                                Alert(
                                    context: context,
                                    title: "لیست اعداد مرتب شده",
                                    type: AlertType.success,
                                    desc: finalResult.toString(),
                                    style: const AlertStyle(
                                        alertElevation: 5.0,
                                        descStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            fontFamily: 'IRANSANS')),
                                    buttons: [
                                      DialogButton(
                                          child: const Text(
                                            'تایید',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              number.clear();
                                              result.clear();
                                            });
                                            Navigator.of(context).pop();
                                          }),
                                    ]).show();
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
                                    "برای مرتب سازی اعداد اینجا بزنید",
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

  List<int> quickSort(List<int> list, int low, int high) {
    if (low < high) {
      int pi = partition(list, low, high);
      quickSort(list, low, pi - 1);
      quickSort(list, pi + 1, high);
    }
    return list;
  }

  int partition(List<int> list, low, high) {
    // Base check
    if (list.isEmpty) {
      return 0;
    }
    // Take our last element as pivot and counter i one less than low
    int pivot = list[high];

    int i = low - 1;
    for (int j = low; j < high; j++) {
      // When j is < than pivot element we increment i and swap arr[i] and arr[j]
      if (list[j] < pivot) {
        i++;
        swap(list, i, j);
      }
    }
    // Swap the last element and place in front of the i'th element
    swap(list, i + 1, high);
    return i + 1;
  }

// Swapping using a temp variable
  void swap(List list, int i, int j) {
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }
}
```

<img src="https://github.com/MashkaniAli/algorithms/blob/master/demo/quickSort.jpg" width="300">



### Basic example sum algorithm

```dart
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SumAlgorithmScreen extends StatefulWidget {
  const SumAlgorithmScreen({Key? key}) : super(key: key);

  @override
  _SumAlgorithmScreenState createState() => _SumAlgorithmScreenState();
}

class _SumAlgorithmScreenState extends State<SumAlgorithmScreen> {
  late String numbers;
  List number = [];
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text(
                "الگوریتم جمع عناصر آرایه",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              backgroundColor: const Color(0xFF1A374D),
              centerTitle: true,
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
                        "مساله:\n          تمام اعداد موجود در آرایه n عنصری S را باهم جمع کنید.",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30, right: 10, left: 10),
                      child: Text(
                        "ورودی ها:\n          عدد صحیح و مثبت n آرایه S با اندیس 0 تا n",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const Padding(
                      padding:
                      EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 20),
                      child: Text(
                        "خروجی ها:\n          sum، حاصل جمع اعداد موجود در آرایه S",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding:
                      EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 10),
                      child: Text(
                        "زبان های استفاده شده برای طراحی نرم افزار:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "دارت( DART ) و فلاتر ( FLUTTER )",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const Padding(
                      padding:
                      EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 10),
                      child: Text(
                        "طراحی شده توسط:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Text(
                          "علی مشکانی / رضا صومعه",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30, right: 10, bottom: 15),
                      child: Text(
                        "لیست اعداد را طبق نمونه وارد کنید:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    // input button for create array
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: const Border(
                              bottom: BorderSide(width: 0.5, color: Colors.black),
                              top: BorderSide(width: 0.5, color: Colors.black),
                              left: BorderSide(width: 0.5, color: Colors.black),
                              right: BorderSide(width: 0.5, color: Colors.black),
                            )),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              numbers = value;
                              number = numbers.split(",");
                              result = 0;
                            });
                          },
                          textDirection: TextDirection.ltr,
                          decoration: const InputDecoration(
                              hintText: "مثال: 1,2,3,4",
                              border: InputBorder.none,
                              labelText: 'لیست اعداد'),
                        )),
                    // Button for calculate the sum of numbers inside an array
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 30),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // الگوریتم محاسبه جمع اعداد داخل آرایه ورودی
                            for (int i = 0; i < number.length; i++) {
                              setState(() {
                                result = result + int.parse(number[i]);
                              });
                            }
                            // ---------------------------------------------
                            Alert(
                                context: context,
                                type: AlertType.success,
                                title: "لیست آرایه ورودی \n $number",
                                desc: "مجموع عناصر آرایه:     $result",
                                style: const AlertStyle(
                                    alertElevation: 5.0,
                                    descStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        fontFamily: 'IRANSANS')),
                                buttons: [
                                  DialogButton(
                                      child: const Text(
                                        'تایید',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          numbers = '';
                                          number.clear();
                                          result = 0;
                                        });
                                        Navigator.of(context).pop();
                                      }),
                                ]).show();
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
          ),
        ));
  }
}
```

<img src="https://github.com/MashkaniAli/algorithms/blob/master/demo/sum.jpg" width="300">


## License

* AM Licence

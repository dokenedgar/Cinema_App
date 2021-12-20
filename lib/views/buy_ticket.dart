import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_app/models/bottom_nav_bar_enums.dart';
import 'package:cinema_app/widgets/date_card.dart';
import 'package:cinema_app/widgets/time_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuyTicket extends StatefulWidget {
  const BuyTicket({Key? key}) : super(key: key);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  TicketType ticketType = TicketType.vip;
  late NumberFormat format;
  int basePrice = 2500;
  bool additionalPopcorn = false;
  int numTickets = 1;
  PageController pageController =
      PageController(initialPage: 1, viewportFraction: 0.3);
  int dayIndex = 1;
  List<String> days = ['Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  Map<String, List<String>> data = {
    'Wed': ['10:00 am', '04:00 pm', '07:00 pm', '08:00 pm', '10:00 pm'],
    'Thu': ['03:00 pm', '06:00 pm'],
    'Fri': ['05:00 pm'],
    'Sat': ['11:00 am'],
    'Sun': ['04:00 pm'],
  };
  String? selectedTime;

  @override
  void initState() {
    format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: kToolbarHeight,
              left: 24,
              right: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const Text(
                      'Buy Ticket',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.share_outlined),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://m.media-amazon.com/images/M/MV5BZGExZTUzYWQtYWJjZi00OTI4LTk4OGYtNTA2YzcwMmNiZTMxXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg',
                        filterQuality: FilterQuality.medium,
                        height: 150,
                        width: 100,
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 34.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'The Last Duel',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const Text(
                                '02h 18m',
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_pin,
                                    size: 12,
                                  ),
                                  Text('Fasnet Cinema')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 38.0),
                  child: Text(
                    'Ticket',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoSlidingSegmentedControl<TicketType>(
                          backgroundColor: Colors.orangeAccent.withOpacity(0.3),
                          thumbColor: Colors.orangeAccent,
                          onValueChanged: (TicketType? value) {
                            if (value != null && value == TicketType.vip) {
                              setState(() {
                                basePrice = 2500;
                                ticketType = value;
                              });
                            } else if (value != null &&
                                value == TicketType.regular) {
                              setState(() {
                                basePrice = 1500;
                                ticketType = value;
                              });
                            }
                          },
                          groupValue: ticketType,
                          children: const {
                            TicketType.regular: Text('Regular'),
                            TicketType.vip: Text('VIP')
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          if (numTickets > 1) {
                            setState(() {
                              numTickets--;
                            });
                          }
                        },
                        child: Card(
                          child: const Icon(
                            Icons.remove,
                            size: 34,
                          ),
                          color: numTickets == 1
                              ? Colors.grey.shade100
                              : Colors.grey.shade300,
                        ),
                      ),
                      Text(
                        numTickets.toString(),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            numTickets++;
                          });
                        },
                        child: Card(
                          child: const Icon(
                            Icons.add,
                            size: 34,
                          ),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 2,
                      )),
                      Text(
                        '  ${format.currencySymbol}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${format.format(basePrice * numTickets).replaceFirst(format.currencySymbol, ' ').replaceFirst('.00', '')}  ',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 2,
                      )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '(Plus Free Popcorn and Drink)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: Text(
                    'Popcorn',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Text(
                  '(Additional Popcorn)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoSlidingSegmentedControl<bool>(
                          backgroundColor: Colors.orangeAccent.withOpacity(0.3),
                          thumbColor: Colors.orangeAccent,
                          onValueChanged: (bool? value) {
                            if (value != null && value) {
                              setState(() {
                                additionalPopcorn = true;
                              });
                            } else {
                              setState(() {
                                additionalPopcorn = false;
                              });
                            }
                          },
                          groupValue: additionalPopcorn,
                          children: const {
                            false: Text('None'),
                            true: Text('Include')
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Visibility(
                    visible: additionalPopcorn,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 2,
                        )),
                        Text(
                          '  ${format.currencySymbol}',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '  800  ',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 2,
                        )),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: Text(
                    'Select Time',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Wrap(
                      runSpacing: 4,
                      runAlignment: WrapAlignment.spaceEvenly,
                      children: List.generate(
                        data[days[dayIndex]]!.length,
                        (index) => InkWell(
                          onTap: () {
                            setState(() {
                              selectedTime = data[days[dayIndex]]![index];
                            });
                          },
                          child: TimeCard(
                            time: data[days[dayIndex]]![index],
                            isSelected:
                                data[days[dayIndex]]![index] == selectedTime,
                          ),
                        ),
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: Text(
                    'Select Date',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: SizedBox(
                    height: 150,
                    child: PageView.builder(
                      physics: const CustomPageViewScrollPhysics(),
                      itemCount: 5,
                      //pageSnapping: true,
                      controller: pageController,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            if (dayIndex == index)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: DateCard(
                                  day: days[index],
                                  date: (index + 10).toString(),
                                  isSelected: true,
                                ),
                              ),
                            if (dayIndex != index)
                              Positioned(
                                bottom: 20,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: InkWell(
                                    onTap: () => pageController.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                    ),
                                    child: DateCard(
                                      date: (index + 10).toString(),
                                      day: days[index],
                                      isSelected: false,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                      onPageChanged: (index) {
                        setState(() {
                          dayIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: kToolbarHeight,
                  child: CupertinoButton(
                    color: Colors.black,
                    onPressed: () async {
                      if(selectedTime == null) return;
                      int total = basePrice * numTickets;
                      bool showMainDialog = true;
                      total += 100;
                      if (additionalPopcorn) total += 800;
                      showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Visibility(
                                  visible: showMainDialog,
                                  child: CupertinoAlertDialog(
                                    title: const Text(
                                      'Confirm Order',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    content: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                             const Text(
                                                'Total:',
                                                style:  TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.normal),
                                              ),
                                              Text(
                                                '  ${format.format(total)}',
                                                style: const TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            '(Payment Gateway +${format.currencySymbol}100)',
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Material(
                                            child: InkWell(
                                              onTap: () async{
                                                setState(() {
                                                  showMainDialog = false;
                                                });
                                                var res = await showCupertinoDialog(
                                                    context: context,
                                                    barrierDismissible: true,
                                                    builder: (context) {
                                                      return CupertinoAlertDialog(
                                                        title: const Material(
                                                          child: Text('Enter Coupon'),
                                                          color: Colors.transparent,
                                                        ),
                                                        content: Material(
                                                          color: Colors.transparent,
                                                          child: TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Enter coupon code',
                                                                  enabledBorder: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(16),
                                                                    borderSide:
                                                                    const BorderSide(width: 0.5, color: Colors.grey),
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(16),
                                                                    borderSide:
                                                                    const BorderSide(width: 1, color: Colors.grey),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        actions: [
                                                          CupertinoButton(
                                                            child: const Text('Cancel'),
                                                            onPressed: () {
                                                              Navigator.pop(context);
                                                              setState(() {
                                                                showMainDialog = true;
                                                              });
                                                            },
                                                          ),
                                                          CupertinoButton(
                                                            child: const Text(
                                                              'Apply',
                                                              style: TextStyle(
                                                                  color: Colors.blue),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                total -= 1000;
                                                                showMainDialog = true;
                                                              });
                                                              Navigator.pop(context, total);
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: const Text(
                                                'Have a Coupon?',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.underline),
                                              ),
                                            ),
                                            color: Colors.transparent,
                                          ),
                                        )
                                      ],
                                    ),
                                    actions: [
                                      CupertinoButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      CupertinoButton(
                                        child: const Text(
                                          'Proceed',
                                          style: TextStyle(
                                              color: Colors.blue),
                                        ),
                                        onPressed: () {

                                          Navigator.pop(context, total);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }
                            );
                          });
                    },
                    child: const Text(
                      'Buy Ticket',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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

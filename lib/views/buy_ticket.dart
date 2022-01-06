import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_app/models/bottom_nav_bar_enums.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/widgets/date_card.dart';
import 'package:cinema_app/widgets/time_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class BuyTicket extends StatefulWidget {
  const BuyTicket({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

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
            padding: EdgeInsets.only(
              bottom: 2.w,
              left: 6.w,
              right: 6.w,
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
                    Text(
                      'Buy Ticket',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.share_outlined),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.movie.imageMedium,
                        filterQuality: FilterQuality.medium,
                        height: 35.w,
                        width: 25.w,
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                widget.movie.title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp,
                                ),
                              ),
                              const Text(
                                '02h 18m',
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    size: 12.sp,
                                  ),
                                  const Text('Fasnet Cinema')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.w),
                  child: Text(
                    'Ticket',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoSlidingSegmentedControl<TicketType>(
                          backgroundColor: Colors.grey.withOpacity(0.25),
                          thumbColor: Colors.deepOrange.withOpacity(0.8),
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
                  padding: EdgeInsets.only(top: 4.w),
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
                          child: Icon(
                            Icons.remove,
                            size: 8.w,
                          ),
                          color: numTickets == 1
                              ? Colors.grey.shade100
                              : Colors.grey.shade300,
                        ),
                      ),
                      Text(
                        numTickets.toString(),
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            numTickets++;
                          });
                        },
                        child: Card(
                          child: Icon(
                            Icons.add,
                            size: 8.w,
                          ),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.w),
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
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${format.format(basePrice * numTickets).replaceFirst(format.currencySymbol, ' ').replaceFirst('.00', '')}  ',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
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
                Padding(
                  padding: EdgeInsets.only(top: 7.w),
                  child: Text(
                    'Popcorn',
                    style: TextStyle(
                      fontSize: 13.sp,
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
                  padding: EdgeInsets.only(top: 2.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoSlidingSegmentedControl<bool>(
                          backgroundColor: Colors.grey.withOpacity(0.25),
                          thumbColor: Colors.deepOrange.withOpacity(0.8),
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
                  padding: EdgeInsets.only(top: 2.w),
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
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '  800  ',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.bold),
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
                Padding(
                  padding: EdgeInsets.only(top: 6.w),
                  child: Text(
                    'Select Time',
                    style: TextStyle(
                      fontSize: 13.sp,
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
                Padding(
                  padding: EdgeInsets.only(top: 6.w),
                  child: Text(
                    'Select Date',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7.w),
                  child: SizedBox(
                    height: 35.w,
                    child: PageView.builder(
                      physics: const CustomPageViewScrollPhysics(),
                      itemCount: 5,
                      //pageSnapping: true,
                      controller: pageController,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            if (dayIndex == index)
                              DateCard(
                                day: days[index],
                                date: (index + 10).toString(),
                                isSelected: true,
                              ),
                            if (dayIndex != index)
                              Positioned(
                                bottom: 4.w,
                                child: InkWell(
                                  onTap: () => pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                  ),
                                  child: DateCard(
                                    date: (index + 10).toString(),
                                    day: days[index],
                                    isSelected: false,
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
                Padding(
                  padding: EdgeInsets.only(top: 5.w),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: kToolbarHeight,
                    child: CupertinoButton(
                      color: Colors.black,
                      onPressed: () async {
                        if (selectedTime == null) return;
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text(
                                                '  ${format.format(total)}',
                                                style: const TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.normal),
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
                                              onTap: () async {
                                                setState(() {
                                                  showMainDialog = false;
                                                });
                                                var res =
                                                    await showCupertinoDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder: (context) {
                                                    return CupertinoAlertDialog(
                                                      title: const Material(
                                                        child: Text(
                                                            'Enter Coupon'),
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      content: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Enter coupon code',
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              borderSide:
                                                                  const BorderSide(
                                                                      width:
                                                                          0.5,
                                                                      color: Colors
                                                                          .grey),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              borderSide:
                                                                  const BorderSide(
                                                                      width: 1,
                                                                      color: Colors
                                                                          .grey),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      actions: [
                                                        CupertinoButton(
                                                          child: const Text(
                                                              'Cancel'),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            setState(() {
                                                              showMainDialog =
                                                                  true;
                                                            });
                                                          },
                                                        ),
                                                        CupertinoButton(
                                                          child: const Text(
                                                            'Apply',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue),
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              total -= 1000;
                                                              showMainDialog =
                                                                  true;
                                                            });
                                                            Navigator.pop(
                                                                context, total);
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: const Text(
                                                'Have a Coupon?',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline),
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
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context, total);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Buy Ticket',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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

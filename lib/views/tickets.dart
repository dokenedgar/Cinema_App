import 'package:cinema_app/widgets/purchased_ticket.dart';
import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
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
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    'Today\'s Tickets',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                PurchasedTicket(),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    'Upcoming Tickets',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                PurchasedTicket(),
                PurchasedTicket(),
                PurchasedTicket(),
                PurchasedTicket(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

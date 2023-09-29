import 'dart:developer';

import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  final TabController tabController;

  const Address({super.key, required this.tabController});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);
  bool isaddressavailable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isaddressavailable == false) AddShippingAddressButtonWidget(),
            if (isaddressavailable == true)
              Shippingaddress(
                tabController: widget.tabController,
              ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            //   height: 41,
            //   width: 328,
            //   decoration: BoxDecoration(
            //     color: Color(0xff636363),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Color(0xff636363),
            //     ),
            //     onPressed: () {},
            //     child: Text(
            //       'Continue',
            //       style: TextStyle(
            //           color: Color(0xffFFFFFF),
            //           fontSize: 14,
            //           fontWeight: FontWeight.w500),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Container AddShippingAddressButtonWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      height: 58,
      width: 328,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(18),
        //  border: Border.all(
        //           color: Color(0xff37373766),
        //           width: 5,
        //         )
      ),
      child: TextButton.icon(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side:
                        BorderSide(color: Color(0xff37373766), width: 0.25)))),
        onPressed: () {
          setState(() {
            isaddressavailable = true;
          });
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => Shippingaddress()));
        },
        icon: Image.asset(
          "assets/images/location.png",
        ),
        label: Text(
          'Add Shipping Address',
          style: TextStyle(
              color: Color(0xff636363),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class Shippingaddress extends StatefulWidget {
  final TabController tabController;

  const Shippingaddress({required this.tabController, super.key});

  @override
  State<Shippingaddress> createState() => _ShippingaddressState();
}

class _ShippingaddressState extends State<Shippingaddress> {
  bool isSave = false;
  bool state = false;
  bool bill = false;

  _ShippingaddressState();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (isSave == false) AddressSave(context),
      if (bill == true)
        Billingaddress(
          tabController: widget.tabController,
        ),
      // if (state == false) AddressSave(context),
      if (state == true)
        SelectState(
          tabController: widget.tabController,
        )
    ]);
  }

  Widget AddressSave(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 16),
          child: Text(
            "Add Shipping Address",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff373737)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          width: 328,
          height: 38,
          child: TextField(
            cursorColor: Colors.black,
            style: TextStyle(
                color: Color(0xff636363),
                fontSize: 12,
                fontWeight: FontWeight.w300),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(8, 6, 0, 6),
              hintText: "Profile Name",
              filled: true,
              fillColor: Color(0xffFFFFFF),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                width: 154,
                height: 38,
                child: TextField(
                  cursorColor: Colors.black,
                  style: TextStyle(
                      color: Color(0xff636363),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(8, 6, 0, 6),
                    hintText: "First Name",
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  width: 154,
                  height: 38,
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                        color: Color(0xff636363),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(8, 6, 0, 6),
                      hintText: "Last Name",
                      filled: true,
                      fillColor: Color(0xffFFFFFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          width: 328,
          height: 38,
          child: TextField(
            cursorColor: Colors.black,
            style: TextStyle(
                color: Color(0xff636363),
                fontSize: 12,
                fontWeight: FontWeight.w300),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(8, 6, 0, 6),
              hintText: "House/Flat/No/Flat Name",
              filled: true,
              fillColor: Color(0xffFFFFFF),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: 328,
          height: 38,
          child: TextField(
            cursorColor: Colors.black,
            style: TextStyle(
                color: Color(0xff636363),
                fontSize: 12,
                fontWeight: FontWeight.w300),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(8, 6, 0, 6),
              hintText: "Pincode",
              filled: true,
              fillColor: Color(0xffFFFFFF),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          width: 328,
          height: 38,
          child: TextField(
            cursorColor: Colors.black,
            style: TextStyle(
                color: Color(0xff636363),
                fontSize: 12,
                fontWeight: FontWeight.w300),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(8, 6, 0, 6),
              hintText: "Home City",
              filled: true,
              fillColor: Color(0xffFFFFFF),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: 328,
          height: 38,
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 12, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "State",
                  style: TextStyle(
                      color: Color(0xff636363),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                IconButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SelectState(
                      //               tabController: widget.tabController,
                      //             )
                      //             )
                      //             );
                      setState(() {
                        isSave = true;
                        state = true;
                      });
                    },
                    icon: Icon(
                      Icons.expand_more,
                      color: Color(0xff636363),
                      size: 16,
                    ))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 160),
          child: Container(
            height: 41,
            width: 328,
            decoration: BoxDecoration(
              color: Color(0xffEE6983),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFEE6983)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ))),
              onPressed: () {
                setState(() {
                  isSave = true;
                  bill = true;
                });
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Billingaddress()));
              },
              child: Text(
                'Save',
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Billingaddress extends StatefulWidget {
  final TabController tabController;
  const Billingaddress({required this.tabController, super.key});

  @override
  State<Billingaddress> createState() => _BillingaddressState();
}

class _BillingaddressState extends State<Billingaddress> {
  bool Newaddress = false;
  bool addcustom = false;
  bool address = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Newaddress == false) Billingaddressupdate(),
        if (address == true)
          Shippingaddressupdate(
            tabController: widget.tabController,
          ),
        // if (addcustom == false) Billingaddressupdate(),
        if (addcustom == true)
          Addcustomnotes(
            tabController: widget.tabController,
          ),
      ],
    );
  }

  Column Billingaddressupdate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 16),
          child: Text(
            "Add Shipping Address",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff373737)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          height: 58,
          width: 328,
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextButton.icon(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                            color: Color(0xff37373766), width: 0.25)))),
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Shippingaddress()));
            },
            icon: Image.asset(
              "assets/images/loc2.png",
            ),
            label: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hrishilal T",
                  style: TextStyle(
                      color: Color(0xff636363),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Flat No, Nilambur, Ph:8548555858",
                  style: TextStyle(
                      color: Color(0xff636363),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16),
          child: Text(
            "Billing Address",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff373737)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          height: 58,
          width: 328,
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextButton.icon(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                            color: Color(0xff37373766), width: 0.25)))),
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Shippingaddress()));
            },
            icon: Image.asset(
              "assets/images/location.png",
            ),
            label: Text(
              'Use Same Address',
              style: TextStyle(
                  color: Color(0xff636363),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          height: 58,
          width: 328,
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextButton.icon(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                            color: Color(0xff37373766), width: 0.25)))),
            onPressed: () {
              setState(() {
                Newaddress = true;
                address = true;
              });
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Shippingaddress()));
            },
            icon: Image.asset(
              "assets/images/location.png",
            ),
            label: Text(
              'Add New Address',
              style: TextStyle(
                  color: Color(0xff636363),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          height: 58,
          width: 328,
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextButton.icon(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                            color: Color(0xff37373766), width: 0.25)))),
            onPressed: () {
              setState(() {
                Newaddress = true;
                addcustom = true;
              });
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Shippingaddress()));
            },
            icon: Image.asset(
              "assets/images/location.png",
            ),
            label: Text(
              'Add Customer Notes',
              style: TextStyle(
                  color: Color(0xff636363),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 135),
          child: Container(
            height: 41,
            width: 328,
            decoration: BoxDecoration(
              color: Color(0xffEE6983),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFEE6983)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ))),
              onPressed: () {
                log('here in continue');
                widget.tabController.animateTo(2);
              },
              child: Text(
                'Continue',
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Shippingaddressupdate extends StatefulWidget {
  final TabController tabController;

  const Shippingaddressupdate({required this.tabController, super.key});

  @override
  State<Shippingaddressupdate> createState() => _ShippingaddressupdateState();
}

class _ShippingaddressupdateState extends State<Shippingaddressupdate> {
  bool isupdate = false;

  _ShippingaddressupdateState();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (isupdate == false) Addressupdate(context),
      if (isupdate == true)
        Billingaddress(
          tabController: widget.tabController,
        ),
    ]);
  }

  Column Addressupdate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 16),
          child: Text(
            "Add Shipping Address",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff373737)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          width: 328,
          height: 38,
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 20),
            child: Text(
              "Profile Name",
              style: TextStyle(
                  color: Color(0xff636363),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 154,
                height: 38,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 20),
                  child: Text(
                    "First Name",
                    style: TextStyle(
                        color: Color(0xff636363),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Container(
                  width: 154,
                  height: 38,
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 12, bottom: 12, left: 20),
                    child: Text(
                      "Last Name",
                      style: TextStyle(
                          color: Color(0xff636363),
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          width: 328,
          height: 38,
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 20),
            child: Text(
              "House/Flat/No/Flat Name",
              style: TextStyle(
                  color: Color(0xff636363),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: 328,
          height: 38,
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 20),
            child: Text(
              "Pincode",
              style: TextStyle(
                  color: Color(0xff636363),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          width: 328,
          height: 38,
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 20),
            child: Text(
              "Home City",
              style: TextStyle(
                  color: Color(0xff636363),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: 328,
          height: 38,
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 12, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "State",
                  style: TextStyle(
                      color: Color(0xff636363),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                IconButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SelectState(
                      //               tabController: widget.tabController,
                      //             )));
                    },
                    icon: Icon(
                      Icons.expand_more,
                      color: Color(0xff636363),
                      size: 16,
                    ))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 180),
          child: Container(
            height: 41,
            width: 328,
            decoration: BoxDecoration(
              color: Color(0xffEE6983),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFEE6983)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ))),
              onPressed: () {
                setState(() {
                  isupdate = true;
                });
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Billingaddress()));
              },
              child: Text(
                'update',
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Addcustomnotes extends StatefulWidget {
  final TabController tabController;

  const Addcustomnotes({required this.tabController, super.key});

  @override
  State<Addcustomnotes> createState() => _AddcustomnotesState();
}

class _AddcustomnotesState extends State<Addcustomnotes> {
  bool isupdate = false;

  _AddcustomnotesState();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (isupdate == false) Customenote(context),
      if (isupdate == true)
        Billingaddress(
          tabController: widget.tabController,
        ),
    ]);
  }

  Column Customenote(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 16),
          child: Text(
            "Add Customer Notes",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff373737)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          width: 328,
          height: 395,
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 20),
            child: Text(
              "Notes",
              style: TextStyle(
                  color: Color(0xff636363),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 60),
          child: Container(
            height: 41,
            width: 328,
            decoration: BoxDecoration(
              color: Color(0xffEE6983),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFEE6983)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ))),
              onPressed: () {
                setState(() {
                  isupdate = true;
                });
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Billingaddress()));
              },
              child: Text(
                'Save',
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SelectState extends StatefulWidget {
  const SelectState({required this.tabController, super.key});
  final TabController tabController;

  @override
  State<SelectState> createState() => _SelectStateState();
}

class _SelectStateState extends State<SelectState> {
  bool selectstate = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (selectstate == false) SelectstateK(),
      if (selectstate == true)
        Shippingaddress(
          tabController: widget.tabController,
        ),
    ]);
  }

  Column SelectstateK() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "Select State",
          style: TextStyle(
              color: Color(0xff373737),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
      Container(
          height: 540,
          width: double.infinity,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 1.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: 10,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectstate = true;
                      });
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      width: 154,
                      height: 56,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage("assets/images/kerala.png"),
                              height: 40,
                              width: 36,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "kerala",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff373737)),
                            ),
                          )
                        ],
                      ),
                    ));
              }))
    ]);
  }
}

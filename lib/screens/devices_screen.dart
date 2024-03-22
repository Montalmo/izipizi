import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:izipizi/APIs/apis.dart';
import 'package:izipizi/models/business_card_model.dart';
import 'package:izipizi/screens/add_device_screen.dart';
import 'package:izipizi/widgets/device_card.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  static const String routeName = 'devices-screen';

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  @override
  Widget build(BuildContext context) {
    final Size mqd = MediaQuery.of(context).size;
    List myDevices = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мої пристрої'),
      ),
      body: StreamBuilder(
        stream: APIs.getMyDevicesID(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              return StreamBuilder(
                  stream: APIs.getMyDevices(snapshot.data?.docs.map((e) {
                        return e.id;
                      }).toList() ??
                      []),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.active:
                      case ConnectionState.done:
                        final data = snapshot.data?.docs;
                        log('Data is: $data');
                        List businessCrds = data
                                ?.map((e) => BusinessCard.fromJson(e.data()))
                                .toList() ??
                            [];

                        myDevices = businessCrds
                            .map((e) =>
                                DeviceCard(mqd: mqd.width, businessCard: e))
                            .toList();

                        return myDevices.isNotEmpty
                            ? Center(
                                child: Swiper(
                                  itemBuilder: (context, index) {
                                    return myDevices[index];
                                  },
                                  indicatorLayout: PageIndicatorLayout.DROP,
                                  pagination: const SwiperPagination(
                                    builder: SwiperPagination.fraction,
                                  ),
                                  itemCount: myDevices.length,
                                  itemWidth: mqd.width,
                                  itemHeight: mqd.width / 1.6,
                                  layout: SwiperLayout.TINDER,
                                ),
                              )
                            : const Center(
                                child: Text('Додайте свій перший дівайс'),
                              );
                    }
                  });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddDeviceScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

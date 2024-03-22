import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:izipizi/models/business_card_model.dart';
import 'package:izipizi/screens/contact_screen.dart';

import '../theme/pallets.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({
    super.key,
    required this.mqd,
    required this.businessCard,
  });

  final double mqd;
  final BusinessCard businessCard;

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    final currentCard = widget.businessCard;
    final bgImageURL = currentCard.bgImageURL;
    final avatarImageURL = currentCard.avatarImageURL;

    return GestureDetector(
      onTap: () {
        log('Card tap tap');
        Navigator.of(context).pushNamed(
          ContactScreen.routeName,
          arguments: currentCard,
        );
      },
      child: Container(
        height: 220.0,
        width: widget.mqd - 32,
        decoration: const BoxDecoration(
          color: ColorPallet.cGrayDarkContainer,
          boxShadow: [
            ColorPallet.sContainer,
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(14.0),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 140,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    image: (bgImageURL != '')
                        ? DecorationImage(
                            image: ExactAssetImage(bgImageURL),
                            fit: BoxFit.fitWidth,
                          )
                        : const DecorationImage(
                            image: ExactAssetImage('assets/images/def_bg.png'),
                            fit: BoxFit.fitWidth,
                          ),
                    color: ColorPallet.cGrayDarkContainer,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      widget.businessCard.name,
                      textAlign: TextAlign.center,
                      style: FontsPallet.bodyBig,
                    ),
                    const SizedBox(
                      width: 2.0,
                    ),
                    Text(
                      widget.businessCard.profession,
                      textAlign: TextAlign.center,
                      style: FontsPallet.bodyMedium
                          .copyWith(color: ColorPallet.cGrayText),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 114.0,
              decoration: const BoxDecoration(
                color: ColorPallet.cGrayDarkContainer,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              height: 100,
              child: ClipOval(
                child: (avatarImageURL != '')
                    ? Image.asset(
                        avatarImageURL,
                      )
                    : Image.asset('assets/images/def_avatar.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

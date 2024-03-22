import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:izipizi/models/business_card_model.dart';
import 'package:izipizi/theme/pallets.dart';
import 'package:izipizi/utilits/data.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({
    super.key,
  });

  static const String routeName = '/contact-screen';

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final double mqd = MediaQuery.of(context).size.width;
    final BusinessCard curentCardr =
        ModalRoute.of(context)!.settings.arguments as BusinessCard;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакт'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                GestureDetector(
                  onTap: () {
                    _showBottoSheet(ContactCardButtons.bgImage);
                  },
                  child: ClipRRect(
                    child: (curentCardr.bgImageURL != '')
                        ? Image.asset(
                            curentCardr.bgImageURL,
                          )
                        : Image.asset('assets/images/def_bg.png'),
                  ),
                ),
                Positioned(
                  bottom: -40.0,
                  child: ContactAvatar(
                    mqd: mqd,
                    avatrURL: curentCardr.avatarImageURL,
                    onTap: () {
                      _showBottoSheet(ContactCardButtons.avatar);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 52,
            ),
            GestureDetector(
              onTap: () {
                _showBottoSheet(ContactCardButtons.name);
              },
              child: Column(
                children: [
                  Text(
                    curentCardr.name,
                    textAlign: TextAlign.center,
                    style: FontsPallet.bodyBig,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    curentCardr.profession,
                    textAlign: TextAlign.center,
                    style: FontsPallet.bodyMedium
                        .copyWith(color: ColorPallet.cGrayText),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(
                16.0,
              ).copyWith(top: 12),
              padding: const EdgeInsets.all(12.0).copyWith(
                bottom: 8.0,
              ),
              decoration: const BoxDecoration(
                color: ColorPallet.cGrayContainer,
                boxShadow: [
                  ColorPallet.sContainer,
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    14.0,
                  ),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContactMainButton(
                      title: 'Зберегти',
                      iconPath: 'assets/svgs/save_icon.svg',
                      bgColor: ColorPallet.gCyan),
                  ContactMainButton(
                      title: 'Зустріч',
                      iconPath: 'assets/svgs/date_meet_icon.svg',
                      bgColor: ColorPallet.gGreen),
                  ContactMainButton(
                      title: 'Подарунок',
                      iconPath: 'assets/svgs/present_icon.svg',
                      bgColor: ColorPallet.gViolet),
                  ContactMainButton(
                      title: 'Чат',
                      iconPath: 'assets/svgs/send_icon.svg',
                      bgColor: ColorPallet.gOrange),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: ColorPallet.cGrayDarkContainer,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 12.0,
                runSpacing: 12.0,
                children: additionalContactButtonsData
                    .map((e) => ContactAdditionalButton(
                          mqd: mqd,
                          title: e[0],
                          iconPath: e[1],
                          mainColor: e[2],
                          buttonType: e[3],
                          onTap: () {
                            _showBottoSheet(e[3]);
                          },
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottoSheet(ContactCardButtons button) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          switch (button) {
            case ContactCardButtons.avatar:
              return SafeArea(
                  child: ListView(
                children: const [
                  Text('Chage avatar image'),
                ],
              ));
            case ContactCardButtons.bgImage:
              return SafeArea(
                  child: ListView(
                children: const [
                  Text('Chage bg_image image'),
                ],
              ));
            case ContactCardButtons.name:
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16.0),
                  shrinkWrap: true,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.edit,
                          size: 16.0,
                          color: ColorPallet.cCyan600,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          'Редагування основной інформації',
                          style: FontsPallet.bodyMedium,
                        ),
                      ],
                    ),
                    Form(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 24.0,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Призвище та Ім\'я',
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Посада'),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text('Скасувати'),
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Підтвердити'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
              );
            case ContactCardButtons.facebook:
              return SafeArea(
                  child: ListView(
                children: const [
                  Text('Chage fb adess'),
                ],
              ));
            case ContactCardButtons.instagram:
              return SafeArea(
                  child: ListView(
                children: const [
                  Text('Chage instagram adress'),
                ],
              ));
            case ContactCardButtons.youtube:
              return SafeArea(
                  child: ListView(
                children: const [
                  Text('Chage youtube image'),
                ],
              ));
            case ContactCardButtons.phone:
              return SafeArea(
                  child: ListView(
                children: const [
                  Text('Chage phone image'),
                ],
              ));
            case ContactCardButtons.www:
              return SafeArea(
                  child: ListView(
                children: const [
                  Text('Chage www image'),
                ],
              ));
            case ContactCardButtons.viber:
              return SafeArea(
                  child: ListView(
                children: const [
                  Text('Chage viber'),
                ],
              ));
            case ContactCardButtons.skype:
              return SafeArea(
                  child: ListView(
                children: const [
                  Text('Chage skype'),
                ],
              ));
            case ContactCardButtons.tiktok:
              return SafeArea(
                  child: ListView(
                children: const [
                  Text('Chage tiktok'),
                ],
              ));
            default:
              return SafeArea(child: ListView());
          }
        });
  }
}

class ContactAdditionalButton extends StatefulWidget {
  const ContactAdditionalButton({
    super.key,
    required this.mqd,
    required this.title,
    required this.iconPath,
    required this.mainColor,
    required this.buttonType,
    required this.onTap,
  });

  final double mqd;
  final String title;
  final String iconPath;
  final Color mainColor;
  final ContactCardButtons buttonType;
  final VoidCallback onTap;

  @override
  State<ContactAdditionalButton> createState() =>
      _ContactAdditionalButtonState();
}

class _ContactAdditionalButtonState extends State<ContactAdditionalButton> {
  bool isActive = true;

  void setActive() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.mqd / 3.5 - 32,
        height: widget.mqd / 3.5 - 32,
        decoration: BoxDecoration(
          boxShadow: const [
            ColorPallet.sContainer,
          ],
          border: Border.all(
            color: isActive
                ? widget.mainColor
                : ColorPallet.cWhite.withOpacity(.05),
          ),
          borderRadius: BorderRadius.circular(14.0),
          color: ColorPallet.cGrayDarkContainer,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(widget.iconPath,
                colorFilter: isActive
                    ? ColorFilter.mode(
                        widget.mainColor,
                        BlendMode.srcIn,
                      )
                    : const ColorFilter.mode(
                        ColorPallet.cGrayText,
                        BlendMode.srcIn,
                      )),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.title,
              style: FontsPallet.bodySmall.copyWith(
                color: isActive ? ColorPallet.cWhite : ColorPallet.cGrayText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactMainButton extends StatefulWidget {
  const ContactMainButton({
    super.key,
    required this.title,
    required this.iconPath,
    required this.bgColor,
  });

  final String title;
  final String iconPath;
  final LinearGradient bgColor;

  @override
  State<ContactMainButton> createState() => _ContactMainButtonState();
}

class _ContactMainButtonState extends State<ContactMainButton> {
  bool isActive = false;

  void setActive() {
    setState(() {
      isActive = !isActive;
    });
  }

  void showBottomSheet() {
    Scaffold.of(context).showBottomSheet((context) {
      return Container(
        height: 300,
        color: Colors.red,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            log('tap tap');
            setActive();
          },
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              boxShadow: const [
                ColorPallet.sContainer,
              ],
              gradient: isActive ? widget.bgColor : null,
              color: !isActive ? ColorPallet.cGrayContainer : null,
              border: isActive
                  ? Border.all(
                      color: ColorPallet.cWhite.withOpacity(.2),
                    )
                  : Border.all(
                      color: ColorPallet.cWhite.withOpacity(.05),
                    ),
              borderRadius: const BorderRadius.all(
                Radius.circular(14.0),
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 24.0,
                child: SvgPicture.asset(
                  widget.iconPath,
                  colorFilter: const ColorFilter.mode(
                    ColorPallet.cWhite,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          widget.title,
          style: isActive
              ? FontsPallet.bodySmall.copyWith(color: ColorPallet.cWhite)
              : FontsPallet.bodySmall.copyWith(color: ColorPallet.cGrayText),
        )
      ],
    );
  }
}

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({
    super.key,
    required this.mqd,
    required this.avatrURL,
    required this.onTap,
  });

  final double mqd;
  final String avatrURL;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: mqd / 2.5,
            height: mqd / 2.5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorPallet.cBGContainer,
              boxShadow: [
                ColorPallet.sContainer,
              ],
            ),
          ),
          SizedBox(
            width: mqd / 2.5 - 8,
            child: ClipOval(
              child: (avatrURL != '')
                  ? Image.asset(
                      avatrURL,
                    )
                  : Image.asset('assets/images/def_avatar.png'),
            ),
          ),
        ],
      ),
    );
  }
}

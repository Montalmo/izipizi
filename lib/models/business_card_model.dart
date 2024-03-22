class BusinessCard {
  BusinessCard({
    required this.avatarImageURL,
    required this.bgImageURL,
    required this.name,
    required this.profession,
    required this.vcfURL,
    required this.chatAgree,
    required this.meetingAgree,
    required this.presentAgree,
    required this.facebookLink,
    required this.instagramLink,
    required this.youtubeLink,
    required this.phoneNumber,
    required this.siteURL,
    required this.viberLink,
    required this.skypeLink,
    required this.tiktokLink,
  });

  late String cardID;
  late String dataLink;

  late String bgImageURL;
  late String avatarImageURL;
  late String name;
  late String profession;

  late String vcfURL;
  late bool meetingAgree;
  late bool presentAgree;
  late bool chatAgree;

  late String facebookLink;
  late String instagramLink;
  late String youtubeLink;
  late String phoneNumber;
  late String siteURL;
  late String viberLink;
  late String skypeLink;
  late String tiktokLink;

  BusinessCard.fromJson(Map<String, dynamic> json) {
    cardID = json['cardID'] ?? '';
    dataLink = json['dataLink'] ?? '';

    bgImageURL = json['bgImageURL'] ?? '';
    avatarImageURL = json['avatarImageURL'] ?? '';
    name = json['name'] ?? '';
    profession = json['profession'] ?? '';

    vcfURL = json['vcfURL'] ?? '';
    meetingAgree = json['meetingAgree'] ?? false;
    presentAgree = json['presentAgree'] ?? false;
    chatAgree = json['chatAgree'] ?? false;

    facebookLink = json['facebookLink'] ?? '';
    instagramLink = json['instagramLink'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
    siteURL = json['siteURL'] ?? '';
    viberLink = json['viberLink'] ?? '';
    skypeLink = json['skypeLink'] ?? '';
    tiktokLink = json['tiktokLink'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final cardData = <String, dynamic>{};
    cardData['bgImageURL'] = bgImageURL;
    cardData['avatarImageURL'] = avatarImageURL;
    cardData['name'] = name;
    cardData['profession'] = profession;

    cardData['vcfURL'] = vcfURL;
    cardData['meetingAgree'] = meetingAgree;
    cardData['presentAgree'] = presentAgree;
    cardData['chatAgree'] = chatAgree;

    cardData['facebookLink'] = facebookLink;
    cardData['instagramLink'] = instagramLink;
    cardData['phoneNumber'] = phoneNumber;
    cardData['siteURL'] = siteURL;
    cardData['viberLink'] = viberLink;
    cardData['skypeLink'] = skypeLink;
    cardData['tiktokLink'] = tiktokLink;
    return cardData;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor:Color(0xff1d1f20),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.1),
          child: Column(
            children: [
              SizedBox(height:MediaQuery.of(context).size.height*0.01),
              AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50),
                  ),
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,

                  //change your color here
                ),

                backgroundColor:Color(0xffF4D657),// Color(0xff1c1c1c),
                title: Text('PRIVACY POLICY',
                  textAlign: TextAlign.center,
                  style: TextStyle(

                    color: Color(0xff1c1c1c),
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Color(0xffF4D657),
                        offset: Offset(0, 0),
                      ),],
                  ),),

                centerTitle: true,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Padding(

              padding:  const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Last updated 04 June 2021",
                    style: TextStyle(
                      color: Color(0xffd3b53f),
                      fontSize: 16,
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("Thank you for choosing to be a part of our community of MANYS TRACKER USERS. We are commited to protecting your personal information and your right to privacy. If you have any questions or concerns about the privacy notice,or our practices with regards to your personal information please contact us at manys_support@gmail.com ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("When you visit our website \"MANYS_TRACKER.com\", use our mobil application, as the case may be \"MANYS TRACKER App\" and more generally, use any of ou services, we appreciate that you are trusting us with your personal information. We take your privacy very seriously. In this privacy notice, we seek to explain to you in the clearest way possible what information we collect, how we use it and what rights you have in relation to it. We hope you take some time to read through it carefully, as it isimportant. If there are any terms in this privacy notice that you do not agree with,please discontinue use of our Services immediately",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("This privacy notice applies to all information collected through our Services (which,  as described above, includes our Website and App), as well as, any related services, sales, marketing or event",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("Please read this privacy notice carefully as it will help you understand what we do with the information that we collect.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),

                  /////////////
                  ////////////
                  /////////////
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n1. WHAT INFORMATION DO WE COLLECT?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("Personal information you disclose to us",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 15,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("In Short: We collect personal information that you provide to us.\nWe collect personal information that you voluntarily provide to us when you register on the Services, express an interest in obtaining information about us or our products and Services, when you participate in activities on the Services orotherwise when you contact us.\n The personal information that we collect depends on the context of your interactions with us and the Services, the choices you make and the products and features you use. The personal information we collect may include the following:\nPersonal Information Provided by You. We collect names; phone numbers; email addresses; passwords; usernames; and other similar information.\nAll personal information that you provide to us must be true, complete and accurate, and you must notify us of any changes to such personal information.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\nInformation automatically collected",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 15,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("In Short: Some information — such as your Internet Protocol (IP) address and/or browser and device characteristics — is collected automatically when you visit our Services.\nWe automatically collect certain information when you visit, use or navigate the Services. This information does not reveal your specific identity (like your name or contact information) but may include device and usage information, such as your IP address, browser and device characteristics, operating system, language preferences, referring URLs, device name, country, location, information about how and when you use our Services and other technical information. This information is primarily needed to maintain the security and operation of our Services, and for our internal analytics and reporting purposes.\nLike many businesses, we also collect information through cookies and similar technologies.\n\nThe information we collect includes:\n\n      -Log and Usage Data. Log and usage data is service-related, diagnostic,  usage and performance information our servers automatically collect when you access or use our Services and which we record in log files. Depending on how you interact with us, this log data may include your IP address,  device information, browser type and settings and information about your activity in the Services (such as the date/time stamps associated with your usage, pages and files viewed, searches and other actions you take such as which features you use), device event information (such as system activity, error reports (sometimes called 'crash dumps') and hardware settings)\n      -Device Data. We collect device data such as information about your computer, phone, tablet or other device you use to access the Services. Depending on the device used, this device data may include information such as your IP address (or proxy server), device and application identification numbers, location, browser type, hardware model Internet service provider and/or mobile carrier, operating system and system configuration information.\n      -Location Data. We collect location data such as information about your device's location, which can be either precise or imprecise. How much information we collect depends on the type and settings of the device you use to access the Services. For example, we may use GPS and other technologies to collect geolocation data that tells us your current location (based on your IP address). You can opt out of allowing us to collect this information either by refusing access to the information or by disabling your Location setting on your device. Note however, if you choose to opt out, you may not be able to use certain aspects of the Services.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\nInformation collected through our App",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 15,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("In Short: We collect information regarding your geolocation, mobile device, push notifications, when you use our App.\n\nIf you use our App, we also collect the following information:\n\n      -Geolocation Information. We may request access or permission to and track location-based information from your mobile device, either continuously or   while you are using our App, to provide certain location-based services. If you wish to change our access or permissions, you may do so in your device's settings. \n      -Mobile Device Access. We may request access or permission to certain features from your mobile device, including your mobile device's camera, sms messages, social media accounts, storage, and other features. If you wish to change our access or permissions, you may do so in your device's settings.\n      -Mobile Device Data. We automatically collect device information (such as  your mobile device ID, model and manufacturer), operating system, version information and system configuration information, device and application identification numbers, browser type and version, hardware model Internet service provider and/or mobile carrier, and Internet Protocol (IP) address (or proxy server). If you are using our App, we may also collect information about the phone network associated with your mobile device, your mobile device’s operating system or platform, the type of mobile device you use, your mobile device’s unique device ID and information about the features of our App you accessed.\n      -Push Notifications. We may request to send you push notifications regarding your account or certain features of the App. If you wish to opt-out from receiving these types of communications, you may turn them off inyour device's settings.\nThis information is primarily needed to maintain the security and operation of our App, for troubleshooting and for our internal analytics and reporting purposes.",
                      textAlign: TextAlign.justify,
                      //  softWrap: true,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\n2. HOW DO WE USE YOUR INFORMATION?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\nIn Short: We process your information for purposes based on legitimate business interests, the fulfillment of our contract with you, compliance with our legal obligations, and/or your consent.\nWe use personal information collected via our Services for a variety of business purposes described below. We process your personal information for these purposes in reliance on our legitimate business interests, in order to enter into or perform a contract with you, with your consent, and/or for compliance with our legal obligations. We indicate the specific processing grounds we rely on next to each purpose listed below.\n\nWe use the information we collect or receive:\n\n      -To facilitate account creation and logon process. If you choose to link your account with us to a third-party account (such as your Google or Facebook account), we use the information you allowed us to collect from those third parties to facilitate account creation and logon process for the performance of the contract.\n      -To post testimonials. We post testimonials on our Services that may contain personal information. Prior to posting a testimonial, we will obtain your consent to use your name and the content of the testimonial. If you wish to update, or delete your testimonial, please contact us at __________ and be sure to include your name, testimonial location, and contact information.\n      -Request feedback. We may use your information to request feedback and to contact you about your use of our Services.      -To enable user-to-user communications. We may use your information in order to enable user-to-user communications with each user's consent.\n      -To manage user accounts. We may use your information for the purposes of managing our account and keeping it in working order.\n      -To send administrative information to you. We may use your personal information to send you product, service and new feature information and/or information about changes to our terms, conditions, and policies.\n      -To protect our Services. We may use your information as part of our efforts to keep our Services safe and secure (for example, for fraud monitoring and prevention).\n      -To enforce our terms, conditions and policies for business purposes,  to comply with legal and regulatory requirements or in connection with our contract.\n      -To respond to legal requests and prevent harm. If we receive a subpoena or other legal request, we may need to inspect the data we hold to determine how to respond.\n      -Fulfill and manage your orders. We may use your information to fulfill and manage your orders, payments, returns, and exchanges made through the Services.\n      -Administer prize draws and competitions. We may use your information to administer prize draws and competitions when you elect to participate in our competitions.\n      -To deliver and facilitate delivery of services to the user. We may use your information to provide you with the requested service.\n      -To respond to user inquiries/offer support to users. We may use your information to respond to your inquiries and solve any potential issues you might have with the use of our Services.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\n3. WILL YOUR INFORMATION BE SHARED WITH ANYONE?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("In Short: We only share information with your consent, to comply with laws, to provide you with services, to protect your rights, or to fulfill business obligations.\n\nWe may process or share your data that we hold based on the following legal basis:\n      -Consent: We may process your data if you have given us specific consent to use your personal information for a specific purpose.\n      -Legitimate Interests: We may process your data when it is reasonably necessary to achieve our legitimate business interests.\n      -Performance of a Contract: Where we have entered into a contract with you, we may process your personal information to fulfill the terms of our contract.\n      -Legal Obligations: We may disclose your information where we are legally required to do so in order to comply with applicable law, governmental requests, a judicial proceeding, court order, or legal process, such as in response to a court order or a subpoena (including in response to public authorities to meet national security or law enforcement requirements).\n      -Vital Interests: We may disclose your information where we believe it is necessary to investigate, prevent, or take action regarding potential violations of our policies, suspected fraud, situations involving potential threats to the safety of any person and illegal activities, or as evidence in litigation in which we are involved.\n\nMore specifically, we may need to process your data or share your personal information in the following situations:\n      -Business Transfers. We may share or transfer your information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company.\n      -Google Maps Platform APIs. We may share your information with certain Google Maps Platform APIs (e.g., Google Maps API, Place API). To find out more about Google’s Privacy Policy, please refer to this link. We obtain and store on your device ('cache') your location. You may revoke your consent anytime by contacting us at the contact details provided at the end of this document.\n      -Vendors, Consultants and Other Third-Party Service Providers. We may share your data with third-party vendors, service providers, contractors or agents who perform services for us or on our behalf and require access to such information to do that work. Examples include: payment processing,  data analysis, email delivery, hosting services, customer service and marketing efforts. We may allow selected third parties to use tracking technology on the Services, which will enable them to collect data on our behalf about how you interact with our Services over time. This information may be used to, among other things, analyze and track data, determine the popularity of certain content, pages or features, and better understand online activity. Unless described in this notice, we do not share, sell, rent or trade any of your information with third parties for their promotional purposes.",

                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\n4. WHO WILL YOUR INFORMATION BE SHARED WITH?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("In Short: We only share information with the following third parties.\nWe only share and disclose your information with the following third parties. If we have processed your data based on your consent and you wish to revoke your consent, please contact us using the contact details provided in the section below titled \"HOW CAN YOU CONTACT US ABOUT THIS NOTICE?\".",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\n5. DO WE USE COOKIES AND OTHER TRACKING TECHNOLOGIES?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("In Short: We may use cookies and other tracking technologies to collect and store your information.\n\nWe may use cookies and similar tracking technologies (like web beacons andpixels) to access or store information. Specific information about how we use such technologies and how you can refuse certain cookies is set out in our Cookie Notice.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        //  fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\n6. HOW LONG DO WE KEEP YOUR INFORMATION?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("In Short: We keep your information for as long as necessary to fulfill the purposes outlined in this privacy notice unless otherwise required by law.\n\n We will only keep your personal information for as long as it is necessary for the purposes set out in this privacy notice, unless a longer retention period is required or permitted by law (such as tax, accounting or other legal requirements). No purpose in this notice will require us keeping your personal information for longer than the period of time in which users have an account with us.\n When we have no ongoing legitimate business need to process your personal information, we will either delete or anonymize such information, or, if this is not possible (for example, because your personal information has been stored in backup archives), then we will securely store your personal information and isolate it from any further processing until deletion is possible.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\n7. HOW DO WE KEEP YOUR INFORMATION SAFE?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("In Short: We aim to protect your personal information through a system of organizational and technical security measures.\n"
                        "We have implemented appropriate technical and organizational security measures designed to protect the security of any personal information we process. However, despite our safeguards and efforts to secure your information, no electronic transmission over the Internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers,  cybercriminals, or other unauthorized third parties will not be able to defeat our security, and improperly collect, access, steal, or modify your information. Although we will do our best to protect your personal information, transmission of personal information to and from our Services is at your own risk. You should only access the Services within a secure environment.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\n8. WHAT ARE YOUR PRIVACY RIGHTS?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("In Short: You may review, change, or terminate your account at any time.\n"
                        "If you are a resident in the EEA or UK and you believe we are unlawfully processing your personal information, you also have the right to complain to your local data protection supervisory authority. You can find their contact details here: http://ec.europa.eu/justice/data-protection/bodies/authorities/index_en.htm.\n"
                        "If you are a resident in Switzerland, the contact details for the data protection authorities are available here: https://www.edoeb.admin.ch/edoeb/en/home.html. \n"
                        "If you have questions or comments about your privacy rights, you may email us at MANYS_support@gmail.com.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        //   fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\n9. CONTROLS FOR DO-NOT-TRACK FEATURES",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("Most web browsers and some mobile operating systems and mobile applications include a Do-Not-Track (\"DNT\") feature or setting you can activate to signal your privacy preference not to have data about your online browsing activities monitored and collected. At this stage no uniform technology standard for recognizing and implementing DNT signals has been finalized. As such, we do not currently respond to DNT browser signals or any other mechanism that automatically communicates your choice not to be tracked online. If a standard for online tracking is adopted that we must follow in the future, we will inform you about that practice in a revised version of this privacy notice.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\n10. DO CALIFORNIA RESIDENTS HAVE SPECIFIC PRIVACY RIGHTS?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("In Short: Yes, if you are a resident of California, you are granted specific rights regarding access to your personal information.\nIf you are under 18 years of age, reside in California, and have a registered account with a Service, you have the right to request removal of unwanted data that you publicly post on the Services. To request removal of such data, please contact us using the contact information provided below, and include the email address associated with your account and a statement that you reside in California. We will make sure the data is not publicly displayed on the Services,  but please be aware that the data may not be completely or comprehensively removed from all our systems (e.g. backups, etc.).",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\n11. DO WE MAKE UPDATES TO THIS NOTICE?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("In Short: Yes, we will update this notice as necessary to stay compliant with relevant laws. \nWe may update this privacy notice from time to time. The updated version will be indicated by an updated \"Revised\" date and the updated version will be effective as soon as it is accessible. If we make material changes to this privacy notice, we may notify you either by prominently posting a notice of such changes or by directly sending you a notification. We encourage you to review this privacy notice frequently to be informed of how we are protecting your information. ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("\n\n12. HOW CAN YOU CONTACT US ABOUT THIS NOTICE?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 16,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("If you have questions or comments about this notice, you may email us at MANYS_support@gmail.com or by post to:\n MANYS Tracker\n Oued Smar,Alger\n Alger 2988485\n Algeria\n",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("13. HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd3b53f),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("Based on the applicable laws of your country, you may have the right to request access to the personal information we collect from you, change that information, or delete it in some circumstances. To request to review, update, or delete your personal information, please visit: __________. ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        //  fontWeight: FontWeight.bold,
                        color: Color(0xffe3e3e3),
                        fontSize: 14,

                      ),),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}

import 'package:cebr/config/variable.dart';
import 'package:cebr/custom/text_component.dart';
import 'package:cebr/firebase/firebase_util.dart';
import 'package:cebr/model/faq.dart';
import 'package:cebr/pages/home.dart';
import 'package:cebr/widget/home_card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  Query faqQuery = databaseInstance.ref('faq').orderByChild('question');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: templateAppBar('FaQ'),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FirebaseAnimatedList(
            query: faqQuery, 
            itemBuilder: (context, snapshot, animation, index) {
              Map data = snapshot.value as Map;
              data['key'] = snapshot.key;
              Faq faq = Faq(
                index: data['key'],
                answer: data['answer'],
                question: data['question']
              );
              return FaqCardWidget(faq:faq);
            },
          ),
        ), 
    );
  }
}


class FaqCardWidget extends StatefulWidget {
  const FaqCardWidget({
    super.key, 
    required this.faq
  });
  final Faq faq;
  @override
  State<FaqCardWidget> createState() => _FaqCardWidgetState();
}

class _FaqCardWidgetState extends State<FaqCardWidget> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpened = !isOpened;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Card(
          color: primaryColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: notificationBorderColor, width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeaderFaqCardWidget(faq: widget.faq),
                isOpened == false
                    ? const SizedBox()
                    : AnswerFaqCardWidget(
                        faq: widget.faq, 
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnswerFaqCardWidget extends StatelessWidget {
  const AnswerFaqCardWidget({
    super.key,
    required this.faq,
  });

  final Faq faq;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 11.0),
      padding: const EdgeInsets.all(11.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: notificationFillColor,
          border: Border.all(color: notificationBorderColor)),
      width: double.infinity,
      child: textTemplate(faq.answer, fontColor, 12.0, 'PoppinsSemiBold')
    );
  }
}

class HeaderFaqCardWidget extends StatelessWidget {
  const HeaderFaqCardWidget(
      {super.key,
      required this.faq});

  final Faq faq;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
            future: faq.getImageFromStorage(),
            builder: (context, snapshot) {
              return PhotoCardWidget(
                url: snapshot.data ??
                    'https://www.cabinetmakerwarehouse.com/wp-content/uploads/9242-gull-grey.jpg',
                height: 60.0,
                width: 60.0,
                borderRadius: 8.0,
              );
            }),
        const SizedBox(
          width: 11.0,
        ),
        Expanded(
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: 40.0
              ),
              child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textTemplate(faq.question,fontColor,14.0,'PoppinsSemiBold'),
              ]
            ),
          )
        ),
      ],
    );
  }
}

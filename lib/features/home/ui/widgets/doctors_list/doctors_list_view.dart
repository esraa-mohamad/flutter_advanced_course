import 'package:flutter/material.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';

import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key,required this.doctorsList});

  final List<Doctors?>? doctorsList ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context , index){
          return DoctorsListViewItem(
              doctors: doctorsList![index]
          );
        }
        ),
    );
  }
}
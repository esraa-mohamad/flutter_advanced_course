import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';
import 'package:play_list_omar_ahmed/features/home/logic/home_cubit.dart';
import 'package:play_list_omar_ahmed/features/home/ui/widgets/speciality_list/speciality_list_view_item.dart';

// ignore: must_be_immutable
class SpecialityListView extends StatefulWidget {

  const SpecialityListView({super.key, required this.specializationDataList});

  final List<SpecializationDate?> specializationDataList ;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {

  var selectedSpecializationId = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationDataList.length,
        itemBuilder: (context , index){
          return
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedSpecializationId = index ;
                });
                context.read<HomeCubit>().getDoctorList(
                    specializationId: widget.specializationDataList[index]?.id
                );
              },
              child: SpecialityListViewItem(
                specializationDate:widget.specializationDataList[index],
                itemIndex: index,
                selectedIndex: selectedSpecializationId,
              ),
            );
        }
        ),
    );
  }
}
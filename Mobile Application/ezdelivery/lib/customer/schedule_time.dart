import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:duration_picker/duration_picker.dart';

class schedule_time extends StatefulWidget {
  const schedule_time({Key? key}) : super(key: key);

  @override
  State<schedule_time> createState() => _schedule_timeState();
}

class _schedule_timeState extends State<schedule_time> {
  DateTime dateTime=DateTime.now();
  Duration duration=const Duration(hours: 1);

  Future pickDateTime() async{
    DateTime? date=await pickDate();
    if(date==null)return;

    TimeOfDay? time=await pickTime();
    if(time==null)return;

    final dateTime=DateTime(
      date.year,date.month,date.day,time.hour,time.minute,
    );
    setState(()=>this.dateTime=dateTime);
  }

  Future<DateTime?> pickDate()=>showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 21)),
  );

  Future<TimeOfDay?> pickTime()=>showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor3,
      appBar: AppBar(
        backgroundColor: kAccentColor1,
        elevation: 8.0,
        toolbarHeight: 80.0,
        title: const Text(
          'Schedule Time',
          style: kSubSubjectStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(height: 15,),
                Row(
                  children: [
                    const Text('Out from ',style: kInstructionStyle2,),
                    TextButton(
                      child: Text(
                        '${dateTime.year}-${dateTime.month}-${dateTime.day}  ${dateTime.hour}:${dateTime.minute}',
                        style: kDetailsStyle,
                      ),
                      onPressed: () async{
                        await pickDateTime();
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Duration',style: kInstructionStyle2,),
                    TextButton(
                      child: Text(
                        duration.inHours.toString()+' hours',
                        style: kDetailsStyle,
                      ),
                      onPressed: () async{
                        Duration? durationSelected = await showDurationPicker(
                          context: context,
                          initialTime: duration,
                          baseUnit: BaseUnit.hour,
                        );
                        setState(()=>duration=durationSelected!);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                MaterialButton(
                  color: kAccentColor1,
                  height:40.0,
                  minWidth: double.infinity,
                  onPressed: () async {   },
                  child: const Text(
                    'Add off time',
                    style: kButtonTextStyle,
                  ),
                ),

            ],
            ),
          ),
      ),),
    );
  }
}

import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// ignore: must_be_immutable
class SlideBottomSheet extends StatefulWidget {
  String? formatDate;
  String? formatTime;
  final Function(DateRangePickerSelectionChangedArgs date) setDate;
  final Function(Time time) setTime;
  final VoidCallback onCreateTask;
  final Function(String title) onTextChange;
  SlideBottomSheet({
    super.key,
    required this.formatDate,
    required this.formatTime,
    required this.setDate,
    required this.setTime,
    required this.onCreateTask,
    required this.onTextChange,
  });

  @override
  State<SlideBottomSheet> createState() => _SlideBottomSheetState();
}

class _SlideBottomSheetState extends State<SlideBottomSheet> {
  final titleTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      child: SlidingUpPanel(
        color: Colors.white,
        minHeight: 70,
        maxHeight: 280,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        panel: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "เพิ่มกิจกรรม",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                onChanged: widget.onTextChange,
                controller: titleTextController,
                decoration: const InputDecoration(
                  hintText: "เพิ่มชื่อกิจกรรม",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          showPicker(
                            context: context,
                            iosStylePicker: true,
                            value: Time(
                                hour: DateTime.now().hour,
                                minute: DateTime.now().minute,
                                second: DateTime.now().second),
                            onChange: widget.setTime,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.timer,
                        color: Colors.black,
                      ),
                    ),
                    widget.formatTime == null || widget.formatTime!.isEmpty
                        ? const SizedBox()
                        : Text(widget.formatTime!),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 400,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Material(
                                          child: Text(
                                            "เลือกวันที่จะทำกิจกรรม",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.close),
                                        )
                                      ],
                                    ),
                                    Flexible(
                                      child: SizedBox(
                                        height: 350,
                                        width: 350,
                                        child: Card(
                                          child: SfDateRangePicker(
                                            backgroundColor: Colors.white,
                                            view: DateRangePickerView.month,
                                            selectionMode:
                                                DateRangePickerSelectionMode
                                                    .single,
                                            onSelectionChanged: widget.setDate,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                    widget.formatDate == null
                        ? const SizedBox()
                        : Text(widget.formatDate!)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {
                    widget.onCreateTask.call();
                    setState(() {
                      titleTextController.clear();
                      widget.formatDate = '';
                      widget.formatTime = '';
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Center(
                      child: Text(
                        "เพิ่มกิจกรรม",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

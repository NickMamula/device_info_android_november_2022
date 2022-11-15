import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:system_info/system_info.dart';

class PageOnes extends StatefulWidget {
  final String pageName;

  const PageOnes({
    required this.pageName,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PageOnesState();
}

class _PageOnesState extends State<PageOnes> {
  List<String> items = [];


  @override
  void initState() {
    super.initState();
    deviceInfo();
  }

  @override
  Widget build(BuildContext context)  {
    deviceInfo();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageName),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index],style: const TextStyle(fontFamily: 'Proximal', fontSize: 18),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
                thickness: 5,
                endIndent: 10,
                indent: 10,
              )),
    );
  }

   void deviceInfo() async  {
    const int MEGABYTE = 1024 * 1024;
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    items.add('Brand: ${androidDeviceInfo.manufacturer}.');
    items.add('Model phone: ${androidDeviceInfo.model}.');
    items.add('Build of Android: ${androidDeviceInfo.id}.');
    items.add('Chipset: ${androidDeviceInfo.hardware}.');
    items.add(
        'Screen resolution: ${(androidDeviceInfo.displayMetrics.widthPx).toInt()}x${(androidDeviceInfo.displayMetrics.heightPx).toInt()} pixels.');
    items.add(
        'Total physical memory: ${SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE} MB');
    items.add(
        'Free physical memory: ${SysInfo.getFreePhysicalMemory() ~/ MEGABYTE} MB');
    items.add(
        'Total virtual memory: ${SysInfo.getTotalVirtualMemory() ~/ MEGABYTE} MB');
    items.add(
        'Free virtual memory: ${SysInfo.getFreeVirtualMemory() ~/ MEGABYTE} MB');
    items.add(
        'Virtual memory size: ${SysInfo.getVirtualMemorySize() ~/ MEGABYTE} MB');
    items.add('Kernel architecture: ${SysInfo.kernelArchitecture}');
    items.add('Kernel bitness: ${SysInfo.kernelBitness}');
    items.add('Kernel name: ${SysInfo.kernelName}');
    items.add('User space bitness: ${SysInfo.userSpaceBitness}');
    final processors = SysInfo.processors;
    items.add('Number of processors    : ${processors.length}');

    setState((){});

     }
}

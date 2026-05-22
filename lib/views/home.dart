import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  bool isOn = false;
  String? selectedDropdown;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final _pageController = PageController(initialPage: 0);

  final _notchController = NotchBottomBarController(index: 0);

  @override
  void dispose() {
    _pageController.dispose();
    _notchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isOn ? Color(0xff051424) : Color(0xffF8F9FA),
      appBar: AppBar(
        title: Text(
          "Text Form Day 13",
          style: TextStyle(
            color: isOn ? Color(0xff6BFB9A) : Color(0xff041627),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isOn ? Color(0xff0D1C2D) : Color(0xffF8F9FA),
        iconTheme: IconThemeData(
          color: isOn ? const Color(0xff6BFB9A) : const Color(0xff041627),
        ),
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(
        //       100,
        //     ),
        //     child: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
        //   ),
        // ),
        actions: [
          Icon(
            Icons.notifications_active,
            color: isOn ? Color(0xff6BFB9A) : Color(0xff041627),
          ),
        ],
      ),

      drawer: Drawer(
        backgroundColor: isOn ? const Color(0xff0D1C2D) : Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: isOn ? const Color(0xff051424) : const Color(0xff1A2B3C),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.account_circle,
                        size: 60,
                        color: isOn ? Color(0xff6BFB9A) : Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Dukun Saldo User",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: isOn ? Color(0xff6BFB9A) : Color(0xff041627),
              ),
              title: Text(
                "Beranda",
                style: TextStyle(color: isOn ? Colors.white : Colors.black87),
              ),
              onTap: () {
                Navigator.pop(context); // Tutup drawer saat diklik
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: isOn ? Color(0xff6BFB9A) : Color(0xff041627),
              ),
              title: Text(
                "Pengaturan",
                style: TextStyle(color: isOn ? Colors.white : Colors.black87),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            child: Container(
              width: double.infinity,
              height: 204,
              decoration: BoxDecoration(
                color: isOn ? Color(0xff6BFB9A) : Color(0xff1A2B3C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Saldo Saat Ini",
                      style: TextStyle(
                        color: isOn ? Color(0xff005E2D) : Color(0xffB7C8DE),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Rp. 500.000.000",
                      style: TextStyle(
                        color: isOn ? Color(0xff005E2D) : Color(0xffFFFFFF),
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 24, top: 24),
            child: Row(
              children: [
                Switch(
                  value: isOn,
                  onChanged: (bool? value) {
                    setState(() {});
                    isOn = value ?? false;
                    // print(value);
                    // print(isOn);
                  },
                ),
                Text(
                  isOn ? "Light Mode" : "Dark Mode",
                  style: TextStyle(
                    color: isOn ? Color(0xff6BFB9A) : Color(0xff041627),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: selectedDropdown,
                  hint: Text(
                    "Pilih Kategori",
                    style: TextStyle(
                      color: isOn ? Color(0xff6BFB9A) : Color(0xff041627),
                    ),
                  ),
                  items: ["Pengeluaran", "Pemasukan", "Tabungan"].map((
                    String val,
                  ) {
                    return DropdownMenuItem(value: val, child: Text(val));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedDropdown = value;
                    });
                  },

                  dropdownColor: isOn ? Color(0xff1A2B3C) : Colors.white,
                  style: TextStyle(
                    color: isOn ? Color(0xff6BFB9A) : Color(0xff041627),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_today, size: 18),
                      label: const Text("Pilih Tanggal"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isOn
                            ? const Color(0xff6BFB9A)
                            : const Color(0xff1A2B3C),
                        foregroundColor: isOn
                            ? const Color(0xff005E2D)
                            : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: Text(
                        selectedDate != null
                            ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                            : "Tanggal belum dipilih",
                        style: TextStyle(
                          color: isOn
                              ? const Color(0xff6BFB9A)
                              : const Color(0xff041627),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        final TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            selectedTime = pickedTime;
                          });
                        }
                      },
                      icon: const Icon(Icons.access_time, size: 18),
                      label: const Text("Pilih Waktu"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isOn
                            ? const Color(0xff6BFB9A)
                            : const Color(0xff1A2B3C),
                        foregroundColor: isOn
                            ? const Color(0xff005E2D)
                            : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: Text(
                        selectedTime != null
                            ? selectedTime!.format(context)
                            : "Waktu belum dipilih",
                        style: TextStyle(
                          color: isOn
                              ? const Color(0xff6BFB9A)
                              : const Color(0xff041627),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ], // Penutup Column Body
      ),
    );
  }
}

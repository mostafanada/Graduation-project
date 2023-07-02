import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CustomizeSoundScreen extends StatefulWidget {
  @override
  State<CustomizeSoundScreen> createState() => _CustomizeSoundScreenState();
}

class _CustomizeSoundScreenState extends State<CustomizeSoundScreen> {
  List<String> sounds = [
    'Animal',
    'Dog',
    'Bark',
    'Yip',
    'Howl',
    'Bow-wow',
    'Growling',
    'Whimper (dog)',
    'Clip-clop ',
    'Neigh',
    'whinny',
    'Wild animals',
    'Roaring cats (lions, tigers)',
    'Roar',
    'Canidae',
    'dogs',
    'wolves',
    'Bee',
    'wasp',
    'etc',
    'Snake',
    'Whale vocalization',
    'Thunderstorm',
    'Thunder',
    'Fire',
    'Car',
    'Vehicle horn',
    'car horn',
    'honking',
    'Car alarm',
    'Tire squeal',
    'Car passing by',
    'Race car',
    'auto racing',
    'Truck',
    'Air brake',
    'Air horn',
    'truck horn',
    'Reversing beeps',
    'Bus',
    'Emergency vehicle',
    'Police car (siren)',
    'Ambulance (siren)',
    'Fire engine',
    'fire truck (siren)',
    'Train',
    'Rail transport',
    'Train horn',
    'Train whistle',
    'Railroad car',
    'train wagon',
    'Train wheels squealing',
    'Subway',
    'metro',
    'underground',
    'Slam',
    'Microwave oven',
    'Water tap',
    'faucet',
    'Sink (filling or washing)',
    'Bathtub (filling or washing)',
    'Alarm',
    'Siren',
    'Civil defense siren',
    'Buzzer',
    'Smoke detector',
    'smoke alarm',
    'Fire alarm',
    'Foghorn',
    'Whistle',
    'Steam whistle',
    'Explosion',
    'Gunshot',
    'gunfire',
    'Machine gun',
    'Fusillade',
    'Artillery fire',
    'Cap gun',
    'Fireworks',
    'Firecracker',
    'Burst',
    'pop',
    'Eruption',
    'Splash',
    'splatter',
    'Trickle',
    'dribble',
    'Boiling',
    'Bang',
    'Smash',
    'crash'
  ];
  SharedPreferences? prefs;
  List<String> soundContain = [
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
    'false',
  ];
  List<String> soundsAdded = [];
  String textCon = '';
  sharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    print(soundContain.length);
    print(sounds.length);
    sharedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        toolbarHeight: 120,
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
        centerTitle: true,
        title: Text(
          'Customize Sounds',
          style: TextStyle(
            fontSize: 32,
            color: Color(0xFF484852),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (text) {
                textCon = text;
                setState(() {});
              },
              enabled: true,
              cursorColor: Colors.black,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                  hintText: 'Search for your sound',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF484852),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF484852))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF484852))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF484852)))),
            ),
            SizedBox(
              height: 15,
            ),
            textCon.isEmpty
                ? Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: sounds.length,
                      itemBuilder: (context, index) => ListTile(
                          title: Text(
                            sounds[index],
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF676875),
                            ),
                          ),
                          trailing: Checkbox(
                            value: prefs
                                    ?.getStringList(
                                  'key',
                                )
                                    ?.map((e) {
                                  if (e == 'false') {
                                    return false;
                                  } else {
                                    return true;
                                  }
                                }).toList()[index] ??
                                false,
                            onChanged: (value) {
                              if (prefs
                                      ?.getStringList('sounds')
                                      ?.contains(sounds[index]) ==
                                  true) {
                                soundsAdded.remove(sounds[index]);
                                prefs?.setStringList('sounds', soundsAdded);
                                soundContain =
                                    prefs?.getStringList('key') ?? soundContain;
                                soundContain[index] = 'false';
                                prefs?.setStringList('key', soundContain);
                                setState(() {});
                              } else {
                                soundsAdded.add(sounds[index]);
                                prefs?.setStringList('sounds', soundsAdded);
                                soundContain =
                                    prefs?.getStringList('key') ?? soundContain;
                                soundContain[index] = 'true';
                                prefs?.setStringList('key', soundContain);
                                setState(() {});
                              }
                            },
                            checkColor: Colors.black,
                            activeColor: Color(0xFF8588C7),
                            fillColor:
                                MaterialStatePropertyAll(Color(0xFF8588C7)),
                            focusColor: Color(0xFF8588C7),
                            hoverColor: Color(0xFF8588C7),
                          )),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: sounds
                          .where((element) => element.startsWith(textCon))
                          .toList()
                          .length,
                      itemBuilder: (context, index) => ListTile(
                          title: Text(
                            sounds
                                .where((element) => element.startsWith(textCon))
                                .toList()[index],
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF676875),
                            ),
                          ),
                          trailing: Checkbox(
                            value: prefs
                                    ?.getStringList(
                                  'key',
                                )
                                    ?.map((e) {
                                  if (e == 'false') {
                                    return false;
                                  } else {
                                    return true;
                                  }
                                }).toList()[index] ??
                                false,
                            onChanged: (value) {
                              if (prefs
                                      ?.getStringList('sounds')
                                      ?.contains(sounds[index]) ==
                                  true) {
                                soundsAdded.remove(sounds[index]);
                                prefs?.setStringList('sounds', soundsAdded);
                                soundContain =
                                    prefs?.getStringList('key') ?? soundContain;
                                soundContain[index] = 'false';
                                prefs?.setStringList('key', soundContain);
                                setState(() {});
                              } else {
                                soundsAdded.add(sounds[index]);

                                prefs?.setStringList('sounds', soundsAdded);
                                soundContain =
                                    prefs?.getStringList('key') ?? soundContain;
                                soundContain[index] = 'true';
                                prefs?.setStringList('key', soundContain);
                                setState(() {});
                              }
                            },
                            checkColor: Colors.black,
                            activeColor: Color(0xFF8588C7),
                            fillColor:
                                MaterialStatePropertyAll(Color(0xFF8588C7)),
                            focusColor: Color(0xFF8588C7),
                            hoverColor: Color(0xFF8588C7),
                          )),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

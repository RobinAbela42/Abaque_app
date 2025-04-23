  // Length of the section wanted, in meters
  import 'dart:io';

num _length = 0;
  
  num get length {
    return (_length*100).round()/100;
  }

  set length(value) {
    if (value == null || null != num.tryParse(value.toString())) {
      _length = value;
    }
  }

  List<num> acceptableSections = [0, 1.5, 2.5,4, 6, 10, 16, 25, 35, 50, 70, 95, 120, 150, 185, 240 ];


  // Diameter of the section wanted, in Squares Milimeters
  num _section = 0;

  num get section {
    return _section;
  }

  set section(num value) {
    // bool sectionIsFound = false;
    // while(!sectionIsFound){
    //   int i = 0;
    //   var s = acceptableSections[i];
    //   if (value<=s){
    //     _section = s;
    //     sectionIsFound=true;
    //   }
    //   i++;
    // }
    _section = value;
  }

  // European electrical outlet's Voltage, in Volt
  num _voltage = 230;

  num get voltage {
    return _voltage;
  }

  set voltage(num value) {
    _voltage = value;
    _power=0;
    _intensity = 0;
  } 

  // Intensity of the installation, in Amps
  num _intensity = 0;

  num get intensity {
    return (_intensity*1000).round()/1000 ;
  }

  set intensity(num value) {
    _intensity = value;
    _power = voltage * intensity;
  }
  // Power of the installation, in Watt
  num _power = 0;

  num get power {
    return (_power*100).round()/100;
  }

  set power(num value) {
    _power = value;
    _intensity = power / voltage;
  }

  // Used material's resistance, copper by default since it's the most used, in Ohms
  num _resistance = 0.021;

  num get resistance {
    return _resistance;
  }

  set resistance(num value) {
    _resistance = value;
  }


num computeLength_1({section, intensity, voltage = 230, resistance = 0.021}) {
  return (voltage * section) / intensity * resistance;
}
num computeLength({section, intensity, voltage = 230, resistance = 0.021}) {
  return (voltage*0.02 * section) / (intensity * resistance *2);
}

num computeSection({length, intensity, voltage = 230, resistance = 0.021}) {
  return resistance * length * (intensity*0.8 / voltage*0.02);
}

num computeIntensity({section, length, voltage = 230, resistance = 0.021}) {
  return (voltage * section) / length * resistance;
}

num computeVoltage({section, length, intensity, resistance = 0.021}) {
  return (length * intensity * resistance) / section;
}


num stringToNum({str}) {
num res = 0;
if (str != null) {
  try {
    res = num.parse(str);
  } on Exception catch (_) {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       title: Text('Doit contenir des chiffres uniquement.'),
    //     );
    //   },
    // );
    return 0;
  }
  return res;
}
return 0;
}
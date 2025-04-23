// Supposed to be constants 

// Voltage drop is about 3%
num _voltageDrop = 3;

num get voltageDrop {
  return _voltageDrop/100;
}

set voltageDrop(num value) {
  _voltageDrop = value;
}

// Used material's resistance, copper by default since it's the most used, in Ohms
num _resistance = 0.021;

num get resistance {
  return _resistance;
}

set resistance(num value) {
  _resistance = value;
}



// Length of the section wanted, in meters

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
  num res = 0;

  for (var s in acceptableSections) {
    if (value <= s) {
      res = s;
      break;
    }
  }

  _section=res;



  // Iterable<num> rees = acceptableSections.map<num>((num s) {
  //   if (value >= s){
  //     res = s;
  //   }
  //   return 0;
  // });
  // bool sectionIsFound = false;
  // while(!sectionIsFound){
  //   int i = 0;
  //   var s = acceptableSections[i];
  //   if (value>=s){
  //     _section = s;
  //     sectionIsFound=true;
  //   }
  //   if (i==50){
  //     sectionIsFound=true;
  //   }
  //   i++;
  // }
  // _section = value;
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



num computeLength_1({section, intensity, voltage = 230, resistance = 0.021}) {
  return (voltage * section) / intensity * resistance;
}
num computeLength_2({section, intensity, voltage = 230, resistance = 0.021}) {
  return (voltage*voltageDrop * section) / (intensity * resistance *2);
}

num computeLength({section, intensity, voltage = 230, resistance = 0.021}) {
  return (((voltage*voltageDrop)*voltage * section)*0.8 / (power * resistance *2));
}

num computeSection({length, intensity, voltage = 230, resistance = 0.021}) {
  return (resistance * 2*length * power) / ((voltage*voltageDrop) * voltage*0.8);
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
    return 0;
  }
  return res;
}
return 0;
}
// What is defined by a Section
class Section {
  num? sec;
  num? overloadedThreshold;

  Section(this.sec, this.overloadedThreshold);
}

// Constants :

// Voltage drop is about 3%
num _voltageDrop = 3;

num get voltageDrop {
  return _voltageDrop / 100;
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

// Not constants anymore :

// Length of the section wanted, in meters
num _length = 0;

num get length {
  return (_length * 100).round() / 100;
}

set length(value) {
  if (value == null || null != num.tryParse(value.toString())) {
    _length = value;
  }
}

List<Section> acceptableSections = [
  Section(0, 0),
  Section(1.5, 16),
  Section(2.5, 20),
  Section(4, 27),
  Section(6, 32),
  Section(10, 45),
  Section(16, 64),
  Section(25, 82),
  Section(35, 91),
  Section(50, 110),
  Section(70, 130),
  Section(95, 190),
  Section(120, 210),
  Section(150, 240),
  Section(185, 270),
  Section(240, 320),
];

// Diameter of the section wanted, in Squares Milimeters
num _section = 0;

num get section {
  return _section;
}

set section(num value) {
  num res = 0;

  for (var s in acceptableSections) {
    if (value <= s.sec!) {
      res = s.sec!;
      break;
    }
  }

  _section = res;
}

// Constants of single-phase and tree-phase voltage
num treePhasedVoltage = 400;
num singlePhasedVoltage = 230;

// European electrical outlet's Voltage, in Volt
num _voltage = singlePhasedVoltage;

num get voltage {
  return _voltage;
}

set voltage(num value) {
  _voltage = value;
  _power = 0;
  _intensity = 0;
}

// Intensity of the installation, in Amps
num _intensity = 0;

num get intensity {
  return (_intensity * 1000).round() / 1000;
}

set intensity(num value) {
  _intensity = value;
  _power = voltage * intensity;
}

// Power of the installation, in Watt
num _power = 0;

num get power {
  return (_power * 100).round() / 100;
}

set power(num value) {
  _power = value;
  _intensity = power / voltage;
}

bool checkOverloadedError() {
  Section currentSection = acceptableSections.firstWhere(
    (s) => s.sec == section,
  );
  if (currentSection.sec != 0 &&
      intensity != 0 &&
      currentSection.overloadedThreshold! < intensity) {
    return true;
  }
  return false;
}

// num computeLength_1({section, intensity, voltage = 230, resistance = 0.021}) {
//   return (voltage * section) / intensity * resistance;
// }
// num computeLength_2({section, intensity, voltage = 230, resistance = 0.021}) {
//   return (voltage*voltageDrop * section) / (intensity * resistance *2);
// }

num computeLength({section, intensity, voltage = 230, resistance = 0.021}) {
  return (((voltage * voltageDrop) * voltage * section) *
      0.8 /
      (power * resistance * 2));
}

num computeSection({length, intensity, voltage = 230, resistance = 0.021}) {
  return (resistance * 2 * length * power) /
      ((voltage * voltageDrop) * voltage * 0.8);
}

num computeIntensity_1({section, length, voltage = 230, resistance = 0.021}) {
  return (voltage * section) / length * resistance;
}
num computeIntensity({section, length, voltage = 230, resistance = 0.021}) {
  return (section * (voltage*voltageDrop) *0.8 ) / (2* length * resistance);
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



String debugString ="";
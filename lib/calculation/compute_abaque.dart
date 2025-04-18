  // Length of the section wanted, in meters
  num _length = 0;
  
  num get length {
    return _length;
  }

  set length(value) {
    if (value == null || null != num.tryParse(value.toString())) {
      _length = value;
    }
  }

  // Diameter of the section wanted, in Squares Milimeters
  num _section = 0;

  num get section {
    return _section;
  }

  set section(num value) {
    _section = ((value * 10).round()) / 10;
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
    return _power;
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
  return resistance * length * (intensity / voltage);
}

num computeIntensity({section, length, voltage = 230, resistance = 0.021}) {
  return (voltage * section) / length * resistance;
}

num computeVoltage({section, length, intensity, resistance = 0.021}) {
  return (length * intensity * resistance) / section;
}

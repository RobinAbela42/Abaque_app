double computeLength({section, intensity, voltage = 230, resistance = 0.021}) {
  return (voltage * section) / intensity * resistance;
}

double computeSection({length, intensity, voltage = 230, resistance = 0.021}) {
  return resistance * length * (intensity / voltage);
}

double computeIntensity({section, length, voltage = 230, resistance = 0.021}) {
  return (voltage * section) / length * resistance;
}

double computeVoltage({section, length, intensity, resistance = 0.021}) {
  return (length * intensity * resistance) / section;
}

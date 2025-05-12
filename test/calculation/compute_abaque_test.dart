import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Compute intensity', () {
    group(
      "values that makes sense (normal length according to section, foreach section)",
      () {
        test('Compute intensity with section = 1,5 and length = 15', () {
          section = 1.5;
          length = 15;
          computeIntensity(section: section, length: length);
          expect(intensity, 13.143);
        });
        test('Compute intensity with section = 2,5 and length = 25', () {
          section = 2.5;
          length = 25;
          computeIntensity(section: section, length: length);
          expect(intensity, 13.143);
        });
        test('Compute intensity with section = 4 and length = 35', () {
          section = 4;
          length = 35;
          computeIntensity(section: section, length: length);
          expect(intensity, 15.02);
        });
        test('Compute intensity with section = 6 and length = 45', () {
          section = 6;
          length = 45;
          computeIntensity(section: section, length: length);
          expect(intensity, 17.524);
        });
        test('Compute intensity with section = 10 and length = 55', () {
          section = 10;
          length = 55;
          computeIntensity(section: section, length: length);
          expect(intensity, 23.896);
        });
        test('Compute intensity with section = 16 and length = 65', () {
          section = 16;
          length = 65;
          computeIntensity(section: section, length: length);
          expect(intensity, 32.352);
        });
        test('Compute intensity with section = 25 and length = 75', () {
          section = 25;
          length = 75;
          computeIntensity(section: section, length: length);
          expect(intensity, 43.81);
        });
        test('Compute intensity with section = 35 and length = 85', () {
          section = 35;
          length = 85;
          computeIntensity(section: section, length: length);
          expect(intensity, 54.118);
        });
        test('Compute intensity with section = 50 and length = 95', () {
          section = 50;
          length = 95;
          computeIntensity(section: section, length: length);
          expect(intensity, 69.173);
        });
        test('Compute intensity with section = 70 and length = 105', () {
          section = 70;
          length = 105;
          computeIntensity(section: section, length: length);
          expect(intensity, 87.619);
        });
        test('Compute intensity with section = 95 and length = 115', () {
          section = 95;
          length = 115;
          computeIntensity(section: section, length: length);
          expect(intensity, 108.571);
        });
        test('Compute intensity with section = 120 and length = 125', () {
          section = 120;
          length = 125;
          computeIntensity(section: section, length: length);
          expect(intensity, 126.171);
        });
        test('Compute intensity with section = 150 and length = 135', () {
          section = 150;
          length = 135;
          computeIntensity(section: section, length: length);
          expect(intensity, 146.032);
        });
        test('Compute intensity with section = 185 and length = 145', () {
          section = 185;
          length = 145;
          computeIntensity(section: section, length: length);
          expect(intensity, 167.685);
        });
        test('Compute intensity with section = 240 and length = 155', () {
          section = 240;
          length = 155;
          computeIntensity(section: section, length: length);
          expect(intensity, 203.502);
        });
      },
    );

    group('Minimum for the overloaded threshold to be triggered', () {
      test('Compute intensity with section = 1,5 and length = 12', () {
        section = 1.5;
        length = 12;
        computeIntensity(section: section, length: length);
        expect(intensity, 16);
      });
      test('Compute intensity with section = 2,5 and length = 16', () {
        section = 2.5;
        length = 16;
        computeIntensity(section: section, length: length);
        expect(intensity, 20);
      });
      test('Compute intensity with section = 4 and length = 19', () {
        section = 4;
        length = 19;
        computeIntensity(section: section, length: length);
        expect(intensity, 27);
      });
      test('Compute intensity with section = 6 and length = 24', () {
        section = 6;
        length = 24;
        computeIntensity(section: section, length: length);
        expect(intensity, 32);
      });
      test('Compute intensity with section = 10 and length = 29', () {
        section = 10;
        length = 29;
        computeIntensity(section: section, length: length);
        expect(intensity, 45);
      });
      test('Compute intensity with section = 16 and length = 32', () {
        section = 16;
        length = 32;
        computeIntensity(section: section, length: length);
        expect(intensity, 64);
      });
      test('Compute intensity with section = 25 and length = 40', () {
        section = 25;
        length = 40;
        computeIntensity(section: section, length: length);
        expect(intensity, 82);
      });
      test('Compute intensity with section = 35 and length = 50', () {
        section = 35;
        length = 50;
        computeIntensity(section: section, length: length);
        expect(intensity, 91);
      });
      test('Compute intensity with section = 50 and length = 59', () {
        section = 50;
        length = 59;
        computeIntensity(section: section, length: length);
        expect(intensity, 110);
      });
      test('Compute intensity with section = 70 and length = 70', () {
        section = 70;
        length = 70;
        computeIntensity(section: section, length: length);
        expect(intensity, 130);
      });
      test('Compute intensity with section = 95 and length = 65', () {
        section = 95;
        length = 65;
        computeIntensity(section: section, length: length);
        expect(intensity, 190);
      });
      test('Compute intensity with section = 120 and length = 75', () {
        section = 120;
        length = 75;
        computeIntensity(section: section, length: length);
        expect(intensity, 210);
      });
      test('Compute intensity with section = 150 and length = 82', () {
        section = 150;
        length = 82;
        computeIntensity(section: section, length: length);
        expect(intensity, 240);
      });
      test('Compute intensity with section = 185 and length = 90', () {
        section = 185;
        length = 90;
        computeIntensity(section: section, length: length);
        expect(intensity, 270);
      });
      test('Compute intensity with section = 240 and length = 98', () {
        section = 240;
        length = 98;
        computeIntensity(section: section, length: length);
        expect(intensity, 320);
      });
    });
    group(
      'Maximum length for the overloaded threshold for not being triggered',
      () {
        test('Compute intensity with section = 1,5  and length =13', () {
          section = 1.5;
          length = 13;
          computeIntensity(section: section, length: length);
          expect(intensity, 15.165);
        });
        test('Compute intensity with section = 2,5  and length =17', () {
          section = 2.5;
          length = 17;
          computeIntensity(section: section, length: length);
          expect(intensity, 19.328);
        });
        test('Compute intensity with section = 4  and length =20', () {
          section = 4;
          length = 20;
          computeIntensity(section: section, length: length);
          expect(intensity, 26.286);
        });
        test('Compute intensity with section = 6  and length =26', () {
          section = 6;
          length = 26;
          computeIntensity(section: section, length: length);
          expect(intensity, 30.33);
        });
        test('Compute intensity with section = 10  and length =30', () {
          section = 10;
          length = 30;
          computeIntensity(section: section, length: length);
          expect(intensity, 43.81);
        });
        test('Compute intensity with section = 16  and length =34', () {
          section = 16;
          length = 34;
          computeIntensity(section: section, length: length);
          expect(intensity, 61.849);
        });
        test('Compute intensity with section = 25  and length =41', () {
          section = 25;
          length = 41;
          computeIntensity(section: section, length: length);
          expect(intensity, 80.139);
        });
        test('Compute intensity with section = 35  and length =51', () {
          section = 35;
          length = 51;
          computeIntensity(section: section, length: length);
          expect(intensity, 90.196);
        });
        test('Compute intensity with section = 50  and length =60', () {
          section = 50;
          length = 60;
          computeIntensity(section: section, length: length);
          expect(intensity, 109.524);
        });
        test('Compute intensity with section = 70  and length =71', () {
          section = 70;
          length = 71;
          computeIntensity(section: section, length: length);
          expect(intensity, 129.577);
        });
        test('Compute intensity with section = 95  and length =66', () {
          section = 95;
          length = 66;
          computeIntensity(section: section, length: length);
          expect(intensity, 189.177);
        });
        test('Compute intensity with section = 120  and length =76', () {
          section = 120;
          length = 76;
          computeIntensity(section: section, length: length);
          expect(intensity, 207.519);
        });
        test('Compute intensity with section = 150  and length =83', () {
          section = 150;
          length = 83;
          computeIntensity(section: section, length: length);
          expect(intensity, 237.522);
        });
        test('Compute intensity with section = 185  and length =91', () {
          section = 185;
          length = 91;
          computeIntensity(section: section, length: length);
          expect(intensity, 267.19);
        });
        test('Compute intensity with section = 240  and length =99', () {
          section = 240;
          length = 99;
          computeIntensity(section: section, length: length);
          expect(intensity, 318.615);
        });
      },
    );
  });
  group("Compute Length", () {
    group("Little intensity foreach section", () {
      test('Compute length with section =  1,5  and intensity = 1', () {
        section =  1.5 ;
        intensity = 1;
        computeLength(section: section, intensity: intensity);
        expect(length, 197.14);
      });
      test('Compute length with section =  2,5  and intensity = 2', () {
        section =  2.5 ;
        intensity = 2;
        computeLength(section: section, intensity: intensity);
        expect(length, 164.29);
      });
      test('Compute length with section =  4  and intensity = 3', () {
        section =  4 ;
        intensity = 3;
        computeLength(section: section, intensity: intensity);
        expect(length, 175.24);
      });
      test('Compute length with section =  6  and intensity = 4', () {
        section =  6 ;
        intensity = 4;
        computeLength(section: section, intensity: intensity);
        expect(length, 197.14);
      });
      test('Compute length with section =  10  and intensity = 5', () {
        section =  10 ;
        intensity = 5;
        computeLength(section: section, intensity: intensity);
        expect(length, 262.86);
      });
      test('Compute length with section =  16  and intensity = 6', () {
        section =  16 ;
        intensity = 6;
        computeLength(section: section, intensity: intensity);
        expect(length, 350.48);
      });
      test('Compute length with section =  25  and intensity = 7', () {
        section =  25 ;
        intensity = 7;
        computeLength(section: section, intensity: intensity);
        expect(length, 469.39);
      });
      test('Compute length with section =  35  and intensity = 8', () {
        section =  35 ;
        intensity = 8;
        computeLength(section: section, intensity: intensity);
        expect(length, 575);
      });
      test('Compute length with section =  50  and intensity = 9', () {
        section =  50 ;
        intensity = 9;
        computeLength(section: section, intensity: intensity);
        expect(length, 730.16);
      });
      test('Compute length with section =  70  and intensity = 10', () {
        section =  70 ;
        intensity = 10;
        computeLength(section: section, intensity: intensity);
        expect(length, 920);
      });
      test('Compute length with section =  95  and intensity = 11', () {
        section =  95 ;
        intensity = 11;
        computeLength(section: section, intensity: intensity);
        expect(length, 1135.06);
      });
      test('Compute length with section =  120  and intensity = 12', () {
        section =  120 ;
        intensity = 12;
        computeLength(section: section, intensity: intensity);
        expect(length, 1314.29);
      });
      test('Compute length with section =  150  and intensity = 13', () {
        section =  150 ;
        intensity = 13;
        computeLength(section: section, intensity: intensity);
        expect(length, 1516.48);
      });
      test('Compute length with section =  185  and intensity = 14', () {
        section =  185 ;
        intensity = 14;
        computeLength(section: section, intensity: intensity);
        expect(length, 1736.73);
      });
      test('Compute length with section =  240  and intensity = 15', () {
        section =  240 ;
        intensity = 15;
        computeLength(section: section, intensity: intensity);
        expect(length, 2102.86);
      });
    });
    group('Coherent values foreach section', (){
      test('Compute length with section = 1.5 and intensity = 6.5', () {
        section = 1.5;
        intensity = 6.5;
        computeLength(section: section, intensity: intensity);
        expect(length, 30.33);
      });
      test('Compute length with section = 2.5 and intensity = 8', () {
        section = 2.5;
        intensity = 8;
        computeLength(section: section, intensity: intensity);
        expect(length, 41.07);
      });
      test('Compute length with section = 4 and intensity = 10', () {
        section = 4;
        intensity = 10;
        computeLength(section: section, intensity: intensity);
        expect(length, 52.57);
      });
      test('Compute length with section = 6 and intensity = 12', () {
        section = 6;
        intensity = 12;
        computeLength(section: section, intensity: intensity);
        expect(length, 65.71);
      });
      test('Compute length with section = 10 and intensity = 15', () {
        section = 10;
        intensity = 15;
        computeLength(section: section, intensity: intensity);
        expect(length, 87.62);
      });
      test('Compute length with section = 16 and intensity = 18', () {
        section = 16;
        intensity = 18;
        computeLength(section: section, intensity: intensity);
        expect(length, 116.83);
      });
      test('Compute length with section = 25 and intensity = 22', () {
        section = 25;
        intensity = 22;
        computeLength(section: section, intensity: intensity);
        expect(length, 149.35);
      });
      test('Compute length with section = 35 and intensity = 25', () {
        section = 35;
        intensity = 25;
        computeLength(section: section, intensity: intensity);
        expect(length, 184);
      });
      test('Compute length with section = 50 and intensity = 29', () {
        section = 50;
        intensity = 29;
        computeLength(section: section, intensity: intensity);
        expect(length, 226.6);
      });
      test('Compute length with section = 70 and intensity = 33', () {
        section = 70;
        intensity = 33;
        computeLength(section: section, intensity: intensity);
        expect(length, 278.79);
      });
      test('Compute length with section = 95 and intensity = 38', () {
        section = 95;
        intensity = 38;
        computeLength(section: section, intensity: intensity);
        expect(length, 328.57);
      });
      test('Compute length with section = 120 and intensity = 43', () {
        section = 120;
        intensity = 43;
        computeLength(section: section, intensity: intensity);
        expect(length, 366.78);
      });
      test('Compute length with section = 150 and intensity = 50', () {
        section = 150;
        intensity = 50;
        computeLength(section: section, intensity: intensity);
        expect(length, 394.29);
      });
      test('Compute length with section = 185 and intensity = 60', () {
        section = 185;
        intensity = 60;
        computeLength(section: section, intensity: intensity);
        expect(length, 405.24);
      });
      test('Compute length with section = 240 and intensity = 70', () {
        section = 240;
        intensity = 70;
        computeLength(section: section, intensity: intensity);
        expect(length, 450.61);
      });
    });
    group('Minimum threshold before overlaoded', (){
      test('Compute length with section = 1.5 and intensity = 16', () {
        section = 1.5;
        intensity = 16;
        computeLength(section: section, intensity: intensity);
        expect(length, 12.32);
      });
      test('Compute length with section = 2.5 and intensity = 20', () {
        section = 2.5;
        intensity = 20;
        computeLength(section: section, intensity: intensity);
        expect(length, 16.43);
      });
      test('Compute length with section = 4 and intensity = 27', () {
        section = 4;
        intensity = 27;
        computeLength(section: section, intensity: intensity);
        expect(length, 19.47);
      });
      test('Compute length with section = 6 and intensity = 32', () {
        section = 6;
        intensity = 32;
        computeLength(section: section, intensity: intensity);
        expect(length, 24.64);
      });
      test('Compute length with section = 10 and intensity = 45', () {
        section = 10;
        intensity = 45;
        computeLength(section: section, intensity: intensity);
        expect(length, 29.21);
      });
      test('Compute length with section = 16 and intensity = 64', () {
        section = 16;
        intensity = 64;
        computeLength(section: section, intensity: intensity);
        expect(length, 32.86);
      });
      test('Compute length with section = 25 and intensity = 82', () {
        section = 25;
        intensity = 82;
        computeLength(section: section, intensity: intensity);
        expect(length, 40.07);
      });
      test('Compute length with section = 35 and intensity = 91', () {
        section = 35;
        intensity = 91;
        computeLength(section: section, intensity: intensity);
        expect(length, 50.55);
      });
      test('Compute length with section = 50 and intensity = 110', () {
        section = 50;
        intensity = 110;
        computeLength(section: section, intensity: intensity);
        expect(length, 59.74);
      });
      test('Compute length with section = 70 and intensity = 130', () {
        section = 70;
        intensity = 130;
        computeLength(section: section, intensity: intensity);
        expect(length, 70.77);
      });
      test('Compute length with section = 95 and intensity = 190', () {
        section = 95;
        intensity = 190;
        computeLength(section: section, intensity: intensity);
        expect(length, 65.71);
      });
      test('Compute length with section = 120 and intensity = 210', () {
        section = 120;
        intensity = 210;
        computeLength(section: section, intensity: intensity);
        expect(length, 75.1);
      });
      test('Compute length with section = 150 and intensity = 240', () {
        section = 150;
        intensity = 240;
        computeLength(section: section, intensity: intensity);
        expect(length, 82.14);
      });
      test('Compute length with section = 185 and intensity = 270', () {
        section = 185;
        intensity = 270;
        computeLength(section: section, intensity: intensity);
        expect(length, 90.05);
      });
      test('Compute length with section = 240 and intensity = 320', () {
        section = 240;
        intensity = 320;
        computeLength(section: section, intensity: intensity);
        expect(length, 98.57);
      });
    });
    group('Maximum the overloaded threshold can handle', () {
      test('Compute length with section = 1.5 and intensity = 17', () {
        section = 1.5;
        intensity = 17;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });

      test('Compute length with section = 2.5 and intensity = 21', () {
        section = 2.5;
        intensity = 21;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 4 and intensity = 28', () {
        section = 4;
        intensity = 28;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 6 and intensity = 33', () {
        section = 6;
        intensity = 33;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 10 and intensity = 46', () {
        section = 10;
        intensity = 46;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 16 and intensity = 65', () {
        section = 16;
        intensity = 65;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 25 and intensity = 83', () {
        section = 25;
        intensity = 83;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 35 and intensity = 92', () {
        section = 35;
        intensity = 92;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 50 and intensity = 111', () {
        section = 50;
        intensity = 111;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 70 and intensity = 131', () {
        section = 70;
        intensity = 131;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 95 and intensity = 191', () {
        section = 95;
        intensity = 191;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 120 and intensity = 211', () {
        section = 120;
        intensity = 211;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 150 and intensity = 241', () {
        section = 150;
        intensity = 241;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 185 and intensity = 271', () {
        section = 185;
        intensity = 271;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
      test('Compute length with section = 240 and intensity = 321', () {
        section = 240;
        intensity = 321;
        expect(() => computeLength(section: section, intensity: intensity) , throwsA(TypeMatcher<RangeError>()));
      });
    });
  });
}

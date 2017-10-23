within AixLib.Fluid.Movers.Compressors.Utilities.VolumetricEfficiency;
package RotaryCompressors
  "Package that contains efficiency models for rotary compressors"
  extends Modelica.Icons.VariantsPackage;
  package SimilitudeTheory
    "Package that contains volumetric efficiency models based on similitude theory"
    extends Modelica.Icons.VariantsPackage;

    model Buck_R134aR450aR1234yfR1234zee_Rotary
      "Power - Similutude for R134a, R450a, R1234yf, R1234ze(e) - Rotary"
      extends PowerVolumetricEfficiency(
        final MRef=0.102032,
        final rotSpeRef=9.334,
        final powMod=Choices.VolumetricPowerModels.MendozaMirandaEtAl2016,
        final a=1.2,
        final b={-0.2678,-0.0106,0.7195});

    end Buck_R134aR450aR1234yfR1234zee_Rotary;
  end SimilitudeTheory;
end RotaryCompressors;
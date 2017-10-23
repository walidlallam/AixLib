within AixLib.Fluid.Movers.Compressors.BaseClasses;
partial model PartialEfficiency
  "Base model that is used to define all further efficiencies"

  // Definition of the medium used for calculations
  //
  replaceable package Medium =
    WorkingVersion.Media.Refrigerants.R134a.R134a_IIR_P1_395_T233_455_Horner
    constrainedby Modelica.Media.Interfaces.PartialTwoPhaseMedium
    "Medium of the model";

  // Definition of inputs
  //
  input Modelica.SIunits.Volume VDis(min=0)
    "Displacement volume";
  input Real piPre(min=0, unit="1")
    "Ratio of compressor's outlet and inlet pressure";
  input Modelica.SIunits.Frequency rotSpe(min=0)
    "Compressor's actual rotational speed";
  input Medium.ThermodynamicState staInl
    "Thermodynamic state at compressor's inlet";
  input Medium.ThermodynamicState staOut
    "Thermodynamic state at compressor's outlet";
  input Modelica.SIunits.Temperature TOut
    "Outdoor temperature";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false),
              graphics={
                Ellipse(
                  extent={{-90,-90},{90,90}},
                  lineThickness=0.25,
                  pattern=LinePattern.None,
                  lineColor={215,215,215},
                  fillColor={215,215,215},
                  fillPattern=FillPattern.Solid),
                Line(
                  points={{-40,60},{-30,70},{-20,60},{-20,60}},
                  color={0,0,0},
                  smooth=Smooth.Bezier,
                  thickness=0.5),
                Line(
                  points={{-20,60},{-20,-30},{-20,38},{-16,50},
                          {-6,58},{0,60},{6,58}},
                  color={0,0,0},
                  smooth=Smooth.Bezier,
                  thickness=0.5),
                Line(
                  points={{6,58},{16,50},{20,40},{20,-70},
                          {20,-70},{20,-70},{20,-70}},
                  color={0,0,0},
                  smooth=Smooth.Bezier,
                  thickness=0.5)}),
              Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(revisions="<html>
<ul>
  <li>
  October 20, 2017, by Mirko Engelpracht:<br/>
  First implementation
  (see <a href=\"https://github.com/RWTH-EBC/AixLib/issues/467\">issue 467</a>).
  </li>
</ul>
</html>"));
end PartialEfficiency;
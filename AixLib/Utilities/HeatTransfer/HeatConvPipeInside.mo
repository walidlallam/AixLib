within AixLib.Utilities.HeatTransfer;
model HeatConvPipeInside
  "Model for Heat Transfer through convection inside a pipe, based on Nussel Correlations"
  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;
  parameter Modelica.SIunits.Length length = 1 "length of total pipe";
  parameter Modelica.SIunits.Length d_i = 0.02 "inner diameter of pipe";
  parameter Modelica.SIunits.Length d_a = 0.025 "outer diameter of pipe";
  parameter Modelica.SIunits.Area A_sur = 2 "surfuce for heat transfer";
  parameter FastHVAC.Media.BaseClasses.MediumSimple medium=
      FastHVAC.Media.WaterSimple();
  Modelica.SIunits.ReynoldsNumber Re;
  Modelica.SIunits.Velocity v;
  Modelica.SIunits.NusseltNumber Nu;
  Modelica.SIunits.NusseltNumber Nu_lam_1;
  Modelica.SIunits.NusseltNumber Nu_lam_2;
  Modelica.SIunits.NusseltNumber Nu_lam;
  Modelica.SIunits.NusseltNumber Nu_tur;
  Modelica.SIunits.PrandtlNumber Pr;
  Modelica.SIunits.CoefficientOfHeatTransfer alpha;
  Real zeta "pressure loss coefficient";


  Modelica.Blocks.Interfaces.RealInput m_flow annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-4,108})));
equation
  v      =        4*m_flow/(Modelica.Constants.pi * d_i^2 * medium.rho);
  Re     =        medium.rho * v * d_i / medium.eta;
  Pr     =        medium.eta *medium.c /medium.lambda;
  zeta   =        (1.8*log10(max(1e-10,Re))-1.5)^(-2);
  Nu_lam_1 =      3.66;
  Nu_lam_2 =      1.615 * (Re*Pr*d_i/length)^(1/3);
  Nu_lam   =      (Nu_lam_1^3 + 0.7^3 + (Nu_lam_2 - 0.7)^3)^(1/3);
  Nu_tur   =      (zeta/8*Re*Pr)/(1+12.7*(zeta/8)^0.5*(Pr^(2/3)-1))*(1+(d_i/length)^(2/3));
  Nu       =      smooth(0,if Re<=2300 then Nu_lam else Nu_tur);
  alpha    =      Nu * medium.lambda /d_i;
  port_a.Q_flow = alpha * A_sur * (port_a.T - port_b.T);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=true,   extent={{-100,
            -100},{100,100}}),                                                                                                                                                                                                        graphics, lineColor = {0, 0, 0}, pattern = LinePattern.Solid, fillColor = {211, 243, 255}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}),                                                                                                                                                                                                        Icon(
      coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),                                                                                                                                                                                                        graphics={  Rectangle(extent = {{-76, 80}, {4, -80}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillColor = {211, 243, 255},
            fillPattern =                                                                                                   FillPattern.Solid), Rectangle(extent = {{-76, 80}, {84, -80}}, lineColor = {0, 0, 0}), Rectangle(extent = {{64, 80}, {84, -80}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {244, 244, 244},
            fillPattern =                                                                                                   FillPattern.Solid), Rectangle(extent = {{44, 80}, {64, -80}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {207, 207, 207},
            fillPattern =                                                                                                   FillPattern.Solid), Rectangle(extent = {{24, 80}, {44, -80}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {182, 182, 182},
            fillPattern =                                                                                                   FillPattern.Solid), Rectangle(extent = {{4, 80}, {24, -80}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {156, 156, 156},
            fillPattern =                                                                                                   FillPattern.Solid)}), Documentation(info = "<html>
 <h4><font color=\"#008000\">Overview</font></h4>
 <p>The <b>HeatConv</b> model represents the phenomenon of heat convection inside a pipe by a flowing medium.</p>
 <h4><font color=\"#008000\">Level of Development</font></h4>
 <p><img src=\"modelica://AixLib/Resources/Images/Stars/stars3.png\" alt=\"stars: 3 out of 5\"/></p>
 <h4><font color=\"#008000\">Example Results</font></h4>
 <p><a href=\"AixLib.Utilities.Examples.HeatTransfer_test\">AixLib.Utilities.HeatTransfer_test </a></p>
 </html>", revisions = "<html>
 <ul>
 <li><i>August 11, 2017;</i> by David Jansen:<br/></li>
 </ul>
 </html>"));
end HeatConvPipeInside;

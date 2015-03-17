within AixLib.Building.Components.Sources.InternalGains.Humans;


model HumanSensibleHeat_VDI2078
  "Model for sensible heat output after VDI 2078 "
  // Number of Persons
  parameter Integer ActivityType = 2 "Physical activity" annotation(Dialog(compact = true, descriptionLabel = true), choices(choice = 2 "light", choice = 3
        "moderate",                                                                                                    choice = 4 "heavy ", radioButtons = true));
  parameter Real NrPeople = 1.0 "Number of people in the room" annotation(Dialog(descriptionLabel = true));
  parameter Real RatioConvectiveHeat = 0.5
    "Ratio of convective heat from overall heat output"                                        annotation(Dialog(descriptionLabel = true));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a ConvHeat annotation(Placement(transformation(extent = {{80, 40}, {100, 60}})));
  Utilities.HeatTransfer.HeatToStar_Avar RadiationConvertor(eps = Emissivity_Human) annotation(Placement(transformation(extent = {{48, -22}, {72, 2}})));
  Utilities.Interfaces.Star RadHeat annotation(Placement(transformation(extent = {{80, -20}, {100, 0}})));
  Modelica.Blocks.Math.MultiProduct productHeatOutput(nu = 2) annotation(Placement(transformation(extent = {{-24, 10}, {-4, 30}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a TRoom
    "Air temperature in room"                                                         annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-90, 64})));
  Modelica.Blocks.Math.UnitConversions.To_degC to_degC annotation(Placement(transformation(extent = {{-82, 46}, {-72, 56}})));
  Modelica.Blocks.Interfaces.RealInput Schedule annotation(Placement(transformation(extent = {{-120, -40}, {-80, 0}}), iconTransformation(extent = {{-102, -22}, {-80, 0}})));
  Modelica.Blocks.Math.Gain Nr_People(k = NrPeople) annotation(Placement(transformation(extent = {{-66, -26}, {-54, -14}})));
  Modelica.Blocks.Math.Gain SurfaceArea_People(k = SurfaceArea_Human) annotation(Placement(transformation(extent = {{-16, -56}, {-4, -44}})));
  parameter Modelica.SIunits.Temperature T0 = Modelica.SIunits.Conversions.from_degC(22)
    "Initial temperature";
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = 1e+23, uMin = 1e-4) annotation(Placement(transformation(extent = {{8, -60}, {28, -40}})));
  Modelica.Blocks.Math.Gain gain(k = RatioConvectiveHeat) annotation(Placement(transformation(extent = {{6, 28}, {14, 36}})));
  Modelica.Blocks.Math.Gain gain1(k = 1 - RatioConvectiveHeat) annotation(Placement(transformation(extent = {{6, -12}, {14, -4}})));
protected
  parameter Modelica.SIunits.Area SurfaceArea_Human = 2;
  parameter Real Emissivity_Human = 0.98;
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow ConvectiveHeat(T_ref = T0) annotation(Placement(transformation(extent = {{18, 20}, {42, 44}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow RadiativeHeat(T_ref = T0) annotation(Placement(transformation(extent = {{18, -20}, {42, 4}})));
  Modelica.Blocks.Tables.CombiTable1D HeatOutput(table = [10, 100, 125, 155; 18, 100, 125, 155; 20, 95, 115, 140; 22, 90, 105, 120; 23, 85, 100, 115; 24, 75, 95, 110; 25, 75, 85, 105; 26, 70, 85, 95; 35, 70, 85, 95], smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableOnFile = false, columns = {ActivityType}) annotation(Placement(transformation(extent = {{-60, 40}, {-40, 60}})));
equation
  connect(ConvectiveHeat.port, ConvHeat) annotation(Line(points = {{42, 32}, {42, 50}, {90, 50}}, color = {191, 0, 0}, pattern = LinePattern.None, smooth = Smooth.None));
  connect(RadiativeHeat.port, RadiationConvertor.Therm) annotation(Line(points = {{42, -8}, {44, -8}, {44, -12}, {48, -12}, {48, -10}, {48.96, -10}}, color = {191, 0, 0}, pattern = LinePattern.None, smooth = Smooth.None));
  connect(RadiationConvertor.Star, RadHeat) annotation(Line(points = {{70.92, -10}, {90, -10}}, color = {95, 95, 95}, pattern = LinePattern.None, smooth = Smooth.None));
  connect(TRoom, temperatureSensor.port) annotation(Line(points = {{-90, 90}, {-90, 74}}, color = {191, 0, 0}, pattern = LinePattern.None, smooth = Smooth.None));
  connect(temperatureSensor.T, to_degC.u) annotation(Line(points = {{-90, 54}, {-84, 54}, {-84, 52}, {-83, 51}}, color = {0, 0, 127}, pattern = LinePattern.None, smooth = Smooth.None));
  connect(to_degC.y, HeatOutput.u[1]) annotation(Line(points = {{-71.5, 51}, {-67.75, 51}, {-67.75, 50}, {-62, 50}}, color = {0, 0, 127}, pattern = LinePattern.None, smooth = Smooth.None));
  connect(HeatOutput.y[1], productHeatOutput.u[1]) annotation(Line(points = {{-39, 50}, {-32, 50}, {-32, 23.5}, {-24, 23.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Schedule, Nr_People.u) annotation(Line(points = {{-100, -20}, {-67.2, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Nr_People.y, productHeatOutput.u[2]) annotation(Line(points = {{-53.4, -20}, {-32, -20}, {-32, 16.5}, {-24, 16.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Nr_People.y, SurfaceArea_People.u) annotation(Line(points = {{-53.4, -20}, {-32, -20}, {-32, -50}, {-17.2, -50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SurfaceArea_People.y, limiter.u) annotation(Line(points = {{-3.4, -50}, {6, -50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limiter.y, RadiationConvertor.A) annotation(Line(points = {{29, -50}, {44, -50}, {44, 16}, {60, 16}, {60, 0.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain.y, ConvectiveHeat.Q_flow) annotation(Line(points = {{14.4, 32}, {18, 32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain1.y, RadiativeHeat.Q_flow) annotation(Line(points = {{14.4, -8}, {18, -8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(productHeatOutput.y, gain.u) annotation(Line(points = {{-2.3, 20}, {2, 20}, {2, 32}, {5.2, 32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(productHeatOutput.y, gain1.u) annotation(Line(points = {{-2.3, 20}, {2, 20}, {2, -8}, {5.2, -8}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Icon(graphics={  Ellipse(extent = {{-36, 98}, {36, 26}}, lineColor = {255, 213, 170}, fillColor = {255, 213, 170},
            fillPattern =                                                                                                    FillPattern.Solid), Rectangle(extent = {{-48, 20}, {54, -94}}, fillColor = {255, 0, 0},
            fillPattern =                                                                                                    FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-40, -2}, {44, -44}}, lineColor = {255, 255, 255}, fillColor = {255, 0, 0},
            fillPattern =                                                                                                    FillPattern.Solid, textString = "ERC"), Ellipse(extent = {{-24, 80}, {-14, 70}}, fillColor = {0, 0, 0},
            fillPattern =                                                                                                    FillPattern.Solid, pattern = LinePattern.None, lineColor = {0, 0, 0}), Ellipse(extent = {{10, 80}, {20, 70}}, fillColor = {0, 0, 0},
            fillPattern =                                                                                                    FillPattern.Solid, pattern = LinePattern.None, lineColor = {0, 0, 0}), Line(points = {{-18, 54}, {-16, 48}, {-10, 44}, {-4, 42}, {2, 42}, {10, 44}, {16, 48}, {18, 54}}, smooth = Smooth.None, color = {0, 0, 0}, thickness = 1)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
 <h4><span style=\"color:#008000\">Overview</span></h4>
 <p>Model for heat output of a human according to VDI 2078 (Table A.1). The model only considers the dry heat emission and divides it into convective and radiative heat transmission. </p>
 <h4><span style=\"color:#008000\">Level of Development</span></h4>
 <p><img src=\"modelica://AixLib/Images/stars3.png\" alt=\"stars: 3 out of 5\"/></p>
 <h4><span style=\"color:#008000\">Concept</span></h4>
 <p>It is possible to choose between several types of physical activity.</p>
 <p>The heat output depends on the air temperature in the room where the activity takes place.</p>
 <p>A schedule of the activity is also required as constant presence of people in a room is not realistic. The schedule describes the presence of only one person, and can take values from 0 to 1. </p>
 <h4><span style=\"color:#008000\">Assumptions</span></h4>
 <p>The surface for radiation exchange is computed from the number of persons in the room, which leads to a surface area of zero, when no one is present. In particular cases this might lead to an error as depending of the rest of the system a division by this surface will be introduced in the system of equations -&gt; division by zero. For this reson a limitiation for the surface has been intoduced: a minimum of 1e-4 m2 and a maximum of 1e+23 m2 (only needed for a complete parametrization of the model). </p>
 <h4><span style=\"color:#008000\">References</span></h4>
 <p>VDI 2078: Calculation of cooling load and room temperatures of rooms and buildings (VDI Cooling Load Code of Practice) - March 2012</p>
 <h4><span style=\"color:#008000\">Example Results</span></h4>
 <p><a href=\"AixLib.Building.Components.Examples.Sources.InternalGains.Humans\">AixLib.Building.Components.Examples.Sources.InternalGains.Humans</a> </p>
 <p><a href=\"AixLib.Building.Components.Examples.Sources.InternalGains.OneOffice\">AixLib.Building.Components.Examples.Sources.InternalGains.OneOffice</a></p>
 </html>", revisions = "<html>
 <ul>
 <li><i>Mai 19, 2014&nbsp;</i> by Ana Constantin:<br/>Uses components from MSL and respects the naming conventions</li>
 <li><i>April 10, 2014&nbsp;</i> by Ana Constantin:<br/>Added a lower positive limit to the surface area, so it won&apos;t lead to a division by zero</li>
 <li><i>May 07, 2013&nbsp;</i> by Ole Odendahl:<br/>Formatted documentation appropriately</li>
 <li><i>August 10, 2011</i> by Ana Constantin:<br/>implemented</li>
 </ul>
 </html>"));
end HumanSensibleHeat_VDI2078;

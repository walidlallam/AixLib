within AixLib.DataBase.Media.Refrigerants;
record BubbleDewStatePropertiesBaseDataDefinition
  "Base data definition for fitting coefficients of thermodynamic state 
  properties at bubble and dew line"
  extends Modelica.Icons.Record;

  parameter String name
  "Short description of the record"
  annotation (Dialog(group="General"));

  parameter Integer saturationPressure_nT
  "Number of terms for saturation pressure"
  annotation (Dialog(group="Saturation pressure"));
  parameter Real saturationPressure_n[:]
  "First coefficient for saturation pressure"
  annotation (Dialog(group="Saturation pressure"));
  parameter Real saturationPressure_e[:]
  "Second coefficient for saturation pressure"
  annotation (Dialog(group="Saturation pressure"));

  parameter Integer saturationTemperature_nT
  "Number of terms for saturation temperature"
  annotation (Dialog(group="Saturation temperature"));
  parameter Real saturationTemperature_n[:]
  "Fitting coefficients for saturation temperature"
  annotation (Dialog(group="Saturation temperature"));
  parameter Real saturationTemperature_iO[:]
  "Mean input (p) | Std input (p) | Mean output (T) | Std output (T)"
  annotation (Dialog(group="Saturation temperature"));

  parameter Integer bubbleDensity_nT
  "Number of terms for bubble density"
  annotation (Dialog(group="Bubble density"));
  parameter Real bubbleDensity_n[:]
  "Fitting coefficients for bubble density"
  annotation (Dialog(group="Bubble density"));
  parameter Real bubbleDensity_iO[:]
  "Mean input (T) | Std input (T) | Mean output (dl) | Std output (dl)"
  annotation (Dialog(group="Bubble density"));

  parameter Integer dewDensity_nT
  "Number of terms for dew density"
  annotation (Dialog(group="Dew density"));
  parameter Real dewDensity_n[:]
  "Fitting coefficients for dew density"
  annotation (Dialog(group="Dew density"));
  parameter Real dewDensity_iO[:]
  "Mean input (T) | Std input (T) | Mean output (dv) | Std output (dv)"
  annotation (Dialog(group="Dew density"));

  parameter Integer bubbleEnthalpy_nT
  "Number of terms for bubble enthalpy"
  annotation (Dialog(group="Bubble Enthalpy"));
  parameter Real bubbleEnthalpy_n[:]
  "Fitting coefficients for bubble enthalpy"
  annotation (Dialog(group="Bubble Enthalpy"));
  parameter Real bubbleEnthalpy_iO[:]
  "Mean input (p) | Std input (p) | Mean output (hl) | Std output (hl)"
  annotation (Dialog(group="Bubble Enthalpy"));

  parameter Integer dewEnthalpy_nT
  "Number of terms for dew enthalpy"
  annotation (Dialog(group="Dew Enthalpy"));
  parameter Real dewEnthalpy_n[:]
  "Fitting coefficients for dew enthalpy"
  annotation (Dialog(group="Dew Enthalpy"));
  parameter Real dewEnthalpy_iO[:]
  "Mean input (p) | Std input (p) | Mean output (hv) | Std output (hv)"
  annotation (Dialog(group="Dew Enthalpy"));

  parameter Integer bubbleEntropy_nT
  "Number of terms for bubble entropy"
  annotation (Dialog(group="Bubble Entropy"));
  parameter Real bubbleEntropy_n[:]
  "Fitting coefficients for bubble entropy"
  annotation (Dialog(group="Bubble Entropy"));
  parameter Real bubbleEntropy_iO[:]
  "Mean input (p) | Std input (p) | Mean output (sl) | Std output (sl)"
  annotation (Dialog(group="Bubble Entropy"));

  parameter Integer dewEntropy_nT
  "Number of terms for dew entropy"
  annotation (Dialog(group="Dew Entropy"));
  parameter Real dewEntropy_n[:]
  "Fitting coefficients for dew entropy"
  annotation (Dialog(group="Dew Entropy"));
  parameter Real dewEntropy_iO[:]
  "Mean input (p) | Std input (p) | Mean output (sv) | Std output (sv)"
  annotation (Dialog(group="Dew Entropy"));
  annotation (Documentation(revisions="<html>
<ul>
  <li>
  June 9, 2017, by Mirko Engelpracht:<br/>
  First implementation (see <a href=\"https://github.com/RWTH-EBC/AixLib/issues/408\">issue 408</a>).
  </li>
</ul>
</html>", info="<html>
<p>This record is a base data definition for fitting coefficients of the thermodynamic state properties at bubble and dew line. If these state properties are not expressed as fitted formula, the state properties at vapour-liquid equilibrium will be identified iteratively and, as a consequence, the computing time will rise (Thorade and Matthias, 2012). In order to reduce the computing time, the thermodynamic state properties are expressed as fitted formula based on the approach presented by Sangi et al. within their &QUOT;Fast_Propane&QUOT; model.</p>
<p>Sangi et al. used the <b>following fitting approaches</b>, which are also implemented within <a href=\"modelica://AixLib.Media.Refrigerants.Interfaces.TemplateHybridTwoPhaseMedium\">AixLib.Media.Refrigerants.Interfaces.TemplateHybridTwoPhaseMedium</a>:<br></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\" width=\"80%\"><tr>
<td VALIGN=\"MIDDLE\"><p><i>Saturation pressure</i></p></td>
<td VALIGN=\"MIDDLE\"><img src=\"modelica://AixLib/Resources/Images/DataBase/Media/Refrigerants/SaturationPressure.png\"/></td>
</tr>
<tr>
<td VALIGN=\"MIDDLE\"><p><i>Saturation temperature</i></p></td>
<td VALIGN=\"MIDDLE\"><img src=\"modelica://AixLib/Resources/Images/DataBase/Media/Refrigerants/SaturationTemperature.png\"/></td>
</tr>
<tr>
<td VALIGN=\"MIDDLE\"><p><i>Bubble density</i></p></td>
<td VALIGN=\"MIDDLE\"><img src=\"modelica://AixLib/Resources/Images/DataBase/Media/Refrigerants/BubbleDensity.png\"/></td>
</tr>
<tr>
<td VALIGN=\"MIDDLE\"><p><i>Dew density</i></p></td>
<td VALIGN=\"MIDDLE\"><img src=\"modelica://AixLib/Resources/Images/DataBase/Media/Refrigerants/DewDensity.png\"/></td>
</tr>
<tr>
<td VALIGN=\"MIDDLE\"><p><i>Bubble Enthalpy</i></p></td>
<td VALIGN=\"MIDDLE\"><img src=\"modelica://AixLib/Resources/Images/DataBase/Media/Refrigerants/BubbleEnthalpy.png\"/></td>
</tr>
<tr>
<td VALIGN=\"MIDDLE\"><p><i>Dew Enthalpy</i></p></td>
<td VALIGN=\"MIDDLE\"><img src=\"modelica://AixLib/Resources/Images/DataBase/Media/Refrigerants/DewEnthalpy.png\"/></td>
</tr>
<tr>
<td VALIGN=\"MIDDLE\"><p><i>Bubble Entropy</i></p></td>
<td VALIGN=\"MIDDLE\"><img src=\"modelica://AixLib/Resources/Images/DataBase/Media/Refrigerants/BubbleEntropy.png\"/></td>
</tr>
<tr>
<td VALIGN=\"MIDDLE\"><p><i>Dew Entropy</i></p></td>
<td VALIGN=\"MIDDLE\"><img src=\"modelica://AixLib/Resources/Images/DataBase/Media/Refrigerants/DewEntropy.png\"/></td>
</tr>
</table>
<p><br>As it can be seen, the fitted formulas consist basically of the coefficient e<sub>i</sub> as well as of the parameters Mean<sub>i</sub> and Std<sub>i</sub>. These coefficients are the fitting coefficients and must be obtained during a fitting procedure. While the fitting procedure, the formulas presented above are fitted to external data (e.g. NIST Refprop 9.1) and the fitting coefficients are determined.</p>
<p><b>Assumptions and limitations</b> </p>
<p>The fitting procedure is performed for a<b> predefined range of the external data</b> that is given in terms of, for example, temperature and pressure. As a consequence, the fitting coefficients are also just valid within the predefined range of external data.</p>
<p><b>References</b> </p>
<p>Thorade, Matthis; Saadat, Ali (2012): <a href=\"http://www.ep.liu.se/ecp/076/006/ecp12076006.pdf\">HelmholtzMedia - A fluid properties library</a>. In: <i>Proceedings of the 9th International Modelica Conference</i>; September 3-5; 2012; Munich; Germany. Link&ouml;ping University Electronic Press, S. 63&ndash;70.</p>
<p>Sangi, Roozbeh; Jahangiri, Pooyan; Klasing, Freerk; Streblow, Rita; M&uuml;ller, Dirk (2014): <a href=\"http://dx.doi.org/10.3384/ecp14096\">A Medium Model for the Refrigerant Propane for Fast and Accurate Dynamic Simulations</a>. In: <i>The 10th International Modelica Conference</i>. Lund, Sweden, March 10-12, 2014: Link&ouml;ping University Electronic Press (Link&ouml;ping Electronic Conference Proceedings), S. 1271&ndash;1275</p>
</html>"));
end BubbleDewStatePropertiesBaseDataDefinition;

within ArchetypePWH_allhidDIN.FwBlenheimstr6567Wachgebude;
model FwBlenheimstr6567Wachgebude
  "This is the simulation model of FwBlenheimstr6567Wachgebude with traceable ID 5"


AixLib.ThermalZones.ReducedOrder.Multizone.MultizoneEquipped multizone(
    buildingID=5,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start = 293.15,
    VAir = 2882.0,
    ABuilding=1048.0,
    ASurTot=5304.173962623446,
    numZones = 7,
    internalGainsMode = 1,
        use_C_flow = false,
        use_moisture_balance = false,
        redeclare package Medium = Modelica.Media.Air.SimpleAir,
    zoneParam = {
      FwBlenheimstr6567Wachgebude_DataBase.FwBlenheimstr6567Wachgebude_Office(),
      FwBlenheimstr6567Wachgebude_DataBase.FwBlenheimstr6567Wachgebude_Floor(),
      FwBlenheimstr6567Wachgebude_DataBase.FwBlenheimstr6567Wachgebude_Storage(),
      FwBlenheimstr6567Wachgebude_DataBase.FwBlenheimstr6567Wachgebude_Meeting(),
      FwBlenheimstr6567Wachgebude_DataBase.FwBlenheimstr6567Wachgebude_Restroom(),
      FwBlenheimstr6567Wachgebude_DataBase.FwBlenheimstr6567Wachgebude_ICT(),
      FwBlenheimstr6567Wachgebude_DataBase.FwBlenheimstr6567Wachgebude_Laboratory()
      },
  heatAHU=true,
  coolAHU=true,
  dehuAHU=true,
  huAHU=true,
  BPFDehuAHU=0.2,
  HRS=true,
  sampleRateAHU=1800,
  effFanAHU_sup=0.7,
  effFanAHU_eta=0.7,
  effHRSAHU_enabled=0.65,
  effHRSAHU_disabled=0.2,
  dpAHU_sup=800,
  dpAHU_eta=800,
  zone(ROM(extWallRC(thermCapExt(each der_T(fixed=true))),
           intWallRC(thermCapInt(each der_T(fixed=true))),floorRC
           (thermCapExt(each der_T(fixed=true))),roofRC(thermCapExt(each
           der_T(fixed=true))))),
   redeclare model corG =
        AixLib.ThermalZones.ReducedOrder.SolarGain.CorrectionGDoublePane,
  redeclare model AHUMod = AixLib.Airflow.AirHandlingUnit.AHU)
    "Multizone"
    annotation (Placement(transformation(extent={{32,-8},{52,12}})));

  AixLib.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
    calTSky=AixLib.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    computeWetBulbTemperature=false,
    filNam=Modelica.Utilities.Files.loadResource(
        "modelica://ArchetypePWH_allhidDIN/DEU_BW_Mannheim_107290_TRY2010_12_Jahr_BBSR.mos"))
    "Weather data reader"
    annotation (Placement(transformation(extent={{-82,30},{-62,50}})));

  Modelica.Blocks.Sources.CombiTimeTable tableInternalGains(
    tableOnFile=true,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    tableName="Internals",
    fileName=Modelica.Utilities.Files.loadResource(
        "modelica://ArchetypePWH_allhidDIN/FwBlenheimstr6567Wachgebude/InternalGains_FwBlenheimstr6567Wachgebude.txt"),
    columns=2:22)
    "Profiles for internal gains"
    annotation (Placement(transformation(extent={{72,-42},{56,-26}})));

  Modelica.Blocks.Sources.CombiTimeTable tableAHU(
    tableOnFile=true,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    tableName="AHU",
    columns=2:5,
    fileName=Modelica.Utilities.Files.loadResource(
        "modelica://ArchetypePWH_allhidDIN/FwBlenheimstr6567Wachgebude/AHU_FwBlenheimstr6567Wachgebude.txt"))
    "Boundary conditions for air handling unit"
    annotation (Placement(transformation(extent={{-64,-6},{-48,10}})));

  Modelica.Blocks.Sources.CombiTimeTable tableTSet(
    tableOnFile=true,
    tableName="Tset",
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    fileName=Modelica.Utilities.Files.loadResource(
        "modelica://ArchetypePWH_allhidDIN/FwBlenheimstr6567Wachgebude/TsetHeat_FwBlenheimstr6567Wachgebude.txt"),
    columns=2:8)
    "Set points for heater"
    annotation (Placement(transformation(extent={{72,-66},{56,-50}})));

    Modelica.Blocks.Sources.CombiTimeTable tableTSetCool(
      tableOnFile=true,
      tableName="Tset",
      extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
      fileName=Modelica.Utilities.Files.loadResource(
          "modelica://ArchetypePWH_allhidDIN/FwBlenheimstr6567Wachgebude/TsetCool_FwBlenheimstr6567Wachgebude.txt"),
      columns=2:8)
      "Set points for cooler"
    annotation (Placement(transformation(extent={{72,-90},{56,-74}})));

equation
  connect(weaDat.weaBus, multizone.weaBus) annotation (Line(
      points={{-62,40},{-32,40},{-32,6},{34,6}},
      color={255,204,51},
      thickness=0.5));

  connect(tableInternalGains.y, multizone.intGains)
    annotation (Line(points={{55.2,-34},{48,-34},{48,-9}}, color={0,0,127}));

  connect(tableAHU.y, multizone.AHU)
    annotation (Line(points={{-47.2,2},{14,2},{33,2}}, color={0,0,127}));

  connect(tableTSet.y, multizone.TSetHeat) annotation (Line(points={{55.2,-58},
          {36.8,-58},{36.8,-9}}, color={0,0,127}));

  connect(tableTSetCool.y, multizone.TSetCool) annotation (Line(points={{55.2,-58},
          {36.8,-58},{36.8,-9}}, color={0,0,127}));

  annotation (experiment(
      StartTime=0,
      StopTime=31536000,
      Interval=3600,
      Tolerance=0.0001,
      __Dymola_Algorithm="Cvode"),
      __Dymola_experimentSetupOutput(equidistant=true,
      events=false),
      __Dymola_Commands(file=
        "Resources/Scripts/Dymola/FwBlenheimstr6567Wachgebude/FwBlenheimstr6567Wachgebude.mos"
      "Simulate and Plot"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Line(points={{80,-82}}, color={28,108,200}),
        Rectangle(
          extent={{-80,20},{80,-80}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Line(
          points={{-80,20},{0,100},{80,20}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-52,-10},{62,-48}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="TB")}));
end FwBlenheimstr6567Wachgebude;

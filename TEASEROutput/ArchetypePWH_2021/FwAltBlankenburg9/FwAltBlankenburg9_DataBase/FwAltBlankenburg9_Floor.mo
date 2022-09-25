 
within ArchetypePWH_2021.FwAltBlankenburg9.FwAltBlankenburg9_DataBase;
record FwAltBlankenburg9_Floor "FwAltBlankenburg9_Floor"
  extends AixLib.DataBase.ThermalZones.ZoneBaseRecord(
    T_start = 293.15,
    withAirCap = true,
    VAir = 662.34,
    AZone = 189.24,
    hRad = 5.0,
    lat = 0.88645272708792,
    nOrientations = 6,
    AWin = {8.134142289024368, 8.134142289024368, 4.800663687253772, 4.800663687253772, 0.0, 0.0},
    ATransparent = {8.134142289024368, 8.134142289024368, 4.800663687253772, 4.800663687253772, 0.0, 0.0},
    hConWin = 2.6999999999999997,
    RWin = 0.006311084465506105,
    gWin = 0.7799999999999999,
    UWin= 3.0017821341055906,
    ratioWinConRad = 0.03,
    AExt = {64.01896547089112, 64.01896547089112, 37.78315056602269, 37.78315056602269, 54.4065, 54.4065},
    hConExt = 2.351706151809557,
    nExt = 1,
    RExt = {9.588616371798432e-05},
    RExtRem = 0.0048220352078583405 ,
    CExt = {109688075.11885853},
    AInt = 1001.3950000000002,
    hConInt = 2.4165354330708655,
    nInt = 1,
    RInt = {6.587551011898212e-05},
    CInt = {104176896.87915549},
    AFloor = 0.0,
    hConFloor = 0.0,
    nFloor = 1,
    RFloor = {0.00001},
    RFloorRem =  0.00001,
    CFloor = {0.00001},
    ARoof = 0.0,
    hConRoof = 0.0,
    nRoof = 1,
    RRoof = {0.00001},
    RRoofRem = 0.00001,
    CRoof = {0.00001},
    nOrientationsRoof = 1,
    tiltRoof = {0.0},
    aziRoof = {0.0},
    wfRoof = {0.0},
    aRoof = 0.0,
    aExt = 0.5,
    TSoil = 286.15,
    hConWallOut = 20.0,
    hRadWall = 4.999999999999999,
    hConWinOut = 19.999999999999996,
    hConRoofOut = 0.0,
    hRadRoof = 0.0,
    tiltExtWalls = {1.5707963267948966, 1.5707963267948966, 1.5707963267948966, 1.5707963267948966, 0.0, 0.0},
    aziExtWalls = {3.141592653589793, 0.0, 1.5707963267948966, -1.5707963267948966, 0.0, 0.0},
    wfWall = {0.19659027243698837, 0.19659027243698837, 0.11602499054252151, 0.11602499054252151, 0.17661199227248142, 0.0},
    wfWin = {0.3144284616229274, 0.3144284616229274, 0.18557153837707258, 0.18557153837707258, 0.0, 0.0},
    wfGro = 0.19815748176849876,
    specificPeople = 0.0,
    fixedHeatFlowRatePersons = 70,
    internalGainsMoistureNoPeople = 0.0,
    activityDegree = 1.2,
    ratioConvectiveHeatPeople = 0.5,
    internalGainsMachinesSpecific = 0.0,
    ratioConvectiveHeatMachines = 0.75,
    lightingPowerSpecific = 7.0,
    ratioConvectiveHeatLighting = 0.9,
    useConstantACHrate = false,
    baseACH = 0.2,
    maxUserACH = 1.0,
    maxOverheatingACH = {3.0, 2.0},
    maxSummerACH = {1.0, 283.15, 290.15},
    winterReduction = {0.2, 273.15, 283.15},
    maxIrr = {100.0, 100.0, 100.0, 100.0, 9999.9, 9999.9},
    shadingFactor = {1.0, 1.0, 1.0, 1.0, 1.0, 1.0},
    withAHU = false,
    minAHU = 0.0,
    maxAHU = 2.0,
    hHeat = 8912.778736052047,
    lHeat = 0,
    KRHeat = 100,
    TNHeat = 50,
    HeaterOn = true,
    hCool = 0,
    lCool = -8912.778736052047,
    KRCool = 10000,
    TNCool = 1,
    CoolerOn = false,
    withIdealThresholds = false,
    TThresholdHeater = 288.15,
    TThresholdCooler = 295.15);
end FwAltBlankenburg9_Floor;

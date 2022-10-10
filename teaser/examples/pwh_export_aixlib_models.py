"""Export PWH buildings from a TEASER
project to ready-to-run simulation models for Modelica library AixLib. These
models will only simulate using Dymola, the reason for this are state
machines that are used in one AixLib specific AHU model.
"""

import teaser.examples.pwh_generate_archetype as pwh_gen
import teaser.logic.utilities as utilities
import os
import pandas as pd


def pwh_export_aixlib(ds):
    # In pwh_generate_archetype we created a Project with three archetype
    # buildings to get this Project we rerun this example
    prj = pwh_gen.pwh_generate_archetype(ds)

    # To make sure the export is using the desired parameters you should
    # always set model settings in the Project.
    # Project().used_library_calc specifies the used Modelica library
    # Project().number_of_elements_calc sets the models order
    # For more information on models we'd like to refer you to the docs. By
    # default TEASER uses a weather file provided in
    # teaser.data.input.inputdata.weatherdata. You can use your own weather
    # file by setting Project().weather_file_path. However we will use default
    # weather file.
    # Be careful: Dymola does not like whitespaces in names and filenames,
    # thus we will delete them anyway in TEASER.

    # for CI testing purpose we set the reference result folder
    prj.dir_reference_results = utilities.get_full_path(
        os.path.join(
            "examples",
            "examplefiles",
            "ReferenceResults",
            "Dymola",
            "PWH_2021"))

    print(prj.dir_reference_results)

    prj.used_library_calc = 'AixLib'
    prj.number_of_elements_calc = 2
    prj.weather_file_path = utilities.get_full_path(              # Where do we get our weather data from?
        os.path.join(
            "data",
            "input",
            "inputdata",
            "weatherdata",
            "DEU_BW_Mannheim_107290_TRY2010_12_Jahr_BBSR.mos"))

    # To make sure the parameters are calculated correctly we recommend to
    # run calc_all_buildings() function
    prj.calc_all_buildings()

    # To export the ready-to-run models simply call Project.export_aixlib().
    # You can specify the path, where the model files should be saved.
    # None means, that the default path in your home directory
    # will be used. If you only want to export one specific building, you can
    # pass over the internal_id of that building and only this model will be
    # exported. In this case we want to export all buildings to our home
    # directory, thus we are passing over None for both parameters.
    path = prj.export_aixlib(
        internal_id=None,
        path="/mnt/KInsektDaten/teo/TEASER/TEASEROutput")

    return path

if __name__ == '__main__':

    # Load dataset from csv
    path_to_csv = "../../../PWH_Senercon_New_Version/data/all_hid/building_data_all_hid_DIN_norm_aktuelles_verbrauch.csv"
    ds = pd.read_csv(path_to_csv)
    #ds = ds[ds['year'] == 2021]  # for simplicity (only for pwh_fulldata)
    path = pwh_export_aixlib(ds)

    print(f"Exported PWH model to {path}")

"""Generate buildings from pwh_fulldata.csv
"""
from teaser.project import Project
import pandas as pd

def pwh_generate_archetype(ds):

    # To use the API instantiate the Project class and rename the Project. The
    # parameter load_data=True indicates that we load `iwu` typology archetype
    # data into our Project (e.g. for Material properties and typical wall
    # constructions. This can take a few seconds, depending on the size of the
    # used data base). Be careful: Dymola does not like whitespaces in names and
    # filenames, thus we will delete them anyway in TEASER.
    prj = Project(load_data=True)
    prj.name = "ArchetypePWH_2021"

    # There are two different types of archetype groups: residential and
    # non-residential buildings. Two API functions offer the opportunity to
    # generate specific archetypes.

    # To generate non-residential archetype buildings (in this case an
    # office and a laboratory (a.k.a. institute)) the function
    # Project.add_non_residential() is used. The meaning of compulsory parameters
    # does not differ from the residential archetype building.
    for i in range(len(ds)):
        prj.add_non_residential(
            method='bmvbs',
            usage='institute',                 # Is this the right type? for all the bldgs?
            name=ds.loc[i, 'objektname'],
            year_of_construction=1988,         # Do we have this?
            number_of_floors=4,                # Do we have this?
            height_of_floors=3.5,              # Do we have this?
            net_leased_area=ds.loc[i, 'area'])

    return prj


if __name__ == '__main__':

    # Load dataset from csv
    path_to_csv = "../../../PWH_Senercon_New_Version/data/pwh_fulldata.csv"
    ds = pd.read_csv(path_to_csv)
    ds = ds[ds['year'] == 2021]  # for simplicity

    prj = pwh_generate_archetype(ds)

    print("Generated PWH Archetype.")

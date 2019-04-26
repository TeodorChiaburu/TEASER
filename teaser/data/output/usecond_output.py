"""This module contains function to save UseConditions classes."""

import collections
import json
import warnings
import teaser.logic.utilities as utilities


def save_use_conditions(use_cond, data_class):
    """Documentation is missing.
    """
    if use_cond.usage in data_class.conditions_bind.keys():
        add_to_json = False
        warnings.warn("Usage already exist in this JSON, consider " +
                      "revising your inputs. The UseConditions is  " +
                      "NOT saved into JSON")
    else:
        add_to_json = True

    data_class.conditions_bind["version"] = "0.7"

    if add_to_json is True:
        data_class.conditions_bind[use_cond.usage] = collections.OrderedDict()
        data_class.conditions_bind[use_cond.usage][
            "typical_length"] = use_cond.typical_length
        data_class.conditions_bind[use_cond.usage][
            "typical_width"] = use_cond.typical_width
        data_class.conditions_bind[use_cond.usage][
            "with_heating"] = use_cond.with_heating
        data_class.conditions_bind[use_cond.usage][
            "with_cooling"] = use_cond.with_cooling
        data_class.conditions_bind[use_cond.usage][
            "persons"] = use_cond.persons
        data_class.conditions_bind[use_cond.usage][
            "ratio_conv_rad_persons"] = use_cond.ratio_conv_rad_persons
        data_class.conditions_bind[use_cond.usage][
            "machines"] = use_cond.machines
        data_class.conditions_bind[use_cond.usage][
            "ratio_conv_rad_machines"] = use_cond.ratio_conv_rad_machines
        data_class.conditions_bind[use_cond.usage][
            "lighting_power"] = use_cond.lighting_power
        data_class.conditions_bind[use_cond.usage][
            "ratio_conv_rad_lighting"] = use_cond.ratio_conv_rad_lighting
        data_class.conditions_bind[use_cond.usage][
            "use_constant_infiltration"] = use_cond.use_constant_infiltration
        data_class.conditions_bind[use_cond.usage][
            "infiltration_rate"] = use_cond.infiltration_rate
        data_class.conditions_bind[use_cond.usage][
            "max_user_infiltration"] = use_cond.max_user_infiltration
        data_class.conditions_bind[
            use_cond.usage][
            "max_overheating_infiltration"] = use_cond.max_overheating_infiltration
        data_class.conditions_bind[use_cond.usage][
            "max_summer_infiltration"] = use_cond.max_summer_infiltration
        data_class.conditions_bind[
            use_cond.usage][
            "winter_reduction_infiltration"] = use_cond.winter_reduction_infiltration
        data_class.conditions_bind[use_cond.usage][
            "min_ahu"] = use_cond.min_ahu
        data_class.conditions_bind[use_cond.usage][
            "max_ahu"] = use_cond.max_ahu
        data_class.conditions_bind[use_cond.usage][
            "with_ahu"] = use_cond.with_ahu
        data_class.conditions_bind[use_cond.usage][
            "heating_profile"] = use_cond.heating_profile.tolist()
        data_class.conditions_bind[use_cond.usage][
            "cooling_profile"] = use_cond.cooling_profile.tolist()
        data_class.conditions_bind[use_cond.usage][
            "persons_profile"] = use_cond.persons_profile.tolist()
        data_class.conditions_bind[use_cond.usage][
            "machines_profile"] = use_cond.machines_profile.tolist()
        data_class.conditions_bind[use_cond.usage][
            "lighting_profile"] = use_cond.lighting_profile.tolist()

    with open(utilities.get_full_path(data_class.path_uc), 'w') as file:
        file.write(json.dumps(
            data_class.conditions_bind,
            indent=4,
            separators=(',', ': ')))

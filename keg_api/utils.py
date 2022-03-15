import random
from . import config, db


def get_tavern_name_format():
    return db.get_random_row("tavern_name_formats", "format")


def get_tavern_name(template):
    import re

    pattern = '\[(adjective|noun|location)\]+'
    result = re.findall(pattern, template)
    translated = []

    for col in result:
        table = f"{col}s"
        translated.append({col: db.get_random_row(table, col)})

    i = 0
    while i < len(translated):
        for key in translated[i]:
            value = translated[i][key]
            template = template.replace(f"[{key}]", f"{value}", 1)
        i = i + 1

    return template


def get_random_gender():
    return random.choice(list(config.genders.items()))


def genderfy(output):
    gender = get_random_gender()

    return output


def generate():
    data = [
            "tavern_buildings",
            "tavern_locations",
            "tavern_environmental_flavour",
            "tavern_atmosphere",
            "tavern_main_activity",
            "tavern_owner",
            "tavern_relevant_activity",
            "tavern_tonights_menu",
            "tavern_condition_of_rooms",
            "tavern_cost_of_rooms"
            ]
    tavern_name = get_tavern_name(get_tavern_name_format())
    output = f'{tavern_name} is '

    for key in data:
        table = key
        col = config.content[key]['col']
        delimiter = config.content[key]['delimiter']
        row = db.get_random_row(table, col)

        output = output + f'{row}{delimiter}'

    output = genderfy(output)
    return output

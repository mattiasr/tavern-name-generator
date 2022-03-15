import sqlite3
import click

from . import config
from flask import current_app, g
from flask.cli import with_appcontext


def get_db():
    if 'db' not in g:
        g.db = sqlite3.connect(
                current_app.config['DATABASE'],
                detect_types=sqlite3.PARSE_DECLTYPES
                )
        g.db.row_factory = sqlite3.Row

    return g.db


def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()


def init_db():
    db = get_db()

    with current_app.open_resource('schema.sql') as f:
        db.executescript(f.read().decode('utf8'))


@click.command('init-db')
@with_appcontext
def init_db_command():
    """Clear the existing data and create new tables."""
    init_db()
    click.echo('Initialized the database.')

    click.echo('Loading data with content')
    for key in config.content:
        load_data_to_table(key, config.content[key]['col'])
        click.echo(f'Initialized {key}')


def init_app(app):
    app.teardown_appcontext(close_db)
    app.cli.add_command(init_db_command)


def load_data_to_table(table, column):
    db = get_db()

    with open(f'./keg_api/data/{table}.txt', 'r') as fh:
        for value in fh:
            value = value.strip()
            try:
                query = f"INSERT INTO {table} ({column}) VALUES (\"{value}\");"
                db.execute(query)
                db.commit()
            except db.IntegrityError:
                pass


def get_random_row(table, col):
    db = get_db()
    query = f"SELECT {col} FROM {table} ORDER BY RANDOM() LIMIT 1;"
    res = db.execute(query).fetchone()

    return res[col]

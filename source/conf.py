# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "Joao's cookbook"
copyright = '2025, Joao'
author = 'Joao'
version = "0.1"
release = "0.1.7"

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'sphinxcontrib.bibtex',
    'sphinx.ext.todo'
    ]

bibtex_bibfiles = ['refs.bib']
bibtex_default_style = 'plain'

templates_path = ['_templates']
exclude_patterns = []
todo_include_todos = False



# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'agogo'
html_static_path = ['_static']

# -- Options for latex output
latex_engine = 'lualatex'
latex_elements = {
    'fontpkg': 
r'''
\setmainfont{Tex Gyre Heros}
\setsansfont{DejaVu Sans}
\setmonofont{DejaVu Sans Mono}
''',
    'pointsize': '11pt',
    'papersize': 'a4paper',
}

# -- Options for epub output
# disable epub mimetype warnings
suppress_warnings = ["epub.unknown_project_files"]

try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

config = {
    'description' : 'Lexicon Project',
    'author' : 'Luke Nonyane',
    'url' : 'URL to get it at.',
    'download_url' : 'Where to download it.',
    'author_email' : 'nonyane18@gmail.com',
    'version' : '0.1',
    'install_requires' : ['nose'],
    'packages' : ['NAME'],
    'scripts' : [],
    'name' : 'lexicon'
}

setup(**config)

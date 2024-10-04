from setuptools import setup

setup(
    name='myip',
    version='1.0.0',
    py_modules=['myip'],  # Replace 'myip' with the name of your script/module
    install_requires=[
        'requests',  # Add your Python dependencies here
    ],
    entry_points={
        'console_scripts': [
            'myip=myip:main',  # Replace with the entry point for your script
        ],
    },
)


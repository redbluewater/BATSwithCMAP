"""
Author: Mohammad Dehghani Ashkezari <mdehghan@uw.edu>

Date: 2020-08-19

Function: Holds popular functions that are invoked across the project. 
KL updating to use with BATS data
18 June 2025
"""

import os, sys
from settings import DOC
import numpy as np
import pandas as pd
from colorama import Fore, Back, Style, init


def halt(msg):
        """
        Prints an error message and terminates the program.
        """
        msg = '\n' + msg
        init(convert=True)
        print(Fore.RED + msg, file=sys.stderr)    
        print(Style.RESET_ALL, end='')
        sys.exit(1)
        return



def makedir(directory):
    """
    Creates a new directory if doesn't exist.
    """
    if not os.path.exists(directory):
        os.makedirs(directory)
    return

def doc_datasets():
    """
    Gather up what little DOC data there are, start with Atlantic Ocean
    Each element is a tuple representing a dataset where the first element is the table name 
    and the second element is a list of field names to be retrieved. 
    For now, making this list manually as doing this with command line would be a pain since each dataset has its own naming.
    Do DOC/TOC and something else so I get a comparison
    """
    doc = []
    doc.append(("tblBATS_Bottle",["cruise_ID","TOC","phosphate"]))
    doc.append(("tblBATS_Bottle_Validation",["cruise_ID","TOC","phosphate"]))
    #doc.append(("tblGeotraces_Seawater_IDP2021v2",["cruise_id","DOC_D_CONC_BOTTLE","PHOSPHATE_D_CONC_BOTTLE"]))
    return doc
    
def environmental_datasets():
    """
    Compiles a dict of environmental vaiables to be colocalized with cyanobacteria measurements.
    Each item key represents the table name of the environmental dataset, and the item's value again is a dict 
    containing the variables names, tolerance parameters, and two flags indicating if the dataset has 'depth' column, 
    and if the dataset represents a climatology product, repectively. The tolerance parametrs specify the temporal [days], 
    latitude [deg], longitude [deg], and depth [m] tolerances, respectively. 
    KL trim down the list because just checking things out right now
    """
    envs = {
           "tblCHL_REP": {
                          "variables": ["chl"],
                          "tolerances": [4, 0.25, 0.25, 5],
                          "hasDepth": False,
                          "isClimatology": False
                          },
            "tblWOA_Climatology": {
                                   "variables": ["density_WOA_clim", "salinity_WOA_clim", "nitrate_WOA_clim", "phosphate_WOA_clim", "silicate_WOA_clim", "oxygen_WOA_clim"],
                                   "tolerances": [1, 0.75, 0.75, 5],
                                   "hasDepth": True,
                                   "isClimatology": True
                                   }
           }
    return envs


def env_vars():
    """
    Reurns a list of environmental variables to be colocalized with cyano observations.
    """
    envs = environmental_datasets()
    vars = []
    for _, env in envs.items():
        vars += env["variables"]
    return vars    



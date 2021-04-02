import pandas as pd
import numpy as np
import parc

def run_py_script(data):
  X = data
  parc1 = parc.PARC(X, jac_weighted_edges=False)
  parc1.run_PARC()
  parc_labels = parc1.labels
  return parc_labels

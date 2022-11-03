import panorama 
import cv2
import os
import numpy as np

# Read image sets
set1 = panorama.ler_conjunto_imagens("./set1")

# Compute pano imagens
pano1 = panorama.construir_panoramica(set1)

import panorama 
import cv2
import os
import numpy as np

# Read image sets
set1 = panorama.ler_conjunto_imagens("./set1")
set2 = panorama.ler_conjunto_imagens("../set2")
set3 = panorama.ler_conjunto_imagens("../set3")
set4 = panorama.ler_conjunto_imagens("../set4")

# Compute pano imagens
pano1 = panorama.construir_panoramica(set1)
pano2 = panorama.construir_panoramica(set2)
pano3 = panorama.construir_panoramica(set3)
pano4 = panorama.construir_panoramica(set4)

# Float conversion
pano1_float32 = np.float32(pano1)
pano2_float32 = np.float32(pano2)
pano3_float32 = np.float32(pano3)
pano4_float32 = np.float32(pano4)

# RGB conversion
pano1 = cv2.cvtColor(pano1_float32, cv2.COLOR_BGR2RGB)
pano2 = cv2.cvtColor(pano2_float32, cv2.COLOR_BGR2RGB)
pano3 = cv2.cvtColor(pano3_float32, cv2.COLOR_BGR2RGB)
pano4 = cv2.cvtColor(pano4_float32, cv2.COLOR_BGR2RGB)

# Save pano images
os.chdir("../")
cv2.imwrite("pano/pano1.jpeg", pano1)
cv2.imwrite("pano/pano2.jpeg", pano2)
cv2.imwrite("pano/pano3.jpeg", pano3)
cv2.imwrite("pano/pano4.jpeg", pano4)
import cv2
import numpy as np
import timeit
import matplotlib.pyplot as plt
import os
import sys
from imutils import paths
import warnings
warnings.filterwarnings("ignore")

def ler_conjunto_imagens(dir):
    """
    Importa uma pasta com imagens e salva como uma lista.

    Parâmetros:
                dir: Diretório da pasta com as imagens

    Retornos:    
                conjunto: Lista de imagens
    """
    # Lê os arquivos do diretório em ordem crescente
    arquivos = os.listdir(dir)
    arquivos.sort()
    os.chdir(dir)

    # Converte as imagens importadas para RGB
    conjunto = []
    for arquivo in arquivos:
      BGR_img = cv2.imread(arquivo)
      RGB_img = cv2.cvtColor(BGR_img, cv2.COLOR_BGR2RGB)
      conjunto.append(RGB_img)

    return conjunto



def imprimir_imagem(imagem):

      fig = plt.figure(figsize=(20,8))
      plt.imshow(imagem.astype("uint8"))
      plt.axis('off')
      plt.show()



def imprimir_conjunto(conjunto):

    for imagem in conjunto:
      imprimir_imagem(imagem)



def executar_SIFT(imagem, num_features, niveis_oitava, threshold_contraste, 
                  threshold_borda, sigma):
    """
    Detecta keypoints e calcula seus descritores.

    Parâmetros:
                vetor_imagens: Imagens usadas no método
                num_features : Num de melhores features a se manter
                niveis_oitava: Número de camada em cada oitava
                threshold_contraste: Limiar para filtrar features fracas em regiões de baixo contraste 
                threshold_borda: Limiar para filtar bordas
                sigma: sigma da gaussiana aplicado na imagem de entrada na oitava 0

    Retornos:    
                vetor_keypoints: Vetor com keypoints calculados
                vetor_descritores: Vetor com descritores calculados
    """
    # Inicializa o objeto SIFT_create com os parâmetros do método 
    SIFT = cv2.xfeatures2d.SIFT_create( nfeatures = num_features,
                                        nOctaveLayers = niveis_oitava,
                                        contrastThreshold = threshold_contraste,
                                        edgeThreshold = threshold_borda,
                                        sigma = sigma)

    # Chama o método do openCV que realiza o método SIFT
    keypoints, descritores = SIFT.detectAndCompute(imagem, None)

    return keypoints, descritores



def casar_imagens(descritores_imagem1, descritores_imagem2, ratio_threshold):
    """
    Encontra as k melhores casamentos para cada descritor de um conjunto de imagens.

    Parâmetros:
                descritores_imagem1
                descritores_imagem2
                ratio_threshold: Número de camada em cada oitava

    Retornos:    
                melhores_casamentos: Vetor com melhores casamentos
    """
    # Cria objeto BF Matcher
    bf = cv2.BFMatcher(cv2.NORM_L2, crossCheck=False)

    # Computa os casamentos e iniciliza lista para preencher
    # com os melhores casamentos após o teste de Lowe
    # Mantém as 2 melhores correspondências para cada keypoint
    casamentos = bf.knnMatch(descritores_imagem1, descritores_imagem2, 2)
    melhores_casamentos = []

    # Ratio Test proposto por Lowe
    # Itera pelos casamentos
    for m, n in casamentos:

        # Garantir que a distância esteja dentro 
        # de uma certa razão
        if m.distance < n.distance * ratio_threshold:
            melhores_casamentos.append(m)

    return melhores_casamentos



def calcular_homografia(imagem1, imagem2, num_features, niveis_oitava, threshold_contraste, 
                  threshold_borda, sigma, ratio_threshold, RANSAC_reproj, imprimir_etapas):       
    """
    Calcula a matriz de homografia.

    Parâmetros:
                imagem1: Imagem que é deformado pela homografia
                imagem2: Imagem pivot
                RANSAC_reproj: Erro máximo de reprojeção permitido para tratar um par de pontos como inlier
    Retornos:    
                matriz_homografia: Vetor com keypoints calculados
        
    """
    # Calcula keypoints e descritores utilizando SIFT
    keypoints_imagem1, descritores_imagem1 = executar_SIFT(imagem1, num_features, niveis_oitava, threshold_contraste, 
                  threshold_borda, sigma)
    
    keypoints_imagem2, descritores_imagem2 = executar_SIFT(imagem2, num_features, niveis_oitava, threshold_contraste, 
                  threshold_borda, sigma)

    # Plotar keypoints das duas imagens


    if(imprimir_etapas==True):
      plot1 = cv2.drawKeypoints(imagem1, keypoints_imagem1, 0, (255, 0, 0), flags=cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
      plot2 = cv2.drawKeypoints(imagem2, keypoints_imagem2, 0, (255, 0, 0), flags=cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
      plot_img = np.concatenate((plot1, plot2), axis=1)
      print("Imprimindo keypoints...")
      imprimir_imagem(plot_img)

    # Realiza o casamento entre keypoints das imagens
    casamentos = casar_imagens(descritores_imagem1, descritores_imagem2,ratio_threshold=ratio_threshold)

    # Plotar casamento das duas imagens
    plot_casamentos = cv2.drawMatches(imagem1, keypoints_imagem1, imagem2, keypoints_imagem2, casamentos[:100], None,
                                      matchColor=(255, 0, 0),  # draw matches in green color
                                      singlePointColor=None,
                                      flags=2)
    if(imprimir_etapas==True):
      print("Imprimindo casamentos...")
      imprimir_imagem(plot_casamentos)

    # Constrói conjunto de pontos com localizações dos
    # keypoints correspondentes em ambas as imagens
    pontos_imagem1 = [keypoints_imagem1[m.queryIdx].pt for m in casamentos]
    pontos_imagem2 = [keypoints_imagem2[m.trainIdx].pt for m in casamentos]

    # Converte formato dos pontos
    pontos_imagem1 = np.float32(pontos_imagem1).reshape(-1, 1, 2)
    pontos_imagem2 = np.float32(pontos_imagem2).reshape(-1, 1, 2)

    # Calcula a matriz de homografia 
    matriz_homografia, _ = cv2.findHomography(pontos_imagem1, pontos_imagem2, cv2.RANSAC, RANSAC_reproj)

    return matriz_homografia



def blendingMask(height, width, barrier, smoothing_window, left_biased=True):
    assert barrier < width


    mask = np.zeros((height, width))

    offset = int(smoothing_window / 2)
    print("Offset:", offset)

    try:
        if left_biased:
            mask[:, barrier - offset : barrier + offset + 1] = np.tile(
                np.linspace(1, 0, 2 * offset + 1).T, (height, 1)
            )
            mask[:, : barrier - offset] = 1
        else:
            mask[:, barrier - offset : barrier + offset + 1] = np.tile(
                np.linspace(0, 1, 2 * offset + 1).T, (height, 1)
            )
            mask[:, barrier + offset :] = 1

    except BaseException:
        if left_biased:
            mask[:, barrier - offset : barrier + offset + 1] = np.tile(
                np.linspace(1, 0, 2 * offset).T, (height, 1)
            )
            mask[:, : barrier - offset] = 1
        else:
            mask[:, barrier - offset : barrier + offset + 1] = np.tile(
                np.linspace(0, 1, 2 * offset).T, (height, 1)
            )
            mask[:, barrier + offset :] = 1

    return cv2.merge([mask, mask, mask])



def blending_panoramica(imagem2_rz, imagem1_warped, largura_imagem2, lado):
    """
    Dadas duas imagens alinhadas com descontinuidade entre as imagens,
    esta função produz uma suavização na sobreposição.

    Parâmetros:
                imagem2_rz
                imagem1_warped
                largura_imagem2: é a largura da imagem2 antes de redimensionar
                lado:

    Retornos:    
                panoramica: Imagem colada com a região de sobreposição suavizada
    """

    altura, largura, _ = imagem2_rz.shape
    janela_suavizacao = int(largura_imagem2 / 8)
    barrier = largura_imagem2 - int(janela_suavizacao / 2)
    print("Barrier:", barrier)
    print("janela_suavizacao:", janela_suavizacao)
    mascara1 = blendingMask(altura, largura, barrier, smoothing_window=janela_suavizacao, left_biased=True)

    mascara2 = blendingMask(altura, largura, barrier, smoothing_window=janela_suavizacao, left_biased=False)
 
  
    if lado == "esquerdo":
        imagem2_rz = cv2.flip(imagem2_rz, 1)
        imagem1_warped = cv2.flip(imagem1_warped, 1)
        imagem2_rz = imagem2_rz * mascara1
        imagem1_warped = imagem1_warped * mascara2
        panoramica = imagem1_warped + imagem2_rz
        panoramica = cv2.flip(panoramica, 1)

    else:
        imagem2_rz = imagem2_rz * mascara1
        imagem1_warped = imagem1_warped * mascara2
        panoramica = imagem1_warped + imagem2_rz

    return panoramica


def aplicar_transformacao(imagem1, imagem2, num_features, niveis_oitava, threshold_contraste, 
                  threshold_borda, sigma, ratio_threshold, RANSAC_reproj, imprimir_etapas):
    """
    Deforma a imagem 1 na imagem 2 utilizando matriz de homografia,
    calculando dimensões da imagem resultante e realizando uma translação.

    Parâmetros:
                imagem1
                imagem2

    Retornos:    
                panoramica_completa: Imagem colada
    """
    # Obtém matriz de homografia
    matriz_homografia = calcular_homografia(imagem1, imagem2, num_features, niveis_oitava, threshold_contraste, 
                  threshold_borda, sigma, ratio_threshold, RANSAC_reproj, imprimir_etapas = imprimir_etapas)


    # Obtém altura e largura das imagens
    altura_imagem1, largura_imagem1 = imagem1.shape[:2]
    altura_imagem2, largura_imagem2 = imagem2.shape[:2]

    # Extrai as coordenadas dos pontos de bordas das imagens
    coordenadas_imagem1 = [[0, 0], [0, altura_imagem1], [largura_imagem1, altura_imagem1], [largura_imagem1, 0]]
    coordenadas_imagem2 = [[0, 0], [0, altura_imagem2], [largura_imagem2, altura_imagem2], [largura_imagem2, 0]]

    #img_coordenadas = cv2.circle(imagem1, coordenadas_imagem1[0], 20, (0,0,255), -1)
    #img_coordenadas = cv2.circle(img_coordenadas, coordenadas_imagem1[1], 20, (0,0,255), -1)
    #img_coordenadas = cv2.circle(img_coordenadas, coordenadas_imagem1[2], 20, (0,0,255), -1)
    #img_coordenadas = cv2.circle(img_coordenadas, coordenadas_imagem1[3], 20, (0,0,255), -1)
    #imprimir_imagem(img_coordenadas)

    # Converte as coordenadas
    coordenadas_imagem1 = np.float32(coordenadas_imagem1).reshape(-1, 1, 2)
    coordenadas_imagem2 = np.float32(coordenadas_imagem2).reshape(-1, 1, 2)

    # Aplica a homografia nos pontos de borda da imagem 1
    # aplicando PerspectiveTransform() para transformar 
    # a perspectiva da imagem de origem fornecida para 
    # os pontos correspondentes na imagem de destino
    coordenadas_imagem1_ = cv2.perspectiveTransform(coordenadas_imagem1, matriz_homografia)

    # Concatena as coordenadas dos pontos de borda das imagens
    pts = np.concatenate((coordenadas_imagem1_, coordenadas_imagem2), axis=0)

    # Encontra máximo e mínimo das coordenadas 
    [xmin, ymin] = np.int64(pts.min(axis=0).ravel() - 0.5)
    [_, ymax] = np.int64(pts.max(axis=0).ravel() + 0.5)
    t = [-xmin, -ymin]

    # Ponto do canto superior esquerdo da imagem que aplica a matriz de homografia, 
    # Se tem coordenada x < 0
    # cola a imagem de origem do lado esquerdo, se não do lado direito
    if pts[0][0][0] < 0:
        lado = "esquerdo"
        largura_panoramica = largura_imagem2 + t[0]

    else:
        largura_panoramica = int(coordenadas_imagem1_[3][0][0])
        lado = "direito"

    # Calcula a altura da panoramica
    altura_panoramica = ymax - ymin

    # Translação
    Ht = np.array([[1, 0, t[0]], [0, 1, t[1]], [0, 0, 1]])
    imagem1_warped = cv2.warpPerspective(imagem1, Ht.dot(matriz_homografia), (largura_panoramica, altura_panoramica))

    if(imprimir_etapas==True):
      print("Imprimindo imagem 1 após transformação...")
      imprimir_imagem(imagem1_warped)

    # Calcula o tamanho de imagem2_rz, mesmo tamanho que imagem1_warped
    imagem2_rz = np.zeros((altura_panoramica, largura_panoramica, 3))
    if lado == "esquerdo":
        imagem2_rz[t[1] : altura_imagem1 + t[1], t[0] : largura_imagem2 + t[0]] = imagem2
    else:
        imagem2_rz[t[1] : altura_imagem1 + t[1], :largura_imagem2] = imagem2

    # Imprimir imagem2_rz
    if(imprimir_etapas==True):
      print("Imprimindo imagem2 depois de alinhamento...")
      imprimir_imagem(imagem2_rz)

    # Realiza o blending da panorâmica
    pano = blending_panoramica(imagem2_rz, imagem1_warped, largura_imagem2, lado)

    # Imprimir imagem após blending
    if(imprimir_etapas==True):
      print("Imprimindo colagem das imagens após o blending...")
      imprimir_imagem(pano)

    # Corta a região preta da imagem
    pano = realizar_crop(pano, altura_imagem2, pts)

    # Imprimir imagem após crop
    if(imprimir_etapas==True):
      print("Imprimindo colagem das imagens após o crop...")
      imprimir_imagem(pano)

    return pano


def colar_imagens(lista_imagens, num_features, niveis_oitava, threshold_contraste, 
                  threshold_borda, sigma, ratio_threshold, RANSAC_reproj, imprimir_etapas):
    """
    Escolhe a imagem do meio da lista, divide a lista em duas sub-listas,
    colando a imagem do meio com cada imagem nas 2 sub-listas.

    Parâmetros:
                lista_imagens

    Retornos:    
                panoramica_completa: Imagem colada
    """
    # Dividie a lista de imagens em duas sublistas
    # com a imagem central em comum
    n = int(len(lista_imagens) / 2 + 0.5)
    lista_esquerda = lista_imagens[:n]
    lista_direita = lista_imagens[n - 1 :]
    lista_direita.reverse()

    # Processa lista da esquerda
    while len(lista_esquerda) > 1:
        # Pega duas imagens da lista
        imagem2 = lista_esquerda.pop()
        imagem1 = lista_esquerda.pop()

        # Aplica transformação e adiciona na lista
        panoramica_esquerda = aplicar_transformacao(imagem1, imagem2, num_features, niveis_oitava, threshold_contraste, 
                  threshold_borda, sigma, ratio_threshold, RANSAC_reproj, imprimir_etapas = imprimir_etapas)
        
        panoramica_esquerda = panoramica_esquerda.astype("uint8")
        lista_esquerda.append(panoramica_esquerda)

    # Processa lista da direita
    while len(lista_direita) > 1:
        # Pega duas imagens da lista
        imagem2 = lista_direita.pop()
        imagem1 = lista_direita.pop()

        # Aplica transformação e adiciona na lista
        panoramica_direita = aplicar_transformacao(imagem1, imagem2, num_features, niveis_oitava, threshold_contraste, 
                  threshold_borda, sigma, ratio_threshold, RANSAC_reproj, imprimir_etapas = imprimir_etapas)
        
        panoramica_direita = panoramica_direita.astype("uint8")
        lista_direita.append(panoramica_direita)

    # Panoramica com maior largura recebe o resto da colagem
    # Se largura_panoramica_direita > largura_panoramica_esquerda, panoramica_direita é o destino. Se não, panoramica_esquerda
    if panoramica_direita.shape[1] >= panoramica_esquerda.shape[1]:
        panoramica_completa = aplicar_transformacao(panoramica_esquerda, panoramica_direita, num_features, niveis_oitava, threshold_contraste, 
                  threshold_borda, sigma, ratio_threshold, RANSAC_reproj, imprimir_etapas = imprimir_etapas)
    else:
        panoramica_completa = aplicar_transformacao(panoramica_direita, panoramica_esquerda, num_features, niveis_oitava, threshold_contraste, 
                  threshold_borda, sigma, ratio_threshold, RANSAC_reproj, imprimir_etapas = imprimir_etapas)
   
    return panoramica_completa



def realizar_crop(panoramica, altura_imagem_destino, cantos):
    """
    Realiza o crop da região preta da panorâmica, baseada na imagem de destino.

    Parâmetros:
                panoramica
                altura_imagem_destino
                cantos: Tupla com 4 cantos da imagem distorcida 
                        e 4 cantos da imagem de destino

    Retornos:    
                panoramica_completa: Imagem colada
    """
    # Encontra mínimo das coordenadas (x,y)
    [xmin, ymin] = np.int32(cantos.min(axis=0).ravel() - 0.5)
    t = [-xmin, -ymin]

    # Converte para inteiros
    cantos = cantos.astype(int)

    # Imagem distorcida concatenada no lado esquerdo da imagem de destino
    if cantos[0][0][0] < 0:
        n = abs(-cantos[1][0][0] + cantos[0][0][0])
        panoramica = panoramica[t[1] : altura_imagem_destino + t[1], n:, :]

    # Imagem distorcida concatenada no lado direto da imagem de destino
    else:
        if cantos[2][0][0] < cantos[3][0][0]:
            panoramica = panoramica[t[1] : altura_imagem_destino + t[1], 0 : cantos[2][0][0], :]

        else:
            panoramica = panoramica[t[1] : altura_imagem_destino + t[1], 0 : cantos[3][0][0], :]

    return panoramica



def construir_panoramica(conjunto, num_features = 0, niveis_oitava = 3, 
                  threshold_contraste = 0.04, threshold_borda = 10, sigma = 1.6,
                  ratio_threshold = 0.5, RANSAC_reproj = 5, imprimir_etapas = False):
  
    # Construção da panorâmica
    t_inicial = timeit.default_timer()
    panoramica = colar_imagens(conjunto, num_features, niveis_oitava, 
                  threshold_contraste, threshold_borda, sigma , ratio_threshold,
                  RANSAC_reproj, imprimir_etapas = imprimir_etapas)
    
    t_final = timeit.default_timer()

    # Apresentação dos resultados
    print("Fim do programa")
    print("Tempo de exeucação: {:.2f} segundos\n".format(t_final - t_inicial))

    print("--- Parâmetros ---")
    print("num_features: {}".format(num_features))
    print("niveis_oitava: {}".format(niveis_oitava))
    print("threshold_contraste: {}".format(threshold_contraste))
    print("threshold_borda: {}".format(threshold_borda))
    print("sigma: {}".format(sigma))
    print("ratio_threshold: {}".format(ratio_threshold))
    print("RANSAC_reproj: {}".format(RANSAC_reproj))

    return panoramica
import zmq
import configparser

# Ler arquivo de configuração
config = configparser.ConfigParser()
config.read('config.cfg')
ip_SUB = config['DEFAULT']['ip_SUB']
porta_XPUB = config['DEFAULT']['porta_XPUB']

endereco_XPUB = 'tcp://{}:{}'.format(ip_SUB, porta_XPUB)
#print("Endereço:", endereco_XPUB)
# Cria contexto
contexto = zmq.Context()

# Cria socket SUB
socket_SUB = contexto.socket(zmq.SUB)
socket_SUB.connect(endereco_XPUB)

# Ler tópico do canal
topico = input("Entre com o tópico: ")
topico = bytes(topico, encoding="ascii")

# Printar mensagem de entada no tópico
print("Você entrou no canal do tópico \"{}\"".format(topico.decode("ascii")))

# Apenas lê as mensagens do tópico escolhido
socket_SUB.setsockopt(zmq.SUBSCRIBE, topico)

# Loop de execução subscriber
while True:

    try:
            if socket_SUB.poll(timeout = 1000):
                # Lê mensagem recebida no tópico
                [topico, nome, mensagem] = socket_SUB.recv_multipart()

                # Printa mensagem recebida no tópico
                print("[{nome}]: {msg}".format(nome = nome.decode("ascii"), msg = mensagem.decode("ascii")))

    except (KeyboardInterrupt, EOFError):
        # Fecha o PUB se ler CTRL^C
        print("\nVocê saiu do canal do tópico \"{}\"".format(topico.decode("ascii")))
        break


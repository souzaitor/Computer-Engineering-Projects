import zmq
import configparser

# Ler arquivo de configuração
config = configparser.ConfigParser()
config.read('config.cfg')
ip_XPUB = config['DEFAULT']['ip_XPUB']
ip_XSUB = config['DEFAULT']['ip_XSUB']
porta_XPUB = config['DEFAULT']['porta_XPUB']
porta_XSUB = config['DEFAULT']['porta_XSUB']

endereco_XPUB = 'tcp://{}:{}'.format(ip_XPUB, porta_XPUB)
print("Endereco XPUB:", endereco_XPUB)
endereco_XSUB = 'tcp://{}:{}'.format(ip_XSUB, porta_XSUB)
print("Endereco XSUB:", endereco_XSUB)

# Cria contexto
contexto = zmq.Context()

# Cria socket XPUB 
socket_XPUB = contexto.socket(zmq.XPUB)
socket_XPUB.bind(endereco_XPUB)

# Cria socket XSUB
socket_XSUB = contexto.socket(zmq.XSUB)
socket_XSUB.bind(endereco_XSUB)

# Cria poller
poller = zmq.Poller()
poller.register(socket_XPUB, zmq.POLLIN)
poller.register(socket_XSUB, zmq.POLLIN)

# Loop de execução do broker
while True:
    # get evento
    evento = dict(poller.poll(1000))

    if socket_XPUB in evento:
        mensagem = socket_XPUB.recv_multipart()
        print("[BROKER] Socket XPUB recebeu: {}".format(mensagem))
        socket_XSUB.send_multipart(mensagem)

    if socket_XSUB in evento:
        mensagem = socket_XSUB.recv_multipart()
        print("[BROKER] Socket XSUB recebeu: {}".format(mensagem))
        socket_XPUB.send_multipart(mensagem)
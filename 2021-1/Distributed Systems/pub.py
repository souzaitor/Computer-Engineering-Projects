import zmq
import configparser

# Ler arquivo de configuração
config = configparser.ConfigParser()
config.read('config.cfg')
ip_PUB = config['DEFAULT']['ip_PUB']
porta_XSUB = config['DEFAULT']['porta_XSUB']

endereco_XSUB = 'tcp://{}:{}'.format(ip_PUB, porta_XSUB)
#print("Endereço:", endereco_XSUB)

# Criar contexto
contexto = zmq.Context()

# Cria socket PUB 
socket_PUB = contexto.socket(zmq.PUB)
socket_PUB.connect(endereco_XSUB)

# Ler nome do usuário
nome = input("Entre com o seu nome: ")
nome = bytes(nome, encoding="ascii")

# Ler tópico do canal
topico = input("Entre com o tópico: ")
topico = bytes(topico, encoding="ascii")

# Printar mensagem de entada no tópico
print("Você entrou no canal do tópico \"{}\"".format(topico.decode("ascii")))

# Loop de execução do publisher
while True:

    try:
        # Lê uma mensagem
        mensagem = input('-> ')

        # Converte para o formato de bytes
        mensagem = bytes(mensagem, encoding="ascii")

        # Envia mensagem para XSUB (broker)
        socket_PUB.send_multipart([topico, nome, mensagem])

    except (KeyboardInterrupt, EOFError):
        # Fecha o PUB se ler CTRL^C
        print("\nVocê saiu do canal do tópico \"{}\"".format(topico.decode("ascii")))
        break



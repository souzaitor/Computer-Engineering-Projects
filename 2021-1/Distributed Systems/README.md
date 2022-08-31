# Chat Zero MQ

Estre projeto apresenta uma implementação de um chat utilizando a biblioteca de mensagens assíncronas ZeroMQ e a arquitetura de sistemas distribuídos Publish–subscribe.

<div align ="center">
  
![fig14](https://user-images.githubusercontent.com/39158108/181029210-2793885d-6e8c-4fc4-97a9-ce8b1d27c93d.png)
  
</div>

Pub/Sub é um padrão clássico em que os remetentes de mensagens, chamados de publishers, não programam as mensagens para serem enviadas diretamente para receptores específicos, chamados de subscribers. As mensagens são publicadas sem o conhecimento do que ou se existe algum assinante desse conhecimento. O broker garante que as mensagens sejam entregar aos subscribers corretos.

As operações do chat foram baseadas no Linda Tuple Space: escrever em um tópico, ler de um tópico, mensagens são tuplas com tópico, remetente e conteúdo da mensagem.  

## 📋 Pré-requisitos

Antes de começar, verifique se você atendeu aos seguintes requisitos:
* [Python](https://docs.python.org/3/)
* [Zero MQ](https://zeromq.org/get-started/)

## ✍️ Instalando Chat Zero MQ

Para instalar o Chat Zero MQ, siga estas etapas:

* Baixe ou clone o repositório atual

* Altere os IPs e portas no documento `config.cfg`

## 💻 Usando Chat Zero MQ

O chat é utilizado com uma instância de `pub.py` e uma instância de `sub.py` para cada usuário.

É necessário também uma instância do `broker.py`

* As mensagens são lidas em `sub.py`
* As mensagens são enviadas em `pub.py`
* O encaminhamento das mensagens é feito em `broker.py`

Para usar Chat Zero MQ, siga estas etapas:
### Executando Broker
```python
python3 broker.py
```
* Pelo broker é possível ver o fluxo das mensagens entre publishers e subscribers
<div align ="center">
  
![broker](https://user-images.githubusercontent.com/39158108/181051276-d9d2bba5-1008-4fc9-81ab-3293227dae86.JPG)
  
</div>

### Executando Publisher
```python
python3 pub.py
```

* Pelo publisher é possível se inscrever em um tópico e enviar mensagens. 
* Envia mensagens para todos os subscribers que se inscreveram no tópico.
* Deve-se indicar o nome do usuário para que durante a leitura dos tópicos seja possível identificar o remetente da mensagem.
* Os comandos CTRL^D ou CTRL^C terminam a execução de publisher.py

### Executando Subscriber
```python
python3 sub.py
```
* Pelo subscriber é possível se inscrever em um tópico e receber mensagens.
* Recebe mensagens de todos os publishers que se inscreveram no tópico.
* Os comandos CTRL^D ou CTRL^C terminam a execução de publisher.py.

![Animação](https://user-images.githubusercontent.com/39158108/181025518-553780f6-12cc-43c9-97c9-184959b7c418.gif)

### Mais de um usuário em um tópico

![Animação2](https://user-images.githubusercontent.com/39158108/181056789-20b64e98-bdb9-4d87-b76d-cf1c41e4f0e7.gif)

### Leitura apenas do tópico inscrito

![Animação3](https://user-images.githubusercontent.com/39158108/181062666-97797e90-5416-4e58-b12d-d6fe762d7ca2.gif)

## 🤝 Colaboradores

Agradecemos às seguintes pessoas que contribuíram para este projeto:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/souzaitor">
        <img src="https://avatars.githubusercontent.com/souzaitor" width="100px;" alt="Foto do Iuri Silva no GitHub"/><br>
        <sub>
          <b>Heitor Souza</b>
        </sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/hugo-souza">
        <img src="https://avatars.githubusercontent.com/hugo-souza" width="100px;" alt="Foto do Mark Zuckerberg"/><br>
        <sub>
          <b>Hugo Souza</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

## 📝 Licença

Esse projeto está sob licença. Veja o arquivo [LICENÇA](https://github.com/souzaitor/sistdist-p1/blob/main/LICENSE) para mais detalhes.

[⬆ Voltar ao topo](#Chat-Zero-MQ)<br>

<h1 align="center"> Chat Zero MQ </h1>
<h3 align="center"> Project Assignment 1</h3>
<h3 align="center"> 1001503 - Distributed Systems (2022/1)</h3>
<h4 align="center"> <a href="https://site.dc.ufscar.br/"> DC - Department of Computing</a>  </h4>
<h4 align="center"> <a href="https://www.ufscar.br/">UFSCar - Universidade Federal de São Carlos</a>  </h4>


## 🔵 Introduction
This project presents an implementation of a chat using the ZeroMQ asynchronous messaging library and the Publish–subscribe distributed systems architecture.
<div align ="center">
  
![fig14](https://user-images.githubusercontent.com/39158108/181029210-2793885d-6e8c-4fc4-97a9-ce8b1d27c93d.png)
  
</div>

Pub/Sub is a classic pattern in which message senders, called publishers, do not schedule messages to be sent directly to specific receivers, called subscribers. Messages are published without the knowledge of what or if there is any subscriber to that knowledge. The broker ensures that messages are delivered to the correct subscribers.

Chat operations were based on Linda Tuple Space: write to a topic, read from a topic, messages are tuples with topic, sender and message content. 

## 🔵 Requirements

Before you start, make sure you've met the following requirements:
* [Python](https://docs.python.org/3/)
* [Zero MQ](https://zeromq.org/get-started/)

## 🔵 Installing Chat Zero MQ

To install Chat Zero MQ, follow these steps:

* Download or clone the current repo

* Change the IPs and ports in the document `config.cfg`

## 🔵 Using Chat Zero MQ

The chat is used with an instance of `pub.py` and an instance of `sub.py` for each user.

An instance of the `broker.py` is needed tp

* Messages are read in `sub.py`
* Messages are sent in `pub.py`
* The forwarding of messages is done in `broker.py`

To use Chat Zero MQ, follow these steps:

### Running Broker
```python
python3 broker.py
```
* Through the broker it is possible to see the flow of messages between publishers and subscribers
<div align ="center">
  
![broker](https://user-images.githubusercontent.com/39158108/181051276-d9d2bba5-1008-4fc9-81ab-3293227dae86.JPG)
  
</div>

### Running Publisher
```python
python3 pub.py
```

* From the publisher it is possible to subscribe to a topic and send messages. 
* Send messages to all subscribers who have subscribed to the topic.
* The user's name must be indicated so that during the reading of the topics it is possible to identify the sender of the message.
* CTRL^D or CTRL^C commands terminate execution of pub.py

### Running Subscriber
```python
python3 sub.py
```
* Through the subscriber it is possible to subscribe to a topic and receive messages.
* Receive messages from all publishers who have subscribed to the topic.
* CTRL^D or CTRL^C commands terminate execution of sub.py.

![Animação](https://user-images.githubusercontent.com/39158108/181025518-553780f6-12cc-43c9-97c9-184959b7c418.gif)

### More than one user on a topic

![Animação2](https://user-images.githubusercontent.com/39158108/181056789-20b64e98-bdb9-4d87-b76d-cf1c41e4f0e7.gif)

### Read only the subscribed topic

![Animação3](https://user-images.githubusercontent.com/39158108/181062666-97797e90-5416-4e58-b12d-d6fe762d7ca2.gif)

## 🔵 Authors

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

## 🔵 License

This project is under license. Acess the file [LICENSE](https://github.com/souzaitor/sistdist-p1/blob/main/LICENSE) for more details.

<div align="right"><a href="https://github.com/souzaitor/EnC/blob/main/README.md#projects"> ⬅️ Return to projects list</a></div>

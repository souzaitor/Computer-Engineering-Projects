import numpy as np
import scipy.signal


class Modem:
    def __init__(self, fs, bufsz, ans=False):
        
        self.fs = fs  # taxa de amostragem
        self.bufsz = bufsz  # quantidade de amostas que devem ser moduladas por vez
        self.bits = []  # sequência de bits de entrada
        self.phi = 0.0  # fase do sinal modulado
        L = self.fs//300
        self.sinal = np.zeros(L)

        self.filt = scipy.signal.firwin(40, 300, pass_zero='lowpass', fs=self.fs)

        self.v0rl = 0
        self.v0il= 0
        self.v1rl = 0
        self.v1il = 0
        self.vl = 0
        self.vll = 0
        self.yl = 0
        self.contador = 0
        self.d = []

        
        
        # frequências de modulação (upload)
        self.tx_omega0 = 2*np.pi*(1080 + 100)
        self.tx_omega1 = 2*np.pi*(1080 - 100)
        # frequências de demodulação (download)
        self.rx_omega0 = 2*np.pi*(1750 + 100)
        self.rx_omega1 = 2*np.pi*(1750 - 100)
        # se o modem estiver atendendo uma ligação
        if ans:
            # inverte as frequências
            self.tx_omega0, self.rx_omega0 = self.rx_omega0, self.tx_omega0
            self.tx_omega1, self.rx_omega1 = self.rx_omega1, self.tx_omega1

    # Modulação

    def put_bits(self, bits):
        for i in range(len(bits)):
            self.bits.append(bits[i])

    def get_samples(self):
        y = []

        if(len(self.bits)==0):
            self.bits.append(1)
        
        omega = self.tx_omega0 if self.bits[0] == 0  else self.tx_omega1 

        for i in range(self.bufsz):
            y.append(np.sin(self.phi))
            self.phi += omega/self.fs
            

        # remove o primeiro bit da lista        
        self.bits.pop(0)

        return np.array(y)

    # Demodulação

    def put_samples(self, data):
        self.sinal = np.append(self.sinal,data)

    def get_bits(self):
        L = self.fs//300
        T = 1/self.fs
        
        
        
        
        bits_filt = []

        for n in range(L,len(self.sinal)):
            r = 0.99
            v0r = self.sinal[n] - r**L * np.cos(self.rx_omega0*L*T)*self.sinal[n-L] + r*np.cos(self.rx_omega0*T)*self.v0rl - r*np.sin(self.rx_omega0*T)*self.v0il
            v0i = -r**L*np.sin(self.rx_omega0*L*T)*self.sinal[n-L] + r*np.cos(self.rx_omega0*T)*self.v0il + r*np.sin(self.rx_omega0*T)*self.v0rl
            v1r = self.sinal[n] - r**L * np.cos(self.rx_omega1*L*T)*self.sinal[n-L] + r*np.cos(self.rx_omega1*T)*self.v1rl - r*np.sin(self.rx_omega1*T)*self.v1il
            v1i = -r**L*np.sin(self.rx_omega1*L*T)*self.sinal[n-L] + r*np.cos(self.rx_omega1*T)*self.v1il + r*np.sin(self.rx_omega1*T)*self.v1rl

            self.v0il = v0i
            self.v0rl = v0r
            self.v1il = v1i
            self.v1rl = v1r

            rho = v1r**2+v1i**2+v0r**2+v0i**2 # Detecção de portadora

            c = abs(v1r**2+v1i**2-v0r**2-v0i**2) # Entrada do filtro passa baixa

            r=0.9999
       
            d = v1r**2+v1i**2-v0r**2-v0i**2
    
           
            v = (1-r)*c + 2*r*np.cos(2*np.pi*300/self.fs)*self.vl - r**2*self.vll # Sinal interno do filto passa baixa
            y = v - self.vll # Saída do filtro passa baixa

            

            if ((y >= 0)and(self.yl < 0)):
                self.contador = 46*(48000//self.fs)
        
            if (self.contador > 0):
                self.d.append(d)
                self.contador -= 1
            elif len(self.d) > 0 :
                bit = np.dot(self.d[:len(self.filt)],self.filt)
                bits_filt.append(1 if bit >= 0 else 0)
                self.d = []        
            
                

            self.vll = self.vl
            self.vl = v
            self.yl = y         


        self.sinal = self.sinal[:-L]

        return bits_filt
       


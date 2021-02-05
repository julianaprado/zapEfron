# zapEfron

##Descrição
    Esse projeto foi feito com a intenção de experimentar e praticar com arquivos JSON e ver como eles se relacionam com um banco de dados em tempo real, e para isso, foi criado um app de mensagens instantânea coletiva; ZapEfron. Qualquer usuário novo que se registrar receberá as mensagens antigas entre os usuários e também, poderá mandar e receber mensagens novas em tempo real.
Vídeos
![](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612378131677_ReadME.gif)

##Instalação
    Cloud Firestore (Firebase) foi a melhor opção de banco de dados para esse projeto, então para isso, precisamos instalar o banco de dados. É muito importante ler com calma cada passo para não se perder entre eles pois isso pode causar muita dor de cabeça. 


    Então vamos com calma:
        1.  Instale o Cocoapods no seu projeto.
        2. Crie seu projeto no Console do Firebase.
        3. Instale o Firebase usando Cocoapods.
        4. Cire seu banco de dados no Cloud Firestore.


Cocoapods:

Abra o terminal `cmd ⌘ + space`.

No `spotlight search` procure por “terminal” e aperte enter.

Escreva:


    $ sudo gem install cocoapods

Caso tenha encontrado erros ou queira tirar dúvidas, acesse o site do Cocoapods pelo link.


Projeto no Firebase


1. Vá no `Console do Firebase` e clique em adicionar projeto.
2. Dê um nome ao seu projeto.
3. Clique para desativar `Ativar o Google Analytics neste projeto` e continue.

Caso tenha encontrado erros ou queira tirar dúvidas ou saber mais sobre o Firebase, é altamente recomendado ler a documentação completa no site.


Instalar Firebase

Se tiver com o projeto aberto no Xcode, feche.

Com o terminal aberto, abra no Finder a pasta do seu projeto e arraste ela para a linha do terminal. Desse jeito, o terminal irá direto para o diretório do seu projeto.

Certificado que você está dentro do diretório do seu projeto, escreva no terminal:


    $ pod init 

Agora, se você for até a pasta do seu projeto você verá que tem um novo arquivo chamado `Podfile`.
Clique com o botão direito nele e escolha para abrir o arquivo com o Xcode (se quiser, marque para sempre abrir esse tipo de arquivo com o Xcode).

Troque o código lá dentro por:

    platform :ios, ‘10.0’
    
    # Add the Firebase pod for Google Analytics
    pod 'Firebase/Analytics'
    
    # Add the pods for any other Firebase products you want to use in your app
    # For example, to use Firebase Authentication and Cloud Firestore
    pod 'Firebase/Auth'
    pod 'Firebase/Firestore'

Salve e feche o arquivo.

Em seguida, volte ao terminal e escreva:


    $ pod install

Quando o processo acabar, o seu projeto terá alguns arquivos diferentes. Uma diferença muito importante é o arquivo com extensão `.xcodeproj` que costumava ser usado para abrir seu projeto no Xcode. Agora você verá um outro arquivo com um ícone parecido mas em branco e com a extensão `.xcworkspace`. Daqui para frente você não trabalhará mais com o `.xcodeproj`, TUDO SERÁ FEITO COM O `.xcworkspace`.

        


![.xcodeproj](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612454050518_wrongArq.png)
![.xcworkspace](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612454067407_xcworkspace-6705.png)



Caso tenha encontrado erros ou queira tirar dúvidas ou saber mais sobre o Firebase, é altamente recomendado ler a documentação completa no site.


Cloud Firestore

Antes de criar um banco de dados no `Cloud Firestore`, temos que adicionar o Firebase ao seu projeto.

Dentro do Console do Firebase, clique no seu projeto.

Na visão geral do seu projeto, clique no botão do iOS.

Dentro do Xcode, copie o código do seu projeto que fica no Bundle Identifier:

![](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612466041591_Screen+Shot+2021-02-04+at+16.13.58.png)


E cole no Código do pacote do iOS:

![](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612466246075_Screen+Shot+2021-02-04+at+16.17.22.png)


Aperte em avançar, e siga corretamente os passos sobre o documento `Google-Service-Info.plist`.

Atenção! Já fizemos o passo 3.

Siga com cuidado o passo 4.

Agora, vamos criar o banco de dados do Cloud Firestore.

No canto direito clique na opção Cloud Firestore e depois no `Criar banco de dados`.

Quando a janela abrir, escolha a opção `Iniciar em modo teste` para nos ajudar enquanto o projeto ainda estiver em fase de criação.

Escolha a opção padrão de servidor: `nam5(us-central)`

Caso seu projeto precise de um servidor mais rápido talvez seja melhor escolher outro local, mas tenha em mente que dependendo do servidor, esse serviço é pago.

Clique em `Ativar`.

Obs:

Regras do banco.

Boas Práticas e Como Usar
    Arquivos JSON são simples, cada item é representado por uma chave e um valor como em um dicionário (“chave”:”valor”) e é exatamente por isso que para trabalhar com JSONs é melhor planejar tudo com antecedência para minimizar erros humanos.


Possível Erro e Como Consertá-lo

Caso você encontre este erro aqui:

![](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612541344743_Screen+Shot+2021-02-05+at+13.09.00.png)

1. Vá para  `File > Workspace settings`.
2. Clique na setinha à direita do “DerivedData”. Isso irá abrir o Finder já na pasta  `DerivedData`.
![](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612541795566_derivedData.png)

1. Dentro da pasta `DerivedData` apague a pasta do seu projeto.
2. Feche o Xcode e abra novamente. 
3. Limpe o seu projeto com  `Shift ⇧ + cmd ⌘ + k`
4. Faça o build `cmd ⌘` `+` `b`
5. Abra seu storyboard.
6. Vá em `Editor > Refresh all views`.
Leia Sobre JSON e Firebase



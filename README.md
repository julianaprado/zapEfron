# ZapEfron

# Descrição
 Esse projeto foi feito com a intenção de experimentar e praticar com arquivos JSON e ver como eles se relacionam com um banco de dados em tempo real, e para isso, foi criado um app de mensagens instantânea coletiva; ZapEfron. Qualquer usuário novo que se registrar receberá as mensagens antigas entre os usuários e também, poderá mandar e receber mensagens novas em tempo real.
 
# Vídeos

 ![zapEfron-gif](https://github.com/julianaprado/zapEfron/blob/main/ReadME.gif)

# Instalação

Cloud Firestore (Firebase) foi a melhor opção de banco de dados para esse projeto, então para isso, precisamos instalar o banco de dados. É muito importante ler com calma cada passo para não se perder entre eles pois isso pode causar **muita dor de cabeça.** 


Então vamos com calma:
1. Instale o Cocoapods no seu projeto.
2. Crie seu projeto no Console do Firebase.
3. Instale o Firebase usando Cocoapods.
4. Cire seu banco de dados no Cloud Firestore.


## Cocoapods:

Abra o terminal `cmd ⌘ + space`.

No `spotlight search` procure por “terminal” e aperte enter.

Escreva:


    $ sudo gem install cocoapods

Caso tenha encontrado erros ou queira tirar dúvidas, acesse o site do Cocoapods pelo [link.](https://guides.cocoapods.org/using/getting-started.html)


## Projeto no Firebase


1. Vá no `Console do Firebase` e clique em adicionar projeto.
2. Dê um nome ao seu projeto.
3. Clique para desativar `Ativar o Google Analytics neste projeto` e continue.

Caso tenha encontrado erros ou queira tirar dúvidas ou saber mais sobre o Firebase, é altamente recomendado ler a documentação completa no [site](https://firebase.google.com/docs/ios/setup?authuser=0).


## Instalar Firebase

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

Quando o processo acabar, o seu projeto terá alguns arquivos diferentes. Uma diferença muito importante é o arquivo com extensão `.xcodeproj` que costumava ****ser usado para abrir seu projeto no Xcode. ****Agora você verá um outro arquivo com um ícone parecido mas em branco e com a extensão `.xcworkspace`. Daqui para frente você não trabalhará mais com o `.xcodeproj`, **TUDO SERÁ FEITO** COM O `.xcworkspace`.

        


![.xcodeproj](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612454050518_wrongArq.png)
![.xcworkspace](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612454067407_xcworkspace-6705.png)



Caso tenha encontrado erros ou queira tirar dúvidas ou saber mais sobre o Firebase, é altamente recomendado ler a documentação completa no [site](https://firebase.google.com/docs/guides?authuser=0).


## Cloud Firestore

Antes de criar um banco de dados no `Cloud Firestore`, temos que adicionar o Firebase ao seu projeto.

Dentro do Console do Firebase, clique no seu projeto.

Na visão geral do seu projeto, clique no botão do iOS.

Dentro do Xcode, copie o código do seu projeto que fica no Bundle Identifier:

![](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612466041591_Screen+Shot+2021-02-04+at+16.13.58.png)


E cole no `Código do pacote do iOS`:

![](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612466246075_Screen+Shot+2021-02-04+at+16.17.22.png)


Aperte em avançar, e siga corretamente os passos sobre o documento `Google-Service-Info.plist`.

Atenção! Já fizemos o passo 3.

Siga com cuidado o passo 4.

Agora, vamos criar o banco de dados do Cloud Firestore.

No canto direito clique na opção Cloud Firestore e depois no `Criar banco de dados`.

Quando a janela abrir, escolha a opção `Iniciar em modo teste` para nos ajudar enquanto o projeto ainda estiver em fase de criação.

Escolha a opção padrão de servidor: `nam5(us-central)`

Caso seu projeto precise de um servidor mais rápido talvez seja melhor escolher outro local, mas tenha em mente que dependendo do servidor, **esse serviço é pago**.

Clique em `Ativar`.

## Obs:

Queremos ler as mensagens dos nossos usuários? Sim. Mas não sabemos se outras pessoas são bem intencionadas porém apenas fofoqueiras como nós,  então para proteger os dados dos usuários, é preciso criar regras para o banco de dados.

Antes de criar é bom ler um pouco sobre a [linguagem](https://firebase.google.com/docs/rules/rules-language?hl=pt-br).

Enquanto seu projeto estiver em desenvolvimento, recomendo usar as regras de `Regras do ambiente de desenvolvimento` que estão [aqui](https://firebase.google.com/docs/rules/basics?hl=pt-br#development-environment_rules).

Caso queira lançar seu aplicativo escolha uma regra que proteja os dados dos seus usuários de acordo com o que seu aplicativo precise. A apple preza muita a [privacidade](https://www.apple.com/privacy/) e é muito importante que informações de usuários não caiam em mãos mal intencionadas, leia sobre os riscos:


- [Milhares de aplicativos de celular expõem bancos de dados do Firebase](https://minutodaseguranca.blog.br/firebase-expoe-dados/)
- [Como funcionam as regras de segurança do Firebase na Realtime Database?](https://medium.com/android-dev-moz/como-funcionam-as-regras-de-seguran%C3%A7a-do-firebase-na-realtime-database-45b28cda14ad)
- [Aplicativos de rastreamento da Covid-19 apresentam falhas de segurança](https://canaltech.com.br/seguranca/aplicativos-de-rastreamento-da-covid-19-apresentam-falhas-de-seguranca-169763/)
[](https://medium.com/android-dev-moz/como-funcionam-as-regras-de-seguran%C3%A7a-do-firebase-na-realtime-database-45b28cda14ad)
Para escolher o que é melhor para seu aplicativo, esse [link](https://blog.back4app.com/pt/bancos-de-dados-do-firebase-qual-e-a-melhor-opcao-para-seu-aplicativo/) possui algumas informações que podem te ajudar.

# Boas Práticas e Como Usar

Arquivos JSON são simples, cada item é representado por uma chave e um valor como em um dicionário (“chave”:”valor”) e é exatamente por se tratar de strings que para trabalhar com JSONs é melhor planejar tudo com antecedência para minimizar erros humanos.

Uma estrutura JSON é mais ou menos assim:


    {  
      body : "aqui é o iPhone 11 Pro Max."
      date : 1612377235.094732
      sender : "c@b.com"
    }

Observe que o `date` foi criado quando enviamos a mensagem ao banco de dados:


    @IBAction func sendPressed(_ sender: UIButton) {
            
            if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
                db.collection(K.FStore.collectionName).addDocument(data: [
                    K.FStore.senderField: messageSender,
                    K.FStore.bodyField: messageBody,
                    K.FStore.dateField: Date().timeIntervalSince1970
                ]) { (error) in
                    if let err = error {
                        print(err)
                    } else {
                        print("Saved Successfully.")
                        self.messageTextfield.text = ""
                    }
                }
            }
            
        }

Já `messageSender` e `messageBody` estão na estrutura que criamos para as mensagens:


    struct Message {
        let sender: String //email
        let body: String // message
    }

Duas palavras são muito importantes quando se trata de JSON:

    - Encoding
    - Decoding (Parsing)


## O que é Parsing?

Parsing basicamente quer dizer interpretar os dados para a língua que você quer trabalhar com, no nosso caso é Swift.

O JSON é lido como uma grande String que segue as especificações do JSON, quando você Parse o JSON você muda essa String para um Objeto JSON e depois podemos usar da forma que queremos.


## O que é Encoding?

Encoding é transformar os dados que temos em Swift para o formato em string JSON.


Quando se trata de JSON, as boas práticas de uma `Struct` que armazenam as propriedades dos dados são divididas em duas categorias:

    1. [Uma](https://www.dropbox.com/scl/fi/eh9cqwcpr7ir6nieq4bhc/ZapEfron.paper?dl=0&rlkey=t1z9vgb1sum1bdt80xehltewp#:uid=393354576385318948602761&h2=Decoding:-Parsing) `[Struct](https://www.dropbox.com/scl/fi/eh9cqwcpr7ir6nieq4bhc/ZapEfron.paper?dl=0&rlkey=t1z9vgb1sum1bdt80xehltewp#:uid=393354576385318948602761&h2=Decoding:-Parsing)` [que](https://www.dropbox.com/scl/fi/eh9cqwcpr7ir6nieq4bhc/ZapEfron.paper?dl=0&rlkey=t1z9vgb1sum1bdt80xehltewp#:uid=393354576385318948602761&h2=Decoding:-Parsing) [**recebe**](https://www.dropbox.com/scl/fi/eh9cqwcpr7ir6nieq4bhc/ZapEfron.paper?dl=0&rlkey=t1z9vgb1sum1bdt80xehltewp#:uid=393354576385318948602761&h2=Decoding:-Parsing) [as informações : Parsing](https://www.dropbox.com/scl/fi/eh9cqwcpr7ir6nieq4bhc/ZapEfron.paper?dl=0&rlkey=t1z9vgb1sum1bdt80xehltewp#:uid=393354576385318948602761&h2=Decoding:-Parsing)
    2. [Uma](https://www.dropbox.com/scl/fi/eh9cqwcpr7ir6nieq4bhc/ZapEfron.paper?dl=0&rlkey=t1z9vgb1sum1bdt80xehltewp#:uid=147648719032355313526761&h2=Encoding) `[Struct](https://www.dropbox.com/scl/fi/eh9cqwcpr7ir6nieq4bhc/ZapEfron.paper?dl=0&rlkey=t1z9vgb1sum1bdt80xehltewp#:uid=147648719032355313526761&h2=Encoding)` [que](https://www.dropbox.com/scl/fi/eh9cqwcpr7ir6nieq4bhc/ZapEfron.paper?dl=0&rlkey=t1z9vgb1sum1bdt80xehltewp#:uid=147648719032355313526761&h2=Encoding) [**envia**](https://www.dropbox.com/scl/fi/eh9cqwcpr7ir6nieq4bhc/ZapEfron.paper?dl=0&rlkey=t1z9vgb1sum1bdt80xehltewp#:uid=147648719032355313526761&h2=Encoding) [as informações : Encoding](https://www.dropbox.com/scl/fi/eh9cqwcpr7ir6nieq4bhc/ZapEfron.paper?dl=0&rlkey=t1z9vgb1sum1bdt80xehltewp#:uid=147648719032355313526761&h2=Encoding)


## Decoding: Parsing

`Structs` que recebem JSON **precisam** ter os mesmos nomes dos JSONs que irão receber. Por se tratar de strings, uma letra fora do lugar pode resultar em um erro durante o processo de `Parsing`.

Tem como contornar isso assim, pegando a estrutura JSON acima, caso quiséssemos trocar o nome `body` por `corpo`:


    enum CodingKeys: String, CodingKey {
      case sender, body = "corpo"
    }

Alguns APIs usam snake case ( `primeiro_nome_segundo_nome` ), o problema é que Swift não aceita nomes snake case então é preciso mudar para o camel case ( `PrimeiroNomeSegundoNome` ).

É possível contornar isso com `.convertFromSnakeCase` e `.convertToSnakeCase` caso seu projeto precise.


## Encoding

Encoding é bem mais fácil pois temos mais controle sobre os dados que queremos mandar, sabemos quais nomes vamos usar pois na maioria das vezes somos nós que criamos eles desde o inicio.

A melhor prática para Encode um JSON é usar nomes que condizem com as informações que você esteja passando, afinal você está lidando com um banco de dados e é sempre importante manter o banco de dados compreensível. 

Para melhor entender as boas práticas leia este [artigo](https://benscheirman.com/2017/06/swift-json/).

# Possível Erro e Como Consertá-lo

Caso você encontre este erro aqui:

![](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612541344743_Screen+Shot+2021-02-05+at+13.09.00.png)

1. Vá para  `File > Workspace settings`.
2. Clique na setinha à direita do “DerivedData”. Isso irá abrir o Finder já na pasta  `DerivedData`.
![](https://paper-attachments.dropbox.com/s_6843BFE87326B98B08962B1F73B7799C4E6370D454988C13D6EB8A8618603335_1612541795566_derivedData.png)

1. Dentro da pasta `DerivedData` apague a pasta do seu projeto.
2. Feche o Xcode e abra novamente. 
3. Limpe o seu projeto com `Shift ⇧ + cmd ⌘ + k`
4. Faça o build `cmd ⌘ + b`
5. Abra seu storyboard.
6. Vá em `Editor > Refresh all views`.




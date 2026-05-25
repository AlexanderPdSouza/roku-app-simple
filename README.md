# roku-app-simple
roku app teste 

Para utilizar precisamos seguir alguns passos. 

1º npm install - instalar as dependencias;
2º trocar o nome do arquivo .env.exemple para apenas .env e adiconar suas informações do device ip e senha; 
3º Já pode utilizar o debug do vscode só apertando o play, esse arquivo launch.json, já está todo configurado para iniciar a aplicação. 

Utilizei a arquitetura por pilha usando um router para centralizar as telas, conhecida como Navigation Stack Architecture, a utilizei por que é que eu conheço melhor, mas é algo simples que pode ser escalado e podendo ser trocado para MVVM, retirando algumas funções que são feitas na propria view.
Fiz a utilização dos components nativos roku, rowList, markupGrid, poster, label. 

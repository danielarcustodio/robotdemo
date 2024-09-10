Vamos criar os arquivos `login.robot`, `variaveis.robot` e `keywords.robot` para incluir um teste positivo e um teste negativo. O teste negativo tentará fazer login com uma senha incorreta e verificará se a mensagem de erro é exibida.

### login.robot [coder:save]
```
*** Settings ***
Documentation     Teste de login no site SauceDemo
Library           OperatingSystem
Resource          variaveis.robot
Resource          keywords.robot

*** Test Cases ***
Login E Compra Positivo
    [Documentation]    Teste de login e compra no site SauceDemo
    Preparar Navegador
    Acessar Pagina Inicial
    Fazer Login
    Adicionar Produto Ao Carrinho
    Ir Para O Carrinho
    Realizar Checkout
    Finalizar Compra

Login Negativo
    [Documentation]    Teste de login com senha incorreta no site SauceDemo
    Preparar Navegador
    Acessar Pagina Inicial
    Fazer Login Com Senha Incorreta
    Verificar Mensagem De Erro
```
[coder:end]

### variaveis.robot [coder:save]
```
*** Variables ***
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${WRONG_PASSWORD} wrong_password
${FIRST_NAME}     Teste
${LAST_NAME}      Testing
${POSTAL_CODE}    12349
${EVIDENCIAS_DIR} evidencias/
```
[coder:end]

### keywords.robot [coder:save]
```
*** Keywords ***
Preparar Navegador
    Create Directory    ${EVIDENCIAS_DIR}
    Open Browser    about:blank    chrome
    Set Viewport Size    1321    896
    Capture Page Screenshot    ${EVIDENCIAS_DIR}Preparar_Navegador.png

Acessar Pagina Inicial
    Go To    ${URL}
    Wait Until Page Contains Element    xpath://title[text()='Swag Labs']
    Capture Page Screenshot    ${EVIDENCIAS_DIR}Pagina_Inicial.png

Fazer Login
    Click Element    xpath://*[@data-test="username"]
    Input Text    xpath://*[@data-test="username"]    ${USERNAME}
    Click Element    xpath://*[@data-test="password"]
    Input Text    xpath://*[@data-test="password"]    ${PASSWORD}
    Click Element    xpath://*[@data-test="login-button"]
    Capture Page Screenshot    ${EVIDENCIAS_DIR}Login.png

Fazer Login Com Senha Incorreta
    Click Element    xpath://*[@data-test="username"]
    Input Text    xpath://*[@data-test="username"]    ${USERNAME}
    Click Element    xpath://*[@data-test="password"]
    Input Text    xpath://*[@data-test="password"]    ${WRONG_PASSWORD}
    Click Element    xpath://*[@data-test="login-button"]
    Capture Page Screenshot    ${EVIDENCIAS_DIR}Login_Incorreto.png

Verificar Mensagem De Erro
    Wait Until Page Contains Element    xpath://*[@data-test="error"]
    Capture Page Screenshot    ${EVIDENCIAS_DIR}Mensagem_De_Erro.png

Adicionar Produto Ao Carrinho
    Click Element    xpath://*[@data-test="add-to-cart-sauce-labs-bike-light"]
    Capture Page Screenshot    ${EVIDENCIAS_DIR}Produto_Adicionado.png

Ir Para O Carrinho
    Click Element    xpath://*[@data-test="shopping-cart-link"]
    Capture Page Screenshot    ${EVIDENCIAS_DIR}Carrinho.png

Realizar Checkout
    Click Element    xpath://*[@data-test="checkout"]
    Click Element    xpath://*[@data-test="firstName"]
    Input Text    xpath://*[@data-test="firstName"]    ${FIRST_NAME}
    Press Key    xpath://*[@data-test="firstName"]    Tab
    Input Text    xpath://*[@data-test="lastName"]    ${LAST_NAME}
    Press Key    xpath://*[@data-test="lastName"]    Tab
    Input Text    xpath://*[@data-test="postalCode"]    ${POSTAL_CODE}
    Click Element    xpath://*[@data-test="continue"]
    Capture Page Screenshot    ${EVIDENCIAS_DIR}Checkout.png

Finalizar Compra
    Click Element    xpath://*[@data-test="finish"]
    Capture Page Screenshot    ${EVIDENCIAS_DIR}Compra_Finalizada.png
    Click Element    xpath://*[@data-test="back-to-products"]
    Capture Page Screenshot    ${EVIDENCIAS_DIR}Voltar_Para_Produtos.png
```
[coder:end]

Agora, temos dois casos de teste: um positivo (`Login E Compra Positivo`) e um negativo (`Login Negativo`). O teste negativo tenta fazer login com uma senha incorreta e verifica se a mensagem de erro é exibida. As capturas de tela são salvas na pasta `evidencias` para ambos os testes.
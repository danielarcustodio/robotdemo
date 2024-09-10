Vamos atualizar os arquivos para incluir a captura de tela em cada etapa do teste.

### login.robot [coder:save]
```
*** Settings ***
Documentation     Teste de login no site SauceDemo
Resource          variaveis.robot
Resource          keywords.robot

*** Test Cases ***
Login E Compra
    [Documentation]    Teste de login e compra no site SauceDemo
    Preparar Navegador
    Acessar Pagina Inicial
    Fazer Login
    Adicionar Produto Ao Carrinho
    Ir Para O Carrinho
    Realizar Checkout
    Finalizar Compra
```
[coder:end]

### variaveis.robot [coder:save]
```
*** Variables ***
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${FIRST_NAME}     Teste
${LAST_NAME}      Testing
${POSTAL_CODE}    12349
```
[coder:end]

### keywords.robot [coder:save]
```
*** Keywords ***
Preparar Navegador
    Open Browser    about:blank    chrome
    Set Viewport Size    1321    896
    Capture Page Screenshot    Preparar_Navegador.png

Acessar Pagina Inicial
    Go To    ${URL}
    Wait Until Page Contains Element    xpath://title[text()='Swag Labs']
    Capture Page Screenshot    Pagina_Inicial.png

Fazer Login
    Click Element    xpath://*[@data-test="username"]
    Input Text    xpath://*[@data-test="username"]    ${USERNAME}
    Click Element    xpath://*[@data-test="password"]
    Input Text    xpath://*[@data-test="password"]    ${PASSWORD}
    Click Element    xpath://*[@data-test="login-button"]
    Capture Page Screenshot    Login.png

Adicionar Produto Ao Carrinho
    Click Element    xpath://*[@data-test="add-to-cart-sauce-labs-bike-light"]
    Capture Page Screenshot    Produto_Adicionado.png

Ir Para O Carrinho
    Click Element    xpath://*[@data-test="shopping-cart-link"]
    Capture Page Screenshot    Carrinho.png

Realizar Checkout
    Click Element    xpath://*[@data-test="checkout"]
    Click Element    xpath://*[@data-test="firstName"]
    Input Text    xpath://*[@data-test="firstName"]    ${FIRST_NAME}
    Press Key    xpath://*[@data-test="firstName"]    Tab
    Input Text    xpath://*[@data-test="lastName"]    ${LAST_NAME}
    Press Key    xpath://*[@data-test="lastName"]    Tab
    Input Text    xpath://*[@data-test="postalCode"]    ${POSTAL_CODE}
    Click Element    xpath://*[@data-test="continue"]
    Capture Page Screenshot    Checkout.png

Finalizar Compra
    Click Element    xpath://*[@data-test="finish"]
    Capture Page Screenshot    Compra_Finalizada.png
    Click Element    xpath://*[@data-test="back-to-products"]
    Capture Page Screenshot    Voltar_Para_Produtos.png
```
[coder:end]

Agora, cada etapa do teste inclui a captura de uma captura de tela, que será salva com um nome descritivo para cada ação realizada.
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_OPTIONS}    headless    no-sandbox    disable-dev-shm-usage

*** Keywords ***
Preparar Navegador
    Create Directory    ${EVIDENCIAS_DIR}
    Create WebDriver    Chrome    options=add_argument(${CHROME_OPTIONS})
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
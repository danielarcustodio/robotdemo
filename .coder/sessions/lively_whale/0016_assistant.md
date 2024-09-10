O erro "DevToolsActivePort file doesn't exist" geralmente ocorre porque o Chrome não conseguiu iniciar corretamente no ambiente de CI. Isso pode ser resolvido configurando o Chrome para rodar em modo "headless" (sem interface gráfica) e ajustando algumas opções adicionais.

Vamos atualizar o arquivo de workflow do GitHub Actions para instalar o Chrome e configurar o Selenium para rodar o Chrome em modo headless.

### .github/workflows/robot_tests.yml [coder:save]
```
name: Robot Framework Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: '3.x'

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install robotframework
        pip install robotframework-seleniumlibrary

    - name: Install Chrome
      run: |
        sudo apt-get update
        sudo apt-get install -y google-chrome-stable

    - name: Run Robot Framework tests
      run: |
        mkdir -p evidencias
        robot -d evidencias login.robot

    - name: Upload test results
      uses: actions/upload-artifact@v2
      with:
        name: evidencias
        path: evidencias
```
[coder:end]

### Atualize os Arquivos de Teste para Rodar o Chrome em Modo Headless

Certifique-se de que o Selenium está configurado para rodar o Chrome em modo headless.

### keywords.robot [coder:save]
```
*** Keywords ***
Preparar Navegador
    Create Directory    ${EVIDENCIAS_DIR}
    Open Browser    about:blank    chrome    options=add_argument("--headless"),add_argument("--no-sandbox"),add_argument("--disable-dev-shm-usage")
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

### Passos Finais

1. **Adicione e comite as mudanças:**
   ```sh
   git add .github/workflows/robot_tests.yml keywords.robot
   git commit -m "Configura Chrome em modo headless para GitHub Actions"
   ```

2. **Faça o push para o repositório remoto:**
   ```sh
   git push origin main
   ```

3. **Verifique o pipeline no GitHub:**
   - Vá para o repositório no GitHub.
   - Clique na aba "Actions".
   - Verifique se o pipeline "Robot Framework Tests" está sendo executado corretamente.

Seguindo esses passos, você deve ser capaz de corrigir o erro e configurar o pipeline CI/CD para rodar os testes do Robot Framework automaticamente no GitHub Actions, usando o Chrome em modo headless.
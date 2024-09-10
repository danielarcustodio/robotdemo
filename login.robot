*** Settings ***
Documentation     Teste de login no site SauceDemo
Resource          variaveis.robot
Resource          keywords.robot
Library           SeleniumLibrary
Library           OperatingSystem

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
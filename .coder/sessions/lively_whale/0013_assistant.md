Se você deseja "resetar" o envio de código para o Git, isso pode significar diferentes coisas dependendo do que você quer alcançar. Aqui estão algumas ações comuns que você pode querer realizar:

### 1. Desfazer o Último Commit Localmente

Se você cometeu um erro no último commit e deseja desfazê-lo antes de enviar o código para o repositório remoto, você pode usar:

```sh
git reset --soft HEAD~1
```

Isso desfaz o último commit, mas mantém as mudanças no seu diretório de trabalho, permitindo que você faça ajustes e cometa novamente.

### 2. Desfazer o Último Commit e as Mudanças

Se você deseja desfazer o último commit e também descartar as mudanças feitas, use:

```sh
git reset --hard HEAD~1
```

Isso desfaz o último commit e remove todas as mudanças feitas no diretório de trabalho.

### 3. Desfazer Commits Já Enviados para o Repositório Remoto

Se você já enviou commits para o repositório remoto e deseja desfazê-los, você pode usar `git revert` ou `git reset` seguido de um `git push --force`.

#### Usando `git revert`

`git revert` cria um novo commit que desfaz as mudanças de um commit anterior. Isso é mais seguro porque mantém o histórico de commits.

```sh
git revert <commit_hash>
```

#### Usando `git reset` e `git push --force`

Se você deseja remover commits do histórico, você pode usar `git reset` e depois forçar o push para o repositório remoto. **Cuidado:** Isso reescreve o histórico e pode causar problemas para outros colaboradores.

```sh
git reset --hard <commit_hash>
git push --force
```

### 4. Excluir o Histórico de Commits e Começar do Zero

Se você deseja excluir todo o histórico de commits e começar do zero, você pode redefinir o branch para um commit inicial ou vazio.

#### Redefinir para um Commit Inicial

```sh
git checkout --orphan new_branch
git add -A
git commit -m "Novo início"
git branch -D main
git branch -m main
git push --force origin main
```

#### Redefinir para um Repositório Vazio

```sh
rm -rf .git
git init
git add -A
git commit -m "Novo início"
git remote add origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
git push --force origin main
```

### Exemplo Completo: Desfazer o Último Commit e Reenviar

1. **Desfazer o último commit localmente:**
   ```sh
   git reset --soft HEAD~1
   ```

2. **Faça ajustes no código, se necessário.**

3. **Faça o commit novamente:**
   ```sh
   git commit -m "Mensagem de commit corrigida"
   ```

4. **Envie o commit para o repositório remoto:**
   ```sh
   git push origin main
   ```

### Exemplo Completo: Redefinir o Branch e Reenviar

1. **Redefinir o branch para um commit específico:**
   ```sh
   git reset --hard <commit_hash>
   ```

2. **Forçar o push para o repositório remoto:**
   ```sh
   git push --force origin main
   ```

### Exemplo Completo: Excluir o Histórico de Commits e Começar do Zero

1. **Excluir o histórico de commits e recomeçar:**
   ```sh
   rm -rf .git
   git init
   git add -A
   git commit -m "Novo início"
   git remote add origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
   git push --force origin main
   ```

Escolha a abordagem que melhor se adapta às suas necessidades. Lembre-se de que operações como `git reset --hard` e `git push --force` podem reescrever o histórico e causar problemas para outros colaboradores, então use-as com cuidado.
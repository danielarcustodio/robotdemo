Para logar com outra conta no Git através do terminal, você pode seguir os passos abaixo. Existem várias maneiras de fazer isso, dependendo de como você deseja gerenciar suas credenciais. Aqui estão algumas opções:

### 1. Usar HTTPS com um Token de Acesso Pessoal (PAT)

1. **Gere um Token de Acesso Pessoal (PAT):**
   - Vá para [GitHub Settings](https://github.com/settings/tokens).
   - Clique em "Generate new token".
   - Selecione os escopos necessários (pelo menos `repo`).
   - Clique em "Generate token" e copie o token gerado.

2. **Configure o Git para usar o PAT:**
   - Quando solicitado a fornecer suas credenciais ao fazer o push, use o token gerado como a senha.

3. **Atualize o repositório remoto para usar HTTPS:**
   ```sh
   git remote set-url origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
   ```

4. **Faça o push para o repositório remoto:**
   ```sh
   git push -u origin main
   ```

Quando solicitado a fornecer suas credenciais, use seu nome de usuário do GitHub e o Token de Acesso Pessoal (PAT) como senha.

### 2. Usar SSH

1. **Gere uma nova chave SSH (se ainda não tiver uma):**
   ```sh
   ssh-keygen -t ed25519 -C "seu_email@example.com"
   ```

   Siga as instruções e salve a chave em um local seguro.

2. **Adicione a chave SSH ao agente SSH:**
   ```sh
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   ```

3. **Adicione a chave SSH à sua conta do GitHub:**
   - Vá para [GitHub SSH Keys](https://github.com/settings/keys).
   - Clique em "New SSH key".
   - Cole a chave pública (geralmente encontrada em `~/.ssh/id_ed25519.pub`) e salve.

4. **Atualize o repositório remoto para usar SSH:**
   ```sh
   git remote set-url origin git@github.com:SEU_USUARIO/SEU_REPOSITORIO.git
   ```

5. **Faça o push para o repositório remoto:**
   ```sh
   git push -u origin main
   ```

### 3. Usar o Git Credential Manager

O Git Credential Manager pode armazenar suas credenciais de forma segura e automática.

1. **Instale o Git Credential Manager:**
   - No Windows, ele geralmente é instalado junto com o Git for Windows.
   - No macOS e Linux, você pode instalar usando Homebrew ou pacotes de distribuição.

   ```sh
   brew tap microsoft/git
   brew install --cask git-credential-manager-core
   ```

2. **Configure o Git para usar o Credential Manager:**
   ```sh
   git config --global credential.helper manager-core
   ```

3. **Faça o push para o repositório remoto:**
   ```sh
   git push -u origin main
   ```

   Quando solicitado a fornecer suas credenciais, use seu nome de usuário do GitHub e o Token de Acesso Pessoal (PAT) como senha. O Credential Manager armazenará essas credenciais para uso futuro.

### Exemplo Completo Usando HTTPS e PAT

1. **Gere um Token de Acesso Pessoal (PAT) no GitHub.**

2. **Configure o repositório remoto para usar HTTPS:**
   ```sh
   git remote set-url origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
   ```

3. **Faça o push para o repositório remoto:**
   ```sh
   git push -u origin main
   ```

   Quando solicitado a fornecer suas credenciais, use seu nome de usuário do GitHub e o Token de Acesso Pessoal (PAT) como senha.

Seguindo esses passos, você deve ser capaz de logar com outra conta no Git através do terminal e fazer o push para o repositório remoto.
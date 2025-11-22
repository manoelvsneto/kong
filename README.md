# Kong API Gateway - Kubernetes Deployment

## ✅ Status: Rodando com Sucesso!

Kong API Gateway 3.4 deployado no Kubernetes (ARM64) com Konga Admin UI, PostgreSQL e exemplos prontos.

## 🌐 Acessos

### URLs Principais
- **Kong Proxy (API Gateway)**: https://kong.archse.eng.br
- **Konga Admin UI**: https://konga.archse.eng.br
- **Kong Admin API**: http://kong.archse.eng.br:8001

### APIs de Exemplo
- **Hello World**: https://kong.archse.eng.br/hello
- **JSONPlaceholder**: https://kong.archse.eng.br/api/posts

## 🔐 Credenciais

### Kong Gateway
- **Username**: admin
- **Password**: Kong@2024
- **Admin Token**: admin-secret-token-2024

### PostgreSQL Kong
- **Host**: postgres-service:5432
- **Database**: kong
- **User**: kong
- **Password**: Kong@Postgres2024

### Konga Admin UI
**Primeiro Acesso:**
1. Acesse https://konga.archse.eng.br
2. Clique em "Sign up" para criar sua conta de administrador
3. Faça login com suas credenciais
4. A conexão com Kong já está pré-configurada em "Connections"

**Conexão Kong (pré-configurada):**
- **Nome**: Kong Gateway
- **Kong Admin URL**: http://kong-service:8001
- **Health Checks**: Habilitado

### PostgreSQL Konga
- **Host**: konga-postgres-service:5432
- **Database**: konga
- **User**: konga
- **Password**: Konga@2024

## 📋 Arquitetura

- **Kong API Gateway**: Gerenciamento de APIs e microserviços
- **Konga**: Interface gráfica para administração do Kong
- **PostgreSQL**: Banco de dados relacional para armazenamento de dados do Kong e Konga

## 🚀 Quick Start

1. Acesse o Konga Admin UI: https://konga.archse.eng.br
2. Crie uma conta de administrador
3. Faça login e verifique a conexão com o Kong Gateway
4. Explore os serviços e rotas pré-configurados
5. Teste os exemplos de API disponíveis

## 🛠️ Gerenciamento de APIs

### Adicionando Nova API

1. Acesse o Kong Admin UI
2. Vá até a aba "APIs"
3. Clique em "Add API"
4. Preencha os detalhes da sua API
5. Salve e ative a API

### Configurando Plugins

1. Selecione a API desejada na lista
2. Vá até a aba "Plugins"
3. Escolha o plugin que deseja adicionar
4. Configure as opções do plugin
5. Salve as configurações

## 🔄 Sincronização e Backup

- **Sincronização**: Assegure que todas as instâncias do Kong estejam sincronizadas com as mesmas configurações.
- **Backup**: Realize backups regulares do banco de dados PostgreSQL para evitar perda de dados.

## 📈 Monitoramento e Logs

- Utilize ferramentas de monitoramento para acompanhar o desempenho do Kong e das APIs.
- Verifique os logs de acesso e erro para diagnosticar problemas.

## 🔧 Solução de Problemas Comuns

- **Erro 404**: Verifique se a rota da API está corretamente configurada.
- **Erro 500**: Consulte os logs do Kong para mais detalhes sobre o erro interno.
- **Problemas de Conexão**: Assegure que o serviço do Kong e o banco de dados PostgreSQL estão em execução.

## 📚 Documentação e Recursos Adicionais

- [Documentação Oficial do Kong](https://docs.konghq.com/gateway/latest/introduction/)
- [Konga GitHub Repository](https://github.com/louislam/uptime-kuma)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para enviar pull requests ou relatar problemas.

## 📅 Roadmap

- [ ] Adicionar suporte a mais plugins do Kong
- [ ] Melhorar a documentação e exemplos
- [ ] Implementar autenticação JWT nas APIs de exemplo

## 📝 Notas Finais

Obrigado por utilizar o Kong API Gateway! Estamos aqui para ajudar no que for necessário. Entre em contato para mais informações ou suporte.

---

**Versão do Documento**: 1.0
**Última Atualização**: Outubro 2023
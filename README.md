# Kong API Gateway - Kubernetes Deployment

## ✅ Status: Rodando com Sucesso!

Kong API Gateway com Konga Admin UI.

## Acessos

### URLs
- **Proxy**: https://kong.archse.eng.br
- **Konga Admin UI**: https://kong.archse.eng.br/admin
- **Admin API**: https://kong.archse.eng.br/kong-admin (porta 8001)

### Credenciais Kong
- **Username**: admin
- **Password**: Kong@2024

### Credenciais Konga
Primeira configuração:
1. Acesse https://kong.archse.eng.br/admin
2. Crie conta de administrador
3. Adicione conexão Kong:
   - **Nome**: Kong Gateway
   - **Kong Admin URL**: http://kong-service:8001

### Database Konga
- **Host**: konga-postgres-service
- **Port**: 5432
- **Database**: konga
- **User**: konga
- **Password**: Konga@2024

## Primeiro Acesso ao Konga

1. Acesse https://kong.archse.eng.br/admin
2. Clique em "Sign up" para criar conta admin
3. Faça login
4. Em "Connections", clique em "New Connection"
5. Preencha:
   - Name: `Kong Gateway`
   - Kong Admin URL: `http://kong-service:8001`
6. Clique em "Create Connection"
7. Ative a conexão

Agora você pode gerenciar Kong via interface web! 🎉
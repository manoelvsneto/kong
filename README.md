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

## Endpoints Disponíveis

### Hello World
- **URL**: https://kong.archse.eng.br/hello
- **Método**: GET
- **Descrição**: Serviço de exemplo interno

### JSONPlaceholder API (Proxy Externo)
- **URL Base**: https://kong.archse.eng.br/api/posts
- **Métodos**: GET, POST, PUT, DELETE
- **Descrição**: Proxy para JSONPlaceholder API

#### Exemplos de Uso:

```bash
# Obter todos os posts
curl https://kong.archse.eng.br/api/posts

# Obter post específico
curl https://kong.archse.eng.br/api/posts/1

# Obter comentários de um post
curl https://kong.archse.eng.br/api/posts/1/comments

# Criar novo post
curl -X POST https://kong.archse.eng.br/api/posts \
  -H "Content-Type: application/json" \
  -d '{"title":"foo","body":"bar","userId":1}'
```

#### Plugins Configurados:
- ✅ CORS habilitado
- ✅ Response Transformer (adiciona headers)
- ✅ Rate Limiting (100 req/minuto)

## Testando os Endpoints

### Teste Rápido
```bash
# Hello World
curl https://kong.archse.eng.br/hello

# JSONPlaceholder - Comentários do Post 1
curl https://kong.archse.eng.br/api/posts/1/comments
```

### Script de Testes Completo
```bash
bash test-jsonplaceholder.sh
```

### Configurar via Admin API
```bash
bash configure-jsonplaceholder.sh
```

## Gerenciando via Konga

1. Acesse https://kong.archse.eng.br/admin
2. Vá em "Services"
3. Você verá:
   - `hello-world-service` (serviço interno)
   - `jsonplaceholder-api` (proxy externo)
4. Configure plugins, rotas, etc via interface gráfica
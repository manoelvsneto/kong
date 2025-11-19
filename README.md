# Kong API Gateway - Kubernetes Deployment

## ✅ Status: Rodando com Sucesso!

Kong API Gateway deployado no Kubernetes com PostgreSQL.

### Informações do Deploy
- **Namespace**: kong
- **Versão Kong**: 3.4
- **Database**: PostgreSQL 15
- **Domain**: kong.archse.eng.br
- **Workers**: 4 processos

## Acessos

### URLs
- **Proxy HTTP**: http://kong.archse.eng.br:80
- **Proxy HTTPS**: https://kong.archse.eng.br:443
- **Admin API** (interno): http://kong-service:8001

### Credenciais

#### Autenticação Básica
- **Username**: admin
- **Password**: Kong@2024

#### PostgreSQL
- **Host**: postgres-service
- **Port**: 5432
- **Database**: kong
- **User**: kong
- **Password**: Kong@Postgres2024

## Verificação

### Status dos Pods
```bash
kubectl get pods -n kong
```

### Logs em Tempo Real
```bash
kubectl logs -n kong -l app=kong -f
```

### Testar Kong Admin API
```bash
# De dentro do cluster
kubectl exec -n kong -it $(kubectl get pods -n kong -l app=kong -o jsonpath='{.items[0].metadata.name}') -- curl -s http://localhost:8001/status

# Resposta esperada:
# {"database":{"reachable":true},"memory":{"workers_lua_vms":[...],"lua_shared_dicts":{...}},"server":{"connections_accepted":...}}
```

### Testar Proxy
```bash
# Com autenticação básica
curl -u admin:Kong@2024 https://kong.archse.eng.br

# Sem autenticação (deve retornar 401)
curl -i https://kong.archse.eng.br
```

## Arquitetura
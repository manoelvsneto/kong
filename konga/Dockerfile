FROM node:18-alpine

LABEL maintainer="manoelvsneto"

# Variáveis de ambiente
ENV NODE_ENV=production \
    NODE_OPTIONS="--max-old-space-size=512"

# Instalar dependências do sistema necessárias para ARM64
RUN apk add --no-cache \
    bash \
    git \
    python3 \
    make \
    g++ \
    postgresql-client \
    ca-certificates

# Criar diretório de trabalho
WORKDIR /app

# Clonar repositório oficial do Konga
RUN git clone https://github.com/pantsel/konga.git . && \
    git checkout v0.14.9

# Configurar npm para ARM64
RUN npm config set fetch-retry-mintimeout 20000 && \
    npm config set fetch-retry-maxtimeout 120000 && \
    npm config set fetch-retries 5

# Instalar dependências globais
RUN npm install -g bower@1.8.8 gulp@4.0.2

# Instalar dependências do projeto
RUN npm install --production --legacy-peer-deps --no-optional --ignore-scripts

# Executar bower install (alguns pacotes front-end)
RUN bower install --allow-root --production || true

# Criar usuário konga
RUN adduser -H -S -g "Konga service owner" -D -u 1200 -s /sbin/nologin konga && \
    mkdir -p /app/kongadata /app/.tmp /app/views && \
    chown -R 1200:1200 /app

# Limpar cache e arquivos desnecessários
RUN rm -rf \
    /app/.git \
    /app/screenshots \
    /app/test \
    /root/.npm \
    /root/.cache \
    /root/.bower \
    /tmp/* \
    /var/cache/apk/*

# Expor porta
EXPOSE 1337

# Mudar para usuário konga
USER konga

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD node -e "require('http').get('http://localhost:1337', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

# Comando de inicialização
CMD ["node", "app.js"]

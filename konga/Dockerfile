FROM node:18-alpine

LABEL maintainer="manoelvsneto"

# Argumentos de build
ARG KONGA_VERSION=0.14.9

# Variáveis de ambiente
ENV NODE_ENV=production \
    KONGA_VERSION=${KONGA_VERSION}

# Instalar dependências do sistema
RUN apk add --no-cache \
    bash \
    git \
    python3 \
    make \
    g++ \
    postgresql-client

# Criar diretório de trabalho
WORKDIR /app

# Copiar package.json primeiro para cache de layers
COPY package*.json ./

# Instalar dependências com retry e timeout aumentado
RUN npm config set fetch-retry-mintimeout 20000 && \
    npm config set fetch-retry-maxtimeout 120000 && \
    npm config set fetch-retries 5 && \
    npm install --production --legacy-peer-deps --no-optional || \
    (sleep 10 && npm install --production --legacy-peer-deps --no-optional) || \
    (sleep 20 && npm install --production --legacy-peer-deps --no-optional)

# Copiar código da aplicação
COPY . .

# Criar usuário konga
RUN adduser -H -S -g "Konga service owner" -D -u 1200 -s /sbin/nologin konga && \
    mkdir -p /app/kongadata /app/.tmp && \
    chown -R 1200:1200 /app

# Limpar arquivos desnecessários
RUN rm -rf \
    /app/.git \
    /app/screenshots \
    /app/test \
    /root/.npm \
    /tmp/*

# Expor porta
EXPOSE 1337

# Mudar para usuário konga
USER konga

# Comando de inicialização
CMD ["node", "app.js"]

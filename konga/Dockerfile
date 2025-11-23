FROM node:16-alpine

LABEL maintainer="manoelvsneto"

WORKDIR /app

# Instalar dependências do sistema
RUN apk add --no-cache \
    bash \
    postgresql-client \
    curl \
    python3 \
    make \
    g++

# Copiar código do projeto local
COPY . .

# Instalar dependências do projeto usando o package.json existente
RUN npm install --only=production --legacy-peer-deps || \
    npm install --only=production --force

# Criar usuário
RUN adduser -H -S -g "Konga service owner" -D -u 1200 -s /sbin/nologin konga && \
    mkdir -p /app/kongadata /app/.tmp && \
    chown -R 1200:1200 /app

# Limpar cache
RUN rm -rf /root/.npm /tmp/*

USER konga

EXPOSE 1337

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:1337/ || exit 1

CMD ["node", "app.js"]

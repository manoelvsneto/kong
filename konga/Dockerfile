FROM node:16-alpine

LABEL maintainer="manoelvsneto"

WORKDIR /app

# Instalar apenas dependências runtime essenciais
RUN apk add --no-cache \
    bash \
    postgresql-client \
    curl

# Copiar código do projeto local
COPY . .

# Instalar dependências ignorando TODOS os scripts de build
RUN npm config set ignore-scripts true && \
    npm install --production --legacy-peer-deps --no-optional 2>&1 | grep -v "gyp" || true

# Criar usuário
RUN adduser -H -S -g "Konga service owner" -D -u 1200 -s /sbin/nologin konga && \
    mkdir -p /app/kongadata /app/.tmp /app/views && \
    chown -R 1200:1200 /app

# Limpar cache
RUN rm -rf /root/.npm /tmp/*

USER konga

EXPOSE 1337

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:1337/ || exit 1

CMD ["node", "app.js"]

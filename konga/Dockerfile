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

# Remover referências ao node-sass e grunt-contrib-sass do package.json
RUN sed -i '/"node-sass":/d' package.json && \
    sed -i '/"grunt-contrib-sass":/d' package.json && \
    sed -i '/"grunt-sass":/d' package.json

# Remover arquivos de configuração do sass
RUN rm -f tasks/config/sass.js || true

# Instalar dependências sem scripts
RUN npm config set ignore-scripts true && \
    npm install --production --legacy-peer-deps --no-optional

# Desabilitar hook do Grunt no Sails
RUN echo "module.exports.hooks = { grunt: false };" > config/env/production.js

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

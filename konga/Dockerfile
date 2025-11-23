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

# Remover tarefas do Grunt que usam SASS
RUN rm -f tasks/config/sass.js tasks/register/prod.js tasks/register/default.js || true

# Criar tarefas vazias para evitar erros
RUN echo "module.exports = function(grunt) {};" > tasks/config/sass.js && \
    echo "module.exports = function(grunt) { grunt.registerTask('prod', []); };" > tasks/register/prod.js && \
    echo "module.exports = function(grunt) { grunt.registerTask('default', []); };" > tasks/register/default.js

# Instalar dependências sem scripts
RUN npm config set ignore-scripts true && \
    npm install --production --legacy-peer-deps --no-optional

# Desabilitar COMPLETAMENTE o hook do Grunt
RUN echo "module.exports.hooks = { grunt: false };" > config/env/production.js && \
    echo "module.exports.hookTimeout = 120000;" >> config/env/production.js

# Criar arquivo kong_node.data para evitar erro de seed
RUN mkdir -p /app && \
    echo '{"connection":{"name":"Kong Gateway","type":"default","kong_admin_url":"http://kong-service:8001","health_checks":true,"active":true}}' > /app/kong_node.data

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

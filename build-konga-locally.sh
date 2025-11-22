#!/bin/bash

echo "=== Building Konga Docker Image Locally ==="

cd konga

# Build com retry
echo "Tentando build (1/3)..."
docker build --network=host -t manoelvsneto/konga:latest . || \
(echo "Tentando build (2/3)..." && sleep 10 && docker build --network=host -t manoelvsneto/konga:latest .) || \
(echo "Tentando build (3/3)..." && sleep 20 && docker build --network=host -t manoelvsneto/konga:latest .)

if [ $? -eq 0 ]; then
    echo "✅ Build concluído com sucesso!"
    echo ""
    echo "Para fazer push:"
    echo "  docker push manoelvsneto/konga:latest"
    echo ""
    echo "Para testar localmente:"
    echo "  docker run -p 1337:1337 -e DB_ADAPTER=postgres -e DB_HOST=postgres manoelvsneto/konga:latest"
else
    echo "❌ Build falhou. Usando imagem oficial do Konga:"
    echo "  docker pull pantsel/konga:latest"
    echo "  docker tag pantsel/konga:latest manoelvsneto/konga:latest"
fi

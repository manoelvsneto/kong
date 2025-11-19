#!/bin/bash

echo "Cleaning up Kubernetes resources..."

# Remove evicted pods
kubectl delete pods --field-selector status.phase=Failed -n kong --ignore-not-found=true
kubectl delete pods --field-selector status.phase=Evicted -n kong --ignore-not-found=true

# Remove old jobs
kubectl delete job --all -n kong --ignore-not-found=true

# Clean Docker images on nodes (if you have access)
# docker system prune -af --volumes

echo "Cleanup complete!"

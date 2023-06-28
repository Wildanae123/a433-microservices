#!/bin/bash

# Mendefinisikan variabel arg yang akan digunakan untuk menyimpan argumen
arg="${1:-apply}"

# Menerapkan sumber daya komponen RabbitMQ agar bisa dideploy ke kubernetes
kubectl "$arg" -f kubernetes/rabbitmq/rabbitmq-pv-pvc.yml
kubectl "$arg" -f kubernetes/rabbitmq/rabbitmq-statefulset.yml
kubectl "$arg" -f kubernetes/rabbitmq/rabbitmq-service.yml

# Memastikan bahwa sumber daya komponen RabbitMQ telah dibuat sepenuhnya sebelum melanjutkan dengan langkah-langkah selanjutnya
if [ "$arg" = "apply" ]; then
   kubectl wait --namespace=default --timeout=50s --for=condition=Ready pod/rabbitmq-0
fi

# Menerapkan sumber daya komponen order agar bisa dideploy ke kubernetes
kubectl "$arg" -f kubernetes/order/order-deployment.yml
kubectl "$arg" -f kubernetes/order/order-service.yml

# Menerapkan sumber daya komponen shipping agar bisa dideploy ke kubernetes
kubectl "$arg" -f kubernetes/shipping/shipping-deployment.yml
kubectl "$arg" -f kubernetes/shipping/shipping-service.yml

# Menerapkan sumber daya komponen istio agar bisa dideploy ke kubernetes
kubectl "$arg" -f kubernetes/istio/gateway.yml
kubectl "$arg" -f kubernetes/istio/destination-rule.yml
kubectl "$arg" -f kubernetes/istio/virtual-service.yml
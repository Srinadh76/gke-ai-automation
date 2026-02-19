POD=$(kubectl get pods -l app=nginx-demo -o jsonpath='{.items[0].metadata.name}')
kubectl delete pod $POD

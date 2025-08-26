## Installation Instructions

1. **Install VictoriaMetrics K8s Stack using Helm:**

   ```sh
   helm upgrade --install vmks oci://ghcr.io/victoriametrics/helm-charts/victoria-metrics-k8s-stack -f values.yaml -n austin
   ```

2. **Install Metrics Server:**

   ```sh
   kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.5.0/components.yaml
   ```

3. **Patch Metrics Server Deployment:**

   - Edit the patch file as needed:

     ```bash
     vi metrics-server-patch.yaml
     ```

   - Apply the patch:

     ```bash
     kubectl patch deployment metrics-server -n kube-system --patch "$(cat metric-server-patch.yaml)"
     ```

   - Alternatively, add the insecure TLS argument:

     ```bash
     kubectl patch -n kube-system deployment metrics-server --type=json \
       -p '[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-insecure-tls"}]'
     ```

4. **Set up VictoriaLogs:**

   - Create and enter the logs directory:

     ```bash
     mkdir logs
     cd logs
     ```

   - Get default values and install VictoriaLogs:

     ```bash
     helm show values vm/victoria-logs-single > values.yaml
     helm upgrade --install vls vm/victoria-logs-single -f values.yaml -n austin
     ```

5. **Verify Installation:**

   ```sh
   kubectl get pods -A | grep 'vls'
   ```

6. **Port Forward VictoriaLogs (optional):**

   ```sh
   export POD_NAME=$(kubectl get pods --namespace austin -l "app=server" -o jsonpath="{.items[0].metadata.name}")
   kubectl --namespace austin port-forward $POD_NAME 9428
   ```

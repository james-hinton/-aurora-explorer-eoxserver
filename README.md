# Aurora Explorer View Server Setup Guide

## Initial Setup

1. **Start Minikube** with specific resources and mount a local directory to Minikube. Adjust the `--mount-string` path as needed.
   ```bash
   minikube start --mount --mount-string="/<LOCAL_PATH_TO_MOUNT>:/minikube-host/Projects" --cpus=4 --memory=4096
   ```

2. **Enable Ingress** addon in Minikube to manage external access to the services running in the cluster.
   ```bash
   minikube addons enable ingress
   ```

3. **Apply PVC Configuration** to create a Persistent Volume Claim in Kubernetes, allowing storage to persist across pod recreations. Ensure `pvc.yaml` is configured for your storage needs.
   ```bash
   kubectl apply -f pvc.yaml
   ```

4. **Install EOxServer** using Helm. This command deploys your EOxServer based on the provided chart and configuration values.
   ```bash
   helm install aurora-explorer-view-server chart --values chart/values.yaml
   ```

## Configure EOxServer

1. **Access EOxServer Pod** to execute commands inside the container. Replace the pod name with the actual name of your EOxServer pod.
   ```bash
   kubectl exec -it aurora-explorer-view-server-renderer-867c568d9f-qtbqb /bin/bash
   ```

2. **Register Coverage** in EOxServer. This command registers a TIFF file as a coverage within EOxServer, including its metadata.
   ```bash
   python3 manage.py coverage register \
     --data /data/aurora_intensity_20240309180559.tif \
     --type INTENSITY \
     --identifier "AURORA_INTENSITY_20240309180559" \
     --collection AURORA_INTENSITY \
     --meta-data /data/test-stac.json 
   ```

## Accessing the Service

1. **Port Forward** to access EOxServer from your local machine. This makes the EOxServer accessible via `localhost:8081`.
   ```bash
   kubectl port-forward svc/aurora-explorer-view-server-renderer 8081:80
   ```

2. **Test EOxServer** by accessing a coverage through the Web Coverage Service (WCS). Use your browser or a tool like QGIS to access the URL.
   ```plaintext
   http://localhost:8081/ows?service=WCS&request=GetCoverage&coverageid=AURORA_INTENSITY_20240309180559
   ```

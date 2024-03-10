# aurora-explorer-eoxserver
Configuration files and Kubernetes manifests for deploying and managing EOxServer within a Kubernetes cluster. 

It includes dataset definitions, styling, EOxServer settings, Kubernetes deployment descriptors (YAML files), and Argo CD application manifests to automate EOxServer configuration updates.


`docker run -it --rm -p 8080:8000 \
-e DJANGO_USER=admin \
-e DJANGO_MAIL=admin@example.com \
-e DJANGO_PASSWORD=admin \
eoxa/eoxserver`
FROM eoxa/eoxserver

# Copy the ingestion script into the container
COPY ingest_tiffs.sh /opt/eoxserver/

# Make the script executable
RUN chmod +x /opt/eoxserver/ingest_tiffs.sh

# Define the entrypoint script or command to run the ingestion script and then start EOXServer
# You might need to adjust this depending on how EOXServer is started within the container
ENTRYPOINT ["/bin/bash", "-c", "/opt/eoxserver/ingest_tiffs.sh && exec gunicorn --config /opt/eoxserver/gunicorn.conf.py eoxserver_instance.wsgi:application"]

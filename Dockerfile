FROM ollama/ollama

EXPOSE 11434

# Download model on first run if not exists
ENTRYPOINT ["/bin/sh", "-c", "\
  if [ ! -f /root/.ollama/models/blobs/* ]; then \
    ollama serve & sleep 5 && ollama pull llama3.2:1b; \
  fi; \
  exec ollama serve \
"]

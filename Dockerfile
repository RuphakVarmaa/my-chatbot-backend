FROM ollama/ollama
EXPOSE 11434

ENTRYPOINT ["/bin/sh", "-c", "\
  if [ ! -d /root/.ollama/models/llama3.2_1b-small ]; then \
    echo 'Downloading llama3.2:1b-small model...'; \
    ollama serve & \
    until curl -s http://localhost:11434 >/dev/null 2>&1; do sleep 1; done; \
    ollama pull llama3.2:1b-small; \
  fi; \
  exec ollama serve \
"]

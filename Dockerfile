FROM ollama/ollama
EXPOSE 11434

ENTRYPOINT ["/bin/sh", "-c", "\
  if [ ! -d /root/.ollama/models/llama3.2_1b-small ]; then \
    echo 'Pulling llama3.2:1b-small model...'; \
    ollama serve & sleep 5 && ollama pull llama3.2:1b-small; \
  fi; \
  exec ollama serve \
"]

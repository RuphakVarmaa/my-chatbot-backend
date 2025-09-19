FROM ollama/ollama

EXPOSE 11434

# Download model if not present
ENTRYPOINT ["/bin/sh", "-c", "\
  if [ ! -d /root/.ollama/models/llama3.2_1b ]; then \
    echo 'Pulling model...'; \
    ollama pull llama3.2:1b; \
  fi; \
  exec ollama serve \
"]

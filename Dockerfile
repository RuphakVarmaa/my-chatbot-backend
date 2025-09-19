FROM ollama/ollama

EXPOSE 11434

# Pull model if missing
ENTRYPOINT ["/bin/sh", "-c", "\
  if [ ! -d /root/.ollama/models/llama3.2_1b ]; then \
    echo 'Pulling llama3.2:1b model...'; \
    ollama pull llama3.2:1b; \
  fi; \
  exec ollama serve \
"]

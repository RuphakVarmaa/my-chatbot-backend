# Use Ollama base image
FROM ollama/ollama

# Expose Ollama server port
EXPOSE 11434

# Entry point: pull small model if missing, then run Ollama serve
ENTRYPOINT ["/bin/sh", "-c", "\
  if [ ! -d /root/.ollama/models/llama3.2_1b-small ]; then \
    echo 'Pulling llama3.2:1b-small model...'; \
    ollama serve & sleep 5 && ollama pull llama3.2:1b-small; \
  fi; \
  exec ollama serve \
"]

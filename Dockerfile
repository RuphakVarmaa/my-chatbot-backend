FROM ollama/ollama

# Expose Ollama's port
EXPOSE 11434

# Start Ollama server and pull model at runtime
CMD ollama serve & \
  sleep 5 && \
  ollama pull llama3.2:1b && \
  tail -f /dev/null

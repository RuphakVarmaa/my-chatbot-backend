FROM ollama/ollama

# Download the small model at build time so container is ready.
RUN ollama pull llama3.2:1b

# Ollama serve listens on 11434 by default.
EXPOSE 11434

# Start the Ollama HTTP server
CMD ["ollama", "serve"]

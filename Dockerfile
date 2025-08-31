# Use lightweight Alpine Linux
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache bash procps coreutils

# Set working directory
WORKDIR /app

# Copy project files
COPY scripts/ ./scripts/
COPY reports/ ./reports/

# Make scripts executable
RUN chmod +x scripts/*.sh

# Create a non-root user (security best practice)
RUN adduser -D -s /bin/bash healthuser
USER healthuser

# Set default command
CMD ["./scripts/health-check.sh"]
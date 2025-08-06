# Use a lightweight base image
FROM alpine:latest

# Install bash if not already in base image
RUN apk add --no-cache bash

# Copy your script into the container
COPY calculation.sh /app/calculation.sh

# Make it executable
RUN chmod +x /app/calculation.sh

# Run the script when the container starts
CMD ["/app/calculation"]


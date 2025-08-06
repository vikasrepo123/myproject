# Use a lightweight base image
FROM alpine:latest

# Install bash if not already in base image
RUN apk add --no-cache bash

# Copy your script into the container
COPY myscript.sh /app/myscript.sh

# Make it executable
RUN chmod +x /app/myscript.sh

# Run the script when the container starts
CMD ["/app/myscript.sh"]


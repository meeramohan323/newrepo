# Use the official Ubuntu as a parent image
FROM ubuntu:20.04

# Set the working directory
WORKDIR /app



# Add /usr/games to the PATH environment variable
ENV PATH="/usr/games:${PATH}"

# Copy the Wisecow application script into the container
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Install necessary packages
RUN apt-get update && \
    apt-get install -y cowsay fortune-mod fortunes-min netcat && \
    apt-get clean

# Expose the port that the Wisecow app uses
EXPOSE 4499

# Command to run the script when the container starts
CMD ["bash", "/app/wisecow.sh"]


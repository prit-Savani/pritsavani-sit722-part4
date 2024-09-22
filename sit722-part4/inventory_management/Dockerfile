# Use the official Python slim image based on Debian Buster as the base image
FROM python:slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Copy the content of the local "app" directory into the working directory ("/app") inside the container
COPY ./app/. ./

# Copy the "requirements.txt" file from the local machine to the working directory inside the container
COPY requirements.txt ./

# Install the Python dependencies listed in "requirements.txt", without using cache to minimize image size
RUN pip install --no-cache-dir -r requirements.txt

# Run the application using Uvicorn as the ASGI server, specifying the host and port, with the port dynamically set via an environment variable
CMD uvicorn main:app --host 0.0.0.0 --port $PORT

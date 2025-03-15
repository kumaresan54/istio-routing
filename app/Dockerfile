# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install Flask
RUN pip install Flask

# Copy the Python app into the container
COPY app.py .

# Expose the port the app will run on
EXPOSE 8080

# Define the command to run the app
CMD ["python", "app.py"]
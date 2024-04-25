# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install system dependencies
RUN apt-get update && apt-get install -y libglib2.0-0

# Copy the rest of the application code into the container at /app
COPY . .

# Run your Streamlit application
ENTRYPOINT ["streamlit", "run", "Home.py"]

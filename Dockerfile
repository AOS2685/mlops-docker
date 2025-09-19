# Use an official lightweight Python image
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .

# Set proxy environment variables (adapt if your proxy is different)
ENV HTTP_PROXY=http://http.docker.internal:3128
ENV HTTPS_PROXY=http://http.docker.internal:3128


# Install Dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 5000 to outside the container
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]

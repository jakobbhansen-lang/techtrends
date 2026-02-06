# Base image: Python in version 3.8
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# This runs the initialization script during the image build process
RUN python init_db.py

# Expose the application port 3111
EXPOSE 3111

CMD ["python", "app.py"]
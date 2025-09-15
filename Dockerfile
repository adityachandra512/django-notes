FROM python:3.9

# Set working directory
WORKDIR /app/backend

# Copy dependencies first (better caching)
COPY requirements.txt /app/backend

# Install system deps for mysqlclient
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the project
COPY . /app/backend

# Expose Django port
EXPOSE 8000

# Run migrations automatically when container starts (optional)
# You can uncomment these if needed:
# RUN python manage.py migrate
# RUN python manage.py makemigrations

# Start Django server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

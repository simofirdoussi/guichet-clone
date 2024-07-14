# Use the official Python image from the Docker Hub
FROM python:3.9

# Set the working directory in the container
WORKDIR /code

# Copy the requirements file into the container
COPY requirements.txt /code/

# Install the dependencies
RUN pip install -r requirements.txt

# Install Gunicorn
RUN pip install gunicorn

# Copy the current directory contents into the container
COPY . /code/

# Expose the port that Gunicorn will run on
EXPOSE 8000

# Define the command to run the application with Gunicorn
CMD ["gunicorn", "--workers", "3", "--bind", "0.0.0.0:8000", "guichet.wsgi:application"]

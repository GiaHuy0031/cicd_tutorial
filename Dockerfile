FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"

# Install Python and necessary tools
RUN apt update -y && apt install -y python3-pip python3-dev python3-venv build-essential

# Create a working directory
WORKDIR /flask_app

# Copy all project files to the container
ADD . /flask_app

# Create a virtual environment and activate it
RUN python3 -m venv venv

# Install dependencies using the virtual environment's pip
RUN ./venv/bin/pip install --upgrade pip
RUN ./venv/bin/pip install -r requirements.txt

# Use the virtual environment's Python to run the Flask app
ENTRYPOINT ["./venv/bin/python"]
CMD ["flask_docker.py"]

# Use the official Kali Linux Docker image as the base image
FROM kalilinux/kali-rolling

# Set the DEBIAN_FRONTEND environment variable to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y git python3 python3-pip php curl

# Clone the GitHub repository
RUN git clone https://github.com/v4run75/Storm-Breaker-Docker.git

# Set the working directory to the cloned repository
WORKDIR /Storm-Breaker-Docker

# Run the installation script with sudo
RUN bash install.sh

# Install Python dependencies using pip
RUN python3 -m pip install -r requirements.txt

# Run the Python script
CMD ["python3", "st.py"]

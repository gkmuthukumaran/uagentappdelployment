# Use the latest Amazon Linux 2 image
FROM amazonlinux:2

# Install required tools and dependencies
RUN yum -y install which unzip aws-cli git  python38 python38-pip

# Install Nginx
RUN amazon-linux-extras install -y nginx1

# Clone from Git
RUN git clone https://github.com/gkmuthukumaran/useragentapp.git

# Set working directory
WORKDIR /useragentapp

# Copy requirements.txt and install Python dependencies
COPY requirements.txt requirements.txt
RUN pip install Flask

# Copy Flask application code
COPY start.sh /start.sh
COPY nginx_config.conf /etc/nginx/conf.d/virtual.conf

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx and run the Flask application
CMD ["sh", "/start.sh"]
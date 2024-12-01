# Use the official R base image  
FROM rocker/r-ver:4.3.1  

# Install system dependencies (if needed)  
RUN apt-get update && apt-get install -y \  
    libcurl4-openssl-dev \  
    libssl-dev \  
    libxml2-dev \  
    && rm -rf /var/lib/apt/lists/*  

# Set the working directory  
WORKDIR /usr/src/app  

# Copy your project files  
COPY . .  

# Install R dependencies  
RUN Rscript -e "install.packages('renv')"
RUN Rscript -e "renv::restore()"

# Define the entry point  
CMD ["Rscript", "app.R"]  
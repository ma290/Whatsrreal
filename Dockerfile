# Use a Node.js image
FROM node:18

# Install Chromium
RUN apt-get update && apt-get install -y \
    chromium \
    && rm -rf /var/lib/apt/lists/*

# Set the necessary environment variable for Puppeteer to know the location of Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Set the working directory
WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your application
COPY . .

# Expose the app port (adjust this if needed)
EXPOSE 8000

# Start the app
CMD ["npm", "start"]

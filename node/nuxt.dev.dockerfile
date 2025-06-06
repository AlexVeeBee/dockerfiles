# Use Node.js LTS version
FROM node:22

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the development server port
EXPOSE 3000

# Start the development server
CMD ["npm", "run", "dev-docker"]
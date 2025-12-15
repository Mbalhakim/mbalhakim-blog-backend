FROM node:20-alpine

WORKDIR /opt/app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies 
RUN npm ci 

# Copy application code
COPY . .

# Build
RUN npm run build

# Expose the port Strapi runs on
EXPOSE 3000

# Start app
CMD ["sh", "-c", "npm run ${STRAPI_COMMAND:-start}"]

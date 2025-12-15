FROM node:20-alpine

WORKDIR /opt/app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies 
RUN npm ci 

# Copy application code
COPY . .

# Expose the port Strapi runs on
EXPOSE 3000
# Production build
RUN npm run build   
CMD ["npm", "run", "develop"]  # Development mode
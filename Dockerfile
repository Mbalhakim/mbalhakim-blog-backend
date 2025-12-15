FROM node:20-alpine

WORKDIR /opt/app

#Copy package

COPY package.json package-lock.json ./

#install dependencies 
RUN npm ci 

#compoy application code
COPY . .

#build
RUN npm run build

# Expose the port Strapi runs on
EXPOSE 1337

#start app
CMD ["npm", "run", "start"]
FROM node:22.9.0-slim

WORKDIR /app

# It makes sense to copy the package.json first into the container to 
# optimize build speeds such that the build context caches the installation process 
# when a new node package is not installed before going to listening for changes in 
# other parts of the file in the second COPY command and invalidating the cache
COPY package*.json ./ 

RUN ["npm", "install"]
# RUN npm install

COPY . . 

EXPOSE 3000 

CMD ["npm" ,"run", "dev"]
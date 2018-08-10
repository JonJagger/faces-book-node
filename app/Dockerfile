FROM  node:8
LABEL maintainer=jon@jaggersoft.com
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
CMD [ "npm", "start" ]
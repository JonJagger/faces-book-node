FROM  node:8
LABEL maintainer=jon@jaggersoft.com
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
ARG SHA
RUN echo "${SHA}" > .sha
CMD [ "npm", "start" ]

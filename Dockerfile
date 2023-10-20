FROM node:18.17.0-alpine
WORKDIR /app/medusa

COPY package.json .
COPY develop.sh .
# COPY .env .

RUN npm config set fetch-retry-maxtimeout 1000000

RUN npm install -g @medusajs/medusa-cli@latest
RUN npm install @medusajs/admin
RUN npm install
# RUN npm install

COPY . .

EXPOSE 7001
EXPOSE 9000


ENTRYPOINT [ "sh", "develop.sh" ]

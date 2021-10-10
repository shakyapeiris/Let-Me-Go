# escape=`

FROM node:14 as deps

ENV WORKDIR=/app NODE_ENV=production

WORKDIR ${WORKDIR}

COPY package*.json .

RUN npm install

# Copying dependencies

FROM node:14 as prod

ENV WORKDIR=/app NODE_ENV=production

WORKDIR ${WORKDIR}

COPY --from=deps /app/node_modules /node_modules

COPY . .

CMD [ "node", "server.js" ]
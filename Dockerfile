FROM node:erbium-alpine as installer

WORKDIR /app
COPY . .
RUN npm install

FROM node:erbium-alpine

WORKDIR /app
COPY --from=installer /app/node_modules ./node_modules
COPY --from=installer /app/img/ ./img
COPY --from=installer /app/test/ ./test
COPY --from=installer /app/server.js ./server.js
COPY --from=installer /app/package.json ./package.json

CMD ["npm", "start"]

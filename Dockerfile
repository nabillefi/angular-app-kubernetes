# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:1.25.4-alpine3.18
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
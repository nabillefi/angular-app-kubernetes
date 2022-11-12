# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:1.23.2-alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
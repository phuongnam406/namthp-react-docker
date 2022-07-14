FROM node:latest as build
WORKDIR /app
COPY . /app
RUN npm install -g npm@8.14.0 && npm run build -f

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html

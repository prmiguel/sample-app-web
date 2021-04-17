FROM node:12-alpine AS builder
ENV APP_PATH=/usr/src/app/
WORKDIR $APP_PATH
COPY package*.json $APP_PATH
RUN npm install
COPY . $APP_PATH
RUN npm run build

FROM nginx:stable-alpine
COPY --from=builder /usr/src/app/build /usr/share/nginx/html/

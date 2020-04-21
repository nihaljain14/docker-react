FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# start of new FROM below automatically end first FOM and pipelines it with new.
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#no need to put start nginx cmd as nginx itself starts it
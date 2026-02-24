FROM node:24-alpine AS builder

WORKDIR /src

ADD package*.json .

RUN npm install

ADD . .

CMD npm run build 

FROM nginx:alpine 

COPY --from=builder build/* /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
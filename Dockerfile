FROM node:24-alpine AS builder

WORKDIR /src

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

FROM nginx:alpine

COPY --from=builder /src/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
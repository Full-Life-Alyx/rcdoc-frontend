FROM node:20 AS build

WORKDIR /app

ARG VITE_API_LOC

ENV VITE_API_LOC=$VITE_API_LOC

COPY package*.json ./
RUN npm install
COPY . ./
RUN npm run build
RUN ls /app/dist

FROM nginx:1.25-alpine AS final 
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist /usr/share/nginx/html 
RUN touch /usr/share/nginx/html/bullshit
RUN ls /usr/share/nginx/html


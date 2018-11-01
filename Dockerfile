# Build Steps
FROM node:alpine as builder
WORKDIR './app'
COPY package*.json ./
RUN npm install
COPY . .
CMD npm run build

# Run Steps
FROM nginx
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
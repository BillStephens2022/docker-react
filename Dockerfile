# Build Phase
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Run Phase
FROM nginx
# expose port 80
EXPOSE 80
# copy the build folder from the previous phase into the nginx folder (recommended by the nginx documentation)
COPY --from=builder /app/build /usr/share/nginx/html



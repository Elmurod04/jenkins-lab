FROM node:20-alpine
WORKDIR /app
RUN echo "console.log('Hello from the built image!')" > index.js
CMD ["node", "index.js"]

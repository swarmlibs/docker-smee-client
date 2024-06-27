FROM node:22-alpine
COPY dist/index.js /smee-forwarder/server.js
CMD [ "/smee-forwarder/server.js" ]

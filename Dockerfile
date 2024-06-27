FROM node:22-alpine AS builder

RUN --mount=type=bind,source=.,target=/app <<EOF
  cd /app
  corepack enable
  pnpm install --frozen-lockfile
  pnpm exec ncc build src/server.js -o /dist
EOF

FROM node:22-alpine
COPY --from=builder /dist/index.js /smee-forwarder/server.js
CMD [ "/smee-forwarder/server.js" ]

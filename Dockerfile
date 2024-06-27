FROM --platform=$BUILDPLATFORM node:22-alpine AS builder

RUN --mount=type=bind,source=.,target=/app,rw <<EOF
  corepack disable && corepack enable
  cd /app
  pnpm install --frozen-lockfile
  pnpm exec ncc build src/smee-client.js -o /dist
EOF

FROM node:22-alpine
COPY --from=builder /dist/index.js /bin/smee-client
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]

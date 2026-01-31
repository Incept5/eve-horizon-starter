FROM node:20-alpine

# OCI image labels — links this package to the source repo in GHCR
# Replace the URL below with your actual repository URL
LABEL org.opencontainers.image.source="https://github.com/OWNER/REPO"
LABEL org.opencontainers.image.description="Eve Horizon starter API"

WORKDIR /app

COPY package.json index.js ./
COPY public ./public

EXPOSE 3000

CMD ["node", "index.js"]

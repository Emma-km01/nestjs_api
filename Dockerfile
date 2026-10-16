FROM oven/bun:1
WORKDIR /app

# openssl : requis par Prisma
RUN apt-get update -y && \
    apt-get install -y openssl && \
    rm -rf /var/lib/apt/lists/*

# dépendances (copiées avant le code pour profiter du cache)
COPY package.json bun.lock* ./
RUN bun install --frozen-lockfile --ignore-scripts

# code source
COPY . .

# client Prisma + compilation NestJS
RUN bunx prisma generate
RUN bun run build

EXPOSE 3000

# démarrage de l'application
CMD ["bun", "dist/src/main.js"]
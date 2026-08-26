FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# We don't generate Prisma client here because we will override node_modules
# with the volume mount in docker-compose. Instead, we run generate on startup.
EXPOSE 3000

# The startup command is defined in docker-compose.yml
CMD ["npm", "run", "start:dev"]

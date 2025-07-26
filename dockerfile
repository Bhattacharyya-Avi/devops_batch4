FROM node:22-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    zlib1g-dev \
    libffi-dev \
    libpq-dev \
    && apt-get clean &&  rm -rf /var/lib/apt/lists/*
    
COPY package*.json .

RUN npm install 

COPY . /app

RUN npm run check

EXPOSE 3000
CMD ["npm", "start"]
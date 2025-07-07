# Use the official Node.js image as the base image
FROM node:22-alpine

ARG NEXT_PUBLIC_CURR_ENV_FRONTEND="This is a frontend environment variable"
ARG CURR_ENV_BACKEND="This is a backend environment variable"

ENV NEXT_PUBLIC_CURR_ENV_FRONTEND=$NEXT_PUBLIC_CURR_ENV_FRONTEND
ENV CURR_ENV_BACKEND=$CURR_ENV_BACKEND

# Set the working directory in the container
WORKDIR /app

# Copy package.json and pnpm-lock.yaml to the working directory
COPY package.json pnpm-lock.yaml ./

# Install pnpm
RUN npm install -g pnpm

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN pnpm run build

# Expose the port Next.js runs on
EXPOSE 3000

# Start the Next.js application
CMD ["pnpm", "start"]

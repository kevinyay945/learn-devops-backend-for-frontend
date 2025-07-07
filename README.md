# Backend For Frontend (BFF) with Next.js

This project is a Backend For Frontend (BFF) application built using Next.js. It demonstrates how to set up a Next.js project with TypeScript, ESLint, Tailwind CSS, and the App Router.

## Getting Started

### Prerequisites

- Node.js (v22.15.1 or later)
- pnpm

### Installation

1. Clone the repository:

   ```bash
   git clone <your-repository-url>
   cd backend-for-frontend
   ```

2. Install dependencies:

   ```bash
   pnpm install
   ```

### Environment Variables

Create a `.env.local` file in the root of the project based on `.env.example`:

```
NEXT_PUBLIC_CURR_ENV_FRONTEND=Your frontend environment variable value
CURR_ENV_BACKEND=Your backend environment variable value
```

- `NEXT_PUBLIC_CURR_ENV_FRONTEND`: This variable is accessible on the client-side (browser).
- `CURR_ENV_BACKEND`: This variable is only accessible on the server-side.

### Running the Development Server

```bash
pnpm run dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `src/app/page.tsx`. The page auto-updates as you edit the file.

## Building for Production

```bash
pnpm run build
```

This command builds the application for production to the `.next` folder.

## Running in Production

```bash
pnpm run start
```

## Docker

### Build the Docker Image

To build the Docker image, use the following command:

```bash
docker build -t backend-for-frontend .
```

#### Setting Custom Environment Variables during Build

You can set custom values for `NEXT_PUBLIC_CURR_ENV_FRONTEND` and `CURR_ENV_BACKEND` during the Docker image build process using the `--build-arg` flag. If not provided, default values will be used.

```bash
docker build \
  --build-arg NEXT_PUBLIC_CURR_ENV_FRONTEND="Your custom frontend value" \
  --build-arg CURR_ENV_BACKEND="Your custom backend value" \
  -t backend-for-frontend .
```


### Run the Docker Container

```bash
docker run -p 3000:3000 backend-for-frontend
```

## Makefile

This project includes a `Makefile` for common tasks.

- `make build-image`: Builds the Docker image.
- `make push-image`: Pushes the Docker image to a registry (requires `DOCKER_USERNAME` and `DOCKER_REPO` to be set).
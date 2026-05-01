# WanderLust Escapes – Setup Guide

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- **Git** – For cloning the repository
- **PostgreSQL (psql)** – For database management
- **Node.js and npm** – For running the frontend and backend

## Step 1: Clone Repository

```bash
git clone <repo-url>
cd WanderLust\ Escapes
```

## Step 2: Install Dependencies

### Frontend

```bash
cd frontend
npm install
```

### Backend

```bash
cd ../backend
npm install
```

## Step 3: Environment Setup

### Backend

1. Navigate to the `backend` folder
2. Create a `.env` file
3. Add the following environment variables:

```
PORT=5000
DATABASE_URL=postgresql://<user>:<password>@localhost:5432/<dbName>
JWT_SECRET=your_secret
RAZORPAY_KEY_ID=your_key
RAZORPAY_KEY_SECRET=your_secret
```

### Frontend

1. Navigate to the `frontend` folder
2. Create a `.env` file
3. Add the following environment variables:

```
VITE_API_URL=http://localhost:5000/api
VITE_RAZORPAY_KEY=your_key
```

## Step 4: Database Setup

1. Go back to the root directory
2. Ensure the PostgreSQL service is running
3. Create the database (if not already created):

```bash
psql -U <user> -c "CREATE DATABASE <dbName>;"
```

4. Run the schema and dummy data files:

```bash
psql -U <user> -d <dbName> -f schema.sql
psql -U <user> -d <dbName> -f dummy_data.sql
```

## Step 5: Run Project

### Backend

```bash
cd backend
npm run dev
```

### Frontend (in a new terminal)

```bash
cd frontend
npm run dev
```

## Step 6: Access Application

- **Frontend:** `http://localhost:5173`
- **Backend:** `http://localhost:5000`

## Notes

- Ensure PostgreSQL service is running before running the application
- Ensure the database `<dbName>` exists before running SQL files
- Replace placeholders (`<user>`, `<dbName>`, `<repo-url>`) with your actual values
- Keep your `.env` files secure and never commit them to version control

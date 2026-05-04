# NodeAuth — Simple Login Demo

**Stack**: Node.js + Express + PostgreSQL + Vanilla JS

## Structure

```
auth-app/
├── backend/
│   ├── server.js      ← Express API
│   ├── db.js          ← PostgreSQL pool
│   ├── db.sql         ← DB setup SQL
│   ├── .env.example   ← Copy to .env
│   └── package.json
└── frontend/
    ├── serve.js       ← Static file server
    ├── package.json
    └── public/
        ├── index.html     ← Login + Register
        └── dashboard.html ← Protected page
```

## Setup Steps

### 1. PostgreSQL
```bash
psql -U postgres
# Run contents of backend/db.sql
```

### 2. Backend
```bash
cd backend
cp .env.example .env       # Edit DB credentials
npm install
node server.js             # Runs on :3001
```

### 3. Frontend
```bash
cd frontend
npm install
node serve.js              # Runs on :3000
```

### 4. Open http://localhost:3000

---

## API Endpoints

| Method | Endpoint         | Auth     | Description        |
|--------|-----------------|----------|--------------------|
| POST   | /api/register   | No       | Create account     |
| POST   | /api/login      | No       | Get JWT token      |
| GET    | /api/dashboard  | Bearer   | Protected route    |

## Flow

1. Register → POST /api/register (name, email, password)
2. Login → POST /api/login → gets JWT token
3. Dashboard fetches → GET /api/dashboard with `Authorization: Bearer <token>`
4. Logout → clears localStorage

## Test user (already in db.sql)
- Email: test@example.com  
- Password: password123

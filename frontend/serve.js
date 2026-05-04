const express = require('express');
const path = require('path');

const app = express();
app.use(express.json());

// Proxy /api/* → backend container (BACKEND_URL set via docker-compose env)
app.use('/api', async (req, res) => {
  const BACKEND = process.env.BACKEND_URL || 'http://localhost:3001';
  const url = `${BACKEND}/api${req.url}`;

  try {
    const fetch = (await import('node-fetch')).default;
    const headers = { 'Content-Type': 'application/json' };
    if (req.headers.authorization) headers['Authorization'] = req.headers.authorization;

    const body = ['GET', 'HEAD'].includes(req.method) ? undefined : JSON.stringify(req.body);
    const response = await fetch(url, { method: req.method, headers, body });
    const data = await response.json();
    res.status(response.status).json(data);
  } catch (err) {
    res.status(502).json({ error: 'Backend unreachable', detail: err.message });
  }
});

app.use(express.static(path.join(__dirname, 'public')));
app.listen(3000, () => console.log('Frontend on http://localhost:3000'));

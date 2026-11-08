# 🚀 Modula EnvBox Project

## **Overview**
Modula EnvBox is a Dockerized web application that leverages **Express.js (backend), Vite (frontend), MySQL (database)**, and **Nginx (reverse proxy)** for efficient development and deployment.

---

Internet
  │
  ▼ :443 (TLS)
host nginx (apt-installed, on the VM)
  │  terminates TLS, sets X-Forwarded-* headers
  │
  ├─► modula.by      ─► 127.0.0.1:3086 ─► mdl-front:80    (static files, SPA fallback)
  │                                       └► /api/* → mdl-api:3000
  │
  └─► api.modula.by  ─► 127.0.0.1:3087 ─► mdl-api:3000


---

## **🛠 Project Setup**

### **🔹 Prerequisites**
Ensure you have the following installed:
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

### **🔹 Environment Variables**
Edit the `.env` file (if it's needed) with necessary values:

```env
MYSQL_USER=myuser
MYSQL_PASSWORD=mypassword
MYSQL_DATABASE=modula_db
MYSQL_ROOT_PASSWORD=rootpass
```

### 🚀 Running the Project
#### Development Mode
To start the development environment, run the following command:

```bash
$ ./build dev
```

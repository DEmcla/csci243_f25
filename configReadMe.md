# CSCI 243 - Windows 11 Lab Setup Guide
**⏱️ Estimated Setup Time: 5-10 minutes**

This guide will help you set up your lab workstation for the Database Systems course using **VS Code** for all database work. You'll need to follow these steps each time you use a lab computer since changes are not saved between sessions.

## 🚀 Quick Start (For Experienced Users)
```cmd
# 1. Clone repository
git clone https://github.com/DEmcla/csci243_f25.git
cd csci243_f25

# 2. Start database and web interfaces
docker-compose up -d

# 3. Access database through browser:
# Adminer: http://localhost:8080
# pgAdmin: http://localhost:8081 (admin@admin.com / admin)
```

---

## 📋 Prerequisites Check
Before starting, verify these applications are installed:
- [ ] Docker Desktop
- [ ] VS Code
- [ ] pgAdmin
- [ ] Git (command line)

Open **Command Prompt** or **PowerShell** and verify:
```cmd
git --version
docker --version
```

---

## Step 1: Start Docker Desktop 🐳

1. **Launch Docker Desktop**
   - Click Windows Start Menu
   - Type "Docker Desktop"
   - Click to launch
   - Wait for Docker to fully start (whale icon in system tray turns white/stable)

2. **Verify Docker is running**
   - Open PowerShell or Command Prompt
   - Run:
   ```cmd
   docker --version
   docker ps
   ```
   - You should see version info and an empty container list (no errors)

3. **Check Docker settings**
   - Right-click Docker whale icon in system tray
   - Click "Settings"
   - Ensure "Use the WSL 2 based engine" is checked (if available)
   - Click "Apply & Restart" if you made changes

---

## Step 2: Clone Course Repository 📁

1. **Create a working directory**
   ```cmd
   cd C:\Users\%USERNAME%\Documents
   mkdir CSCI243
   cd CSCI243
   ```

2. **Clone the repository**
   ```cmd
   git clone https://github.com/DEmcla/csci243_f25.git
   cd csci243_f25
   ```

3. **Verify files are present**
   ```cmd
   dir
   ```
   You should see:
   - `docker-compose.yml`
   - `docker/` folder
   - `notes/` folder
   - `README.md`

---

## Step 3: Configure Database Environment 🔐

1. **Navigate to project directory**
   ```cmd
   cd C:\Users\%USERNAME%\Documents\CSCI243\csci243_f25
   ```

2. **Create your environment file**
   ```cmd
   copy docker\.env.example docker\.env
   ```

3. **Edit the .env file** (Choose ONE method):

   **Option A: Using Notepad**
   ```cmd
   notepad docker\.env
   ```
   
   **Option B: Using VS Code**
   ```cmd
   code docker\.env
   ```

4. **Update these values** (use your own passwords):
   ```env
   POSTGRES_PASSWORD=YourPasswordHere123!
   POSTGRES_USER=csci243_user
   POSTGRES_DB=csci243_db
   PGADMIN_EMAIL=your.name@student.edu
   PGADMIN_PASSWORD=YourPgAdminPassword456!
   ```
   
   ⚠️ **IMPORTANT**: Remember these passwords! You'll need them to connect.

5. **Save and close the file**
   - Notepad: `Ctrl+S` then close
   - VS Code: `Ctrl+S`

---

## Step 4: Start Database Containers 🚀

1. **Start the containers**
   ```cmd
   docker-compose up -d
   ```
   
   Wait for downloads to complete (first time takes 2-3 minutes)

2. **Verify containers are running**
   ```cmd
   docker-compose ps
   ```
   
   You should see:
   ```
   NAME                STATUS              PORTS
   csci243_postgres    Up                  0.0.0.0:5433->5432/tcp
   csci243_pgadmin     Up                  0.0.0.0:5050->80/tcp
   ```

3. **Check database logs** (optional)
   ```cmd
   docker-compose logs postgres
   ```
   Look for: "database system is ready to accept connections"

---

## Step 5: Configure VS Code 💻

1. **Open VS Code**
   ```cmd
   code .
   ```
   (Or launch from Start Menu and open the csci243_f25 folder)

2. **Install required extensions**
   - Click Extensions icon (or press `Ctrl+Shift+X`)
   - Search and install:
     - **PostgreSQL** by Chris Kolkman
     - **SQLTools** by Matheus Teixeira
     - **SQLTools PostgreSQL/Cockroach Driver** by Matheus Teixeira

3. **Configure PostgreSQL connection**
   - Press `Ctrl+Shift+P` to open command palette
   - Type "PostgreSQL: Add Connection"
   - Enter these details:
     ```
     Host: localhost
     Port: 5433
     Database: csci243_db
     Username: csci243_user
     Password: [your password from .env]
     Display Name: CSCI243 Local DB
     ```
   - Click "Save Connection"

4. **Test the connection**
   - Click the PostgreSQL icon in the sidebar
   - Click your connection name
   - You should see the database schemas

---

## Step 6: Open VS Code Workspace 💻

1. **Open the workspace file**
   ```cmd
   code csci243.code-workspace
   ```
   
2. **Install recommended extensions** (VS Code will prompt you)
   - Click "Install" when VS Code suggests the extensions
   - Required extensions:
     - PostgreSQL by Chris Kolkman
     - SQLTools by Matheus Teixeira
     - SQLTools PostgreSQL Driver

3. **Connect to database**
   - Press `Ctrl+Shift+P` (Command Palette)
   - Type "SQLTools: Connect"
   - Select "CSCI243 Local Database"
   - Connection should establish automatically

4. **Test the connection**
   - Open `sql_examples/01_test_connection.sql`
   - Right-click in the editor → "Run on active connection"
   - You should see PostgreSQL version and test results

---

## Step 7: Verify Everything Works ✅

1. **Test with provided SQL examples**
   - Open `sql_examples/01_test_connection.sql`
   - Click the "Run on active connection" button (or press F5)
   - Should show PostgreSQL version and connection info

2. **Try basic queries**
   - Open `sql_examples/02_basic_queries.sql`
   - Run individual queries by selecting text and pressing F5
   - Creates sample student table and runs queries

3. **Alternative: Command line test**
   ```cmd
   docker exec -it csci243_postgres psql -U csci243_user -d csci243_db -c "SELECT version();"
   ```

**✅ Success indicators:**
- VS Code shows database connection in SQLTools sidebar
- Sample queries return results
- No connection errors in VS Code

---

## 📝 Daily Workflow Checklist

Each time you use a lab computer:

1. **Start Docker Desktop** (wait for it to fully load)
2. **Clone/pull repository**
   ```cmd
   cd C:\Users\%USERNAME%\Documents
   git clone https://github.com/DEmcla/csci243_f25.git
   cd csci243_f25
   ```
3. **Set up environment**
   ```cmd
   copy docker\.env.example docker\.env
   notepad docker\.env
   ```
4. **Start containers**
   ```cmd
   docker-compose up -d
   ```
5. **Open VS Code workspace**
   ```cmd
   code csci243.code-workspace
   ```
6. **Connect to database in SQLTools** (should auto-connect)

---

## 🛑 Shutdown Procedure

Before leaving the lab:

1. **Save your work**
   - Commit any code changes to your GitHub repository
   - Export any important queries

2. **Stop containers**
   ```cmd
   docker-compose down
   ```

3. **Close applications**
   - VS Code
   - pgAdmin (browser tab)
   - Docker Desktop

---

## 🔧 Troubleshooting

### Docker Desktop won't start
- Check if virtualization is enabled in BIOS
- Try: Settings → Apps → Apps & features → Docker Desktop → Advanced options → Repair

### Port 5433 already in use
```cmd
netstat -ano | findstr :5433
docker-compose down
docker-compose up -d
```

### Can't connect to database
1. Check Docker containers are running:
   ```cmd
   docker-compose ps
   ```
2. Verify your password in `.env` file
3. Try `host.docker.internal` instead of `localhost`

### Permission denied errors
- Run Command Prompt or PowerShell as Administrator
- Ensure Docker Desktop is fully started

### VS Code can't find PostgreSQL
- Make sure you selected port `5433` not `5432`
- Try reconnecting after containers are fully started

### pgAdmin connection refused
- Use `host.docker.internal` as hostname
- Ensure you're using port `5433`
- Check that containers are running

---

## 💾 Saving Your Work

Since lab computers reset, save your work:

### Option 1: GitHub (Recommended)
```cmd
git add .
git commit -m "Your message here"
git push origin main
```

### Option 2: Cloud Storage
- Save queries and notes to OneDrive/Google Drive
- Export database schemas if needed:
  ```cmd
  docker exec csci243_postgres pg_dump -U csci243_user csci243_db > backup.sql
  ```

### Option 3: USB Drive
- Copy your entire CSCI243 folder to USB
- Include the `.env` file if you want to keep your passwords

---

## 🚀 Quick Command Reference

```cmd
# Start everything
docker-compose up -d

# Stop everything
docker-compose down

# View logs
docker-compose logs

# Connect to PostgreSQL
docker exec -it csci243_postgres psql -U csci243_user -d csci243_db

# Check container status
docker-compose ps

# Reset database (WARNING: Deletes all data!)
docker-compose down -v
docker-compose up -d
```

---

## 📞 Getting Help

- **Instructor Office Hours**: [Add your office hours]
- **Course Discord/Slack**: [Add link if applicable]
- **Documentation**: Check the `notes/` folder for chapter guides
- **Docker Issues**: https://docs.docker.com/desktop/troubleshoot/overview/

---

**Remember**: This setup is for educational purposes only. Never use these default passwords in production environments!
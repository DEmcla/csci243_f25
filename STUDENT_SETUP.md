# CSCI 243 - Database Setup Instructions
**Time Required: 5 minutes**

## Step 1: Start Docker Desktop
- Click Windows Start Menu → Search "Docker Desktop" → Launch
- Wait for Docker to fully start (whale icon in system tray)

## Step 2: Clone Course Repository
Open Command Prompt or PowerShell and run:
```cmd
cd C:\Users\%USERNAME%\Documents
git clone https://github.com/DEmcla/csci243_f25.git
cd csci243_f25
```

## Step 3: Start Database Containers
```cmd
docker-compose up -d
```
Wait about 30 seconds for everything to start.

## Step 4: Access Your Database

### Option A: Adminer (Recommended - Simple Interface)
1. Open browser: http://localhost:8080
2. Login with:
   - System: **PostgreSQL**
   - Server: **postgres**
   - Username: **csci243_user**
   - Password: **csci243_pass**
   - Database: **csci243_db**
3. Click "Login" - You're ready to write SQL!

### Option B: pgAdmin (Professional Tool)
1. Open browser: http://localhost:8081
2. Login with:
   - Email: **admin@admin.com**
   - Password: **admin**
3. First time only - Add the database server:
   - Right-click "Servers" → Register → Server
   - General tab: Name = **CSCI243 Database**
   - Connection tab:
     - Host: **postgres**
     - Port: **5432**
     - Database: **csci243_db**
     - Username: **csci243_user**
     - Password: **csci243_pass**
     - Save password: ✓
   - Click "Save"

### Option C: Command Line
```cmd
docker exec -it csci243_postgres psql -U csci243_user -d csci243_db
```

## Your Database Structure
- **Database:** csci243_db
- **Schemas:**
  - `practice` - For exercises and experiments
  - `course_work` - For assignments

## Daily Workflow

### Starting Up (Beginning of Class)
1. **Start Docker Desktop**
   - Windows Start Menu → Docker Desktop
   - Wait for whale icon in system tray
2. **Open Command Prompt**
3. **Navigate to project:**
   ```cmd
   cd C:\Users\%USERNAME%\Documents\csci243_f25
   ```
4. **Start containers:**
   ```cmd
   docker-compose up -d
   ```
5. **Open browser** to Adminer (localhost:8080) or pgAdmin (localhost:8081)
6. **Start working!**

### Shutting Down (End of Class)
1. **Save your work:**
   - Export/save any SQL queries you want to keep
   - Copy important queries to a text file
2. **Stop containers:**
   ```cmd
   docker-compose down
   ```
3. **Close Docker Desktop:**
   - Right-click whale icon in system tray
   - Select "Quit Docker Desktop"
4. **Log off Windows**

### Returning Next Class
1. **Start Docker Desktop** (wait for it to load)
2. **Navigate to project:**
   ```cmd
   cd C:\Users\%USERNAME%\Documents\csci243_f25
   ```
3. **Start containers:**
   ```cmd
   docker-compose up -d
   ```
4. **Your database data is preserved!** All tables and data remain intact

## Troubleshooting

**Docker not starting?**
- Make sure Docker Desktop is fully loaded (check system tray)

**Port already in use?**
```cmd
docker-compose down
docker-compose up -d
```

**Can't connect to database?**
- Wait 30 seconds after `docker-compose up -d`
- Try refreshing the browser

**Need to start fresh?**
```cmd
docker-compose down -v
docker-compose up -d
```

## Important Notes

### What Persists Between Sessions
✅ **Database data** - All tables, schemas, and data remain in Docker volumes
✅ **pgAdmin server connection** - Once configured, it's saved
✅ **Git repository** - The csci243_f25 folder remains

### What Gets Reset
❌ **Browser logins** - You'll need to log into Adminer/pgAdmin again
❌ **Unsaved SQL queries** - Save your work before leaving!
❌ **Docker state** - Need to start containers each time

---
*Lab computers reset user profiles - always save important queries to files!*
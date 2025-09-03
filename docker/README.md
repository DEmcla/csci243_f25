# Docker PostgreSQL Setup for CSCI 243

This Docker setup provides a containerized PostgreSQL database for your database course work.

## 🔒 SECURITY NOTICE
**IMPORTANT: This configuration is for LOCAL DEVELOPMENT ONLY**
- Change ALL passwords immediately after setup
- Never use these default credentials in production
- Don't commit .env files with real passwords to GitHub
- If running on cloud/VPS, implement proper firewall rules
- Default passwords are for educational convenience only

## Prerequisites

- Docker Desktop installed (Windows, macOS, or Linux)
- Basic familiarity with terminal commands

## Quick Start

1. **FIRST TIME ONLY - Update passwords in `.env` file:**
   ```bash
   # Edit docker/.env and change these values:
   POSTGRES_PASSWORD=YourSecurePasswordHere
   PGADMIN_PASSWORD=YourAdminPasswordHere
   ```

2. **Start the containers:**
   ```bash
   cd [your-course-directory]
   docker-compose up -d
   ```

3. **Verify the containers are running:**
   ```bash
   docker-compose ps
   ```

4. **Stop the containers:**
   ```bash
   docker-compose down
   ```

## Connection Information

### For All Users (Local Development)
- **Host:** localhost (or 127.0.0.1)
- **Port:** 5433
- **Database:** csci243_db
- **Username:** csci243_user
- **Password:** [Your password from .env file]

### Special Cases

#### Windows via Parallels (Mac host)
First, find your Mac's IP address:
```bash
ipconfig getifaddr en0
```
Or use the Parallels shared network IP (usually `10.211.55.2`)

Use your Mac's IP instead of localhost

#### Docker Toolbox (older Windows)
Use the Docker Machine IP (usually `192.168.99.100`) instead of localhost

### pgAdmin Web Interface
- **URL:** http://localhost:5050 (Mac) or http://[Mac-IP]:5050 (Windows)
- **Email:** admin@csci243.local
- **Password:** admin

## VS Code Configuration

### For PostgreSQL Extension
1. Install the PostgreSQL extension by Chris Kolkman
2. Add a new connection with the connection info above
3. Use Mac's IP address when connecting from Windows

### Connection String Examples
```
# From Mac
postgresql://csci243_user:Password123@localhost:5433/csci243_db

# From Windows (replace with your Mac's IP)
postgresql://csci243_user:Password123@10.211.55.2:5433/csci243_db
```

## Database Structure

The database is initialized with two schemas:
- **course_work:** For your assignments and course projects
- **practice:** For textbook exercises and experiments

## Common Commands

### View logs
```bash
docker-compose logs postgres
```

### Execute SQL directly
```bash
docker exec -it csci243_postgres psql -U csci243_user -d csci243_db
```

### Backup database
```bash
docker exec csci243_postgres pg_dump -U csci243_user csci243_db > backup.sql
```

### Restore database
```bash
docker exec -i csci243_postgres psql -U csci243_user -d csci243_db < backup.sql
```

### Reset everything (WARNING: Deletes all data!)
```bash
docker-compose down -v
docker-compose up -d
```

## Data Persistence

Your database data is stored in Docker volumes and will persist between container restarts. The volumes are:
- `csci243_postgres_data` - PostgreSQL data
- `csci243_pgadmin_data` - pgAdmin configuration

## Troubleshooting

### Port 5433 already in use
Change the port in `docker-compose.yml`:
```yaml
ports:
  - "5434:5432"  # Change 5433 to another port
```

### Can't connect from Windows
1. Ensure Docker Desktop is running on Mac
2. Check Mac's firewall settings
3. Verify the IP address is correct
4. Try using `host.docker.internal` as hostname

### Container won't start
```bash
# Check logs
docker-compose logs postgres

# Remove and recreate
docker-compose down -v
docker-compose up -d
```

## Platform-Specific Notes

### macOS
- Works natively with Docker Desktop
- Use `localhost` for connections

### Windows
- Install Docker Desktop for Windows
- Use `localhost` for connections
- WSL2 backend recommended

### Linux
- Install Docker and Docker Compose
- May need to use `sudo` for docker commands
- Add your user to docker group: `sudo usermod -aG docker $USER`

## Sharing This Configuration

Students and colleagues can use these files to create an identical PostgreSQL environment:
1. Copy all files from the docker folder
2. Update passwords in `.env`
3. Run `docker-compose up -d`
4. Each person gets their own isolated instance

## Security Best Practices

1. **For Students:**
   - Always change default passwords
   - Keep Docker Desktop updated
   - Only bind to localhost for local development

2. **For Production/Cloud:**
   - NEVER use these default credentials
   - Use environment-specific secrets management
   - Implement proper firewall rules
   - Use SSL/TLS connections

3. **For Version Control:**
   - Add `.env` to `.gitignore`
   - Share `.env.example` instead of actual `.env`
   - Document required environment variables

## Educational Benefits

- ✅ Consistent environment across all student machines
- ✅ Easy reset: `docker-compose down -v && docker-compose up -d`
- ✅ No conflicts with existing software
- ✅ Platform independent (Windows/Mac/Linux)
- ✅ Matches production-like environments

Remember: This configuration prioritizes ease of setup for learning. Production deployments require additional security hardening.
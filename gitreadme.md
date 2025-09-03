# GitHub Setup Instructions for CSCI 243

This guide is for students who prefer to install PostgreSQL and pgAdmin locally on their machines rather than using Docker.

## Prerequisites
- Git installed on your computer
- GitHub account (free at github.com)
- PostgreSQL installed locally
- pgAdmin installed locally

## Step 1: Clone the Course Repository

Open your terminal or command prompt and run:

```bash
git clone https://github.com/[instructor-username]/csci243_f25.git
cd csci243_f25
```

Replace `[instructor-username]` with the actual GitHub username provided by your instructor.

## Step 2: Set Up Your Personal Fork (Recommended)

1. Go to the course repository on GitHub
2. Click the "Fork" button in the top-right corner
3. This creates your own copy where you can save your work

Clone your fork instead:
```bash
git clone https://github.com/[your-username]/csci243_f25.git
cd csci243_f25
```

## Step 3: Configure Git Remotes

Set up both the instructor's repository (upstream) and your fork:

```bash
# Add the instructor's repo as "upstream"
git remote add upstream https://github.com/[instructor-username]/csci243_f25.git

# Verify your remotes
git remote -v
```

You should see:
- `origin` - Your fork (where you push your work)
- `upstream` - Instructor's repository (where you pull updates)

## Step 4: Staying Updated with Course Materials

To get the latest course materials from your instructor:

```bash
# Fetch latest changes from instructor
git fetch upstream

# Merge instructor's changes into your main branch
git checkout main
git merge upstream/main

# Push updates to your fork
git push origin main
```

## Step 5: Working on Assignments

For each assignment or lab:

1. Create a new branch:
```bash
git checkout -b assignment-name
```

2. Make your changes and commit them:
```bash
git add .
git commit -m "Complete assignment: [description]"
```

3. Push to your fork:
```bash
git push origin assignment-name
```

## Step 6: Local Database Setup

Since you're not using Docker, ensure you have:

1. **PostgreSQL** running locally
   - Default port: 5432
   - Create databases as needed for assignments

2. **pgAdmin** for database management
   - Connect to localhost:5432
   - Use your local PostgreSQL credentials

## Common Git Commands

- `git status` - Check what files have changed
- `git add [file]` - Stage files for commit
- `git commit -m "message"` - Save your changes
- `git push` - Upload changes to GitHub
- `git pull` - Download latest changes
- `git log` - View commit history

## Troubleshooting

### Permission Denied
If you get permission errors when pushing:
1. Make sure you're pushing to your fork, not the instructor's repo
2. Check your GitHub authentication (use personal access tokens, not passwords)

### Merge Conflicts
If you encounter merge conflicts when updating from upstream:
1. Review the conflicted files
2. Edit them to resolve conflicts
3. Add and commit the resolved files
4. Continue with your work

## Getting Help

- Check the course Canvas page for announcements
- Post questions in the course discussion forum
- Contact your instructor or TA during office hours

## Important Notes

- **Never commit sensitive information** (passwords, API keys, etc.)
- **Regular commits** help track your progress
- **Pull from upstream frequently** to stay updated with course materials
- **Keep your fork updated** to avoid conflicts

## Resources

- [GitHub Documentation](https://docs.github.com)
- [Git Basics Tutorial](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [pgAdmin Documentation](https://www.pgadmin.org/docs/)
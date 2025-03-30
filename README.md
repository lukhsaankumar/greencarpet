# 🟢 Green Carpet 

The `daily_commit.sh` script automatically commits daily changes to your repository by updating a `commit.md` file — complete with a message and an incrementing counter, in order to have your GitHub contribution graph resemble a **green carpet**.

---

## ⚙️ How it works

- An array stores creative commit messages.
- A random message is picked using `$RANDOM` and Bash indexing.
- If `commit.md` doesn't exist, it’s created with `🚀 Automated 0 commits so far.` and added to git.
- Each day, the script reads the current number from the file, increments it, and updates it to:

```
🚀 Automated 123 commits so far.
```

- It sets up Git user info locally for GitHub Actions commits.
- Finally, the script commits the update with the chosen message and commit number.

---

## 🔧 Setup Instructions

1. **Fork this repository** and enable GitHub Actions under the "Actions" tab if prompted.

2. **Customize your Git identity**  
   Edit `daily_commit.sh` and replace:

   ```bash
   git config --local user.email "your-email@users.noreply.github.com"
   git config --local user.name "your-username"
   ```

3. **Schedule your daily commits**  
   Modify the cron schedule in `.github/workflows/auto_commit.yml`.  
   Example: Run daily at 9:00 AM UTC (4:00 AM EST):
   ```yaml
   schedule:
     - cron: "0 9 * * *"
   ```

   Use [crontab.guru](https://crontab.guru) to customize the timing.

4. **Configure GitHub Token permissions**
   - Go to your repository **Settings → Actions → General**
   - Scroll to **Workflow permissions**
   - Enable **Read and write permissions**
   - Click **Save**

---

## ⏰ Time Zone Reminder

GitHub Actions runs on **UTC time**.  
So if you're targeting a specific local time (e.g., 11:59 PM EST), be sure to convert it to UTC in your cron schedule!
# 🏥 System Health Monitor

A beginner-friendly DevOps project that demonstrates automation, containerization, and CI/CD using Bash, Docker, and GitHub Actions.

## 🚀 What This Project Does

- Monitors system disk usage, memory, and processes
- Generates health reports with timestamps
- Runs in Docker containers
- Automated testing with GitHub Actions

## 📁 Project Structure
system-health-monitor/
├── scripts/
│ ├── health-check.sh # Main monitoring script
│ ├── generate-report.sh # Report generator
│ └── test.sh # Test suite
├── reports/ # Generated reports
├── .github/workflows/
│ └── ci.yml # GitHub Actions CI/CD
├── Dockerfile # Container definition
└── README.md
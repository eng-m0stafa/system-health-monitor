#!/bin/bash
# System Health Monitor 

echo "🏥 SYSTEM HEALTH MONITOR"
echo "========================"
echo "Report generated: $(date)"
echo ""

# Function to check disk usage
check_disk_usage() {
    echo "💾 DISK USAGE"
    echo "-------------"
    if command -v df > /dev/null; then
        df -h | grep -E '^/dev/|^Filesystem' | awk 'NR==1{print $0} NR>1{print $1 " " $5 " used (" $3 "/" $2 ")"}'
    else
        echo "df command not available"
    fi
    echo ""
}

# Function to check memory usage
check_memory() {
    echo "🧠 MEMORY USAGE"
    echo "---------------"
    if command -v free > /dev/null; then
        free -h | grep -E 'Mem|total'
    else
        echo "free command not available"
    fi
    echo ""
}

# Function to check top processes
check_processes() {
    echo "⚙️  TOP PROCESSES (by CPU)"
    echo "------------------------"
    if command -v ps > /dev/null; then
        ps aux 2>/dev/null | head -6 | tail -5 2>/dev/null || echo "Process info not available"
    else
        echo "ps command not available"
    fi
    echo ""
}

# Function to check system uptime
check_uptime() {
    echo "⏰ SYSTEM UPTIME"
    echo "----------------"
    if command -v uptime > /dev/null; then
        uptime
    else
        echo "uptime command not available"
    fi
    echo ""
}

# Main execution
echo "Starting health check..."
echo ""

check_disk_usage
check_memory  
check_processes
check_uptime

echo "✅ Health check completed!"
echo "Report saved at: $(date)"
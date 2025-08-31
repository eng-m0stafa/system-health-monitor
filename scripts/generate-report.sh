#!/bin/bash
# Generate and save health reports

# Create reports directory if it doesn't exist
mkdir -p reports

# Generate timestamp for filename
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
report_file="reports/health_report_${timestamp}.txt"

echo "📋 GENERATING HEALTH REPORT"
echo "==========================="
echo "Report will be saved to: $report_file"
echo ""

# Run health check and save to file
./scripts/health-check.sh > "$report_file" 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Report generated successfully!"
    echo "📄 File: $report_file"
    echo ""
    echo "Preview of report:"
    echo "==================="
    head -10 "$report_file"
    echo "... (report continues)"
else
    echo "❌ Failed to generate report"
    exit 1
fi
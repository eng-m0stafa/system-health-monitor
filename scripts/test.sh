#!/bin/bash
# Test script for health monitor

echo "🧪 RUNNING HEALTH MONITOR TESTS"
echo "==============================="

# Test 1: Check if main script exists
echo "Test 1: Checking if health-check.sh exists..."
if [ -f "scripts/health-check.sh" ]; then
    echo "✅ PASS: health-check.sh found"
else
    echo "❌ FAIL: health-check.sh not found"
    exit 1
fi

# Test 2: Check if script is executable
echo ""
echo "Test 2: Checking if script is executable..."
if [ -x "scripts/health-check.sh" ]; then
    echo "✅ PASS: health-check.sh is executable"
else
    echo "⚠️  WARNING: Making script executable..."
    chmod +x scripts/health-check.sh
    echo "✅ FIXED: Script is now executable"
fi

# Test 3: Run the script and check for output
echo ""
echo "Test 3: Testing script execution..."
output=$(./scripts/health-check.sh 2>&1)

if [ ! -z "$output" ]; then
    echo "✅ PASS: Script produces output"
else
    echo "❌ FAIL: Script produces no output"
    exit 1
fi

# Test 4: Check for expected content
echo ""
echo "Test 4: Checking output content..."
if echo "$output" | grep -q "HEALTH MONITOR"; then
    echo "✅ PASS: Output contains health monitor header"
else
    echo "❌ FAIL: Output missing expected header"
    exit 1
fi

echo ""
echo "🎉 ALL TESTS PASSED!"
echo "===================="
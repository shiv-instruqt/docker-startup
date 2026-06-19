# Run the Flask Application

Since Docker is not available in this environment, we will run the Flask application directly using Python.

---

## Overview

Your environment has been pre-configured with:
- Python 3 installed
- Flask and dependencies installed
- A Flask app running on **port 5000**

---

## Step 1: Verify the Flask App is Running

In the **Terminal** tab, run:

```bash
curl http://localhost:5000
```

You should see the **Year Converter** HTML response.

---

## Step 2: Check the API Endpoint

```bash
curl http://localhost:5000/api/server-info
```

Expected output:

```json
{
  "private_ip": "x.x.x.x",
  "public_ip": "x.x.x.x"
}
```

---

## Step 3: View the App in the Browser

Switch to the **Flask_app** tab to see the Year Converter running live.

---

## Step 4: Check the App Logs

```bash
cat /var/log/flask-app.log
```

---

<instruqt-task id="check_docker"></instruqt-task>

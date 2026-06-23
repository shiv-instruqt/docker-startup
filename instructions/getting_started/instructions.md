# 🗓️ Leap Year Finder

Welcome to the **Leap Year Finder** lab! In this lab, you'll interact with a running Flask web application hosted inside a live VM sandbox.

---

## 📖 What Is a Leap Year?

A leap year is a year that has **366 days** instead of the usual 365. An extra day (February 29) is added to keep the calendar in sync with Earth's orbit around the Sun.

A year is a **leap year** if:
- It is **divisible by 4**, AND
- It is **NOT divisible by 100** — unless it is also **divisible by 400**

**Examples:**
| Year | Leap Year? | Reason |
|------|-----------|--------|
| 2024 | ✅ Yes | Divisible by 4 |
| 1900 | ❌ No  | Divisible by 100, not 400 |
| 2000 | ✅ Yes | Divisible by 400 |
| 2025 | ❌ No  | Not divisible by 4 |

---

## 🚀 What To Do

### Step 1 — Open the App
Click the **Service** tab on the right panel. The Leap Year Finder web app will load in your browser.

### Step 2 — Enter a Year
You will see a text input field in the center of the page.

- Type **any year** into the input box (e.g., `1999`, `2100`, `2024`)
- Press **Enter** or click the **Find Leap Year** button

### Step 3 — Read the Result
The app will display the result below the button instantly.

---

## 📤 What You Will Get as Output

The result card shows three things:

| Output | Description |
|--------|-------------|
| **Nearest Leap Year** | Displayed in large text — the closest leap year to your input |
| **Message** | A plain-English explanation of the result |
| **Distance Badge** | How many years away the nearest leap year is (e.g., `Distance: 1 yr`) |

### Example Outputs

**Input:** `2025`
> Nearest leap year: **2024**
> Nearest leap year is 2024 (1 year previous).
> `Distance: 1 yr`

---

**Input:** `2024`
> Nearest leap year: **2024**
> 2024 is already a leap year!
> `✓ Leap Year`

---

**Input:** `2100`
> Nearest leap year: **2096**
> Nearest leap year is 2096 (4 years previous).
> `Distance: 4 yrs`

---

**Input:** `2099`
> Nearest leap year: **2096 & 2104**
> Equidistant! Both 2096 and 2104 are 3 year(s) away.
> `Distance: 3 yrs`

---

## 💡 Tips

- The app works **entirely offline** — no external API is called
- You can toggle between **Dark** and **Light** mode using the button in the top-right corner
- The **Private IP** of the VM is shown in the top-left badge for reference
- Try entering **edge case years** like `400`, `1900`, or `2000` to see the leap year rules in action

---

## ✅ Goal

By the end of this lab, you should be able to:

1. Understand the rules that define a leap year
2. Use the Leap Year Finder to look up any year
3. Interpret the output — nearest leap year, direction, and distance

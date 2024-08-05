---
theme: dashboard
title: Nephrology Candidates
---

```js
const eras_2025_total = FileAttachment("./data/eras_2025_total.csv").csv({ typed: true });
const eras_2025_edu = FileAttachment("./data/eras_2025_edu.csv").csv({ typed: true});
```
## ERAS 2025—Nephrology Candidates Through ${eras_2025_edu[eras_2025_edu.length - 1]["ERAS"]}

<!-- Cards with big numbers -->

<div class="grid grid-cols-4">
  <div class="card">
    <h2>Application Data Through</h2>
    <span class="big">${eras_2025_total[eras_2025_total.length - 1]["month_name"]},  ${eras_2025_edu[eras_2025_edu.length - 1]["ERAS"]}</span>
  </div>
  <div class="card">
    <h2>IMG Candidates</h2>
    <span class="big">${eras_2025_edu.filter((d) => d.ERAS === 2018)
      .filter((d) => d.month === 9)
      .filter((d) => d.edu_status === "IMG")
      .map((d) => d.num_candidate)}</span>
  </div>
  <div class="card">
    <h2>US MD Candidates</h2>
    <span class="big">${eras_2025_edu.filter((d) => d.ERAS === 2018)
      .filter((d) => d.month === 9)
      .filter((d) => d.edu_status === "US MD")
      .map((d) => d.num_candidate)}</span>
  </div>
  <div class="card">
    <h2>Osteopathic Candidates</h2>
    <span class="big">${   eras_2025_edu.filter((d) => d.ERAS === 2018)
      .filter((d) => d.month === 9)
      .filter((d) => d.edu_status === "US DO")
      .map((d) => d.num_candidate)}</span>
  </div>
</div>


```js
Inputs.table(eras_2025_total)
```

<br>

```js
Inputs.table(eras_2025_edu)
```
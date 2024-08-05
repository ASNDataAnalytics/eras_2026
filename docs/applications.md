---
theme: midnight
title: Nephrology Applications
---

```js

const eras_2025_edu = FileAttachment("./data/eras_2025_edu.csv").csv({ typed: true});

```

<!-- Cards with big numbers -->

<!-- <div class="grid grid-cols-4">
  <div class="card">
    <h2>Application Year</h2>
    <span class="big">${eras_2025_edu[eras_2025_edu.length - 1][ERAS]}</span>
  </div>
  <div class="card">
    <h2>Russia 🇷🇺 <span class="muted">/ Soviet Union</span></h2>
    <span class="big">${launches.filter((d) => d.stateId === "SU" || d.stateId === "RU").length.toLocaleString("en-US")}</span>
  </div>
  <div class="card">
    <h2>China 🇨🇳</h2>
    <span class="big">${launches.filter((d) => d.stateId === "CN").length.toLocaleString("en-US")}</span>
  </div>
  <div class="card">
    <h2>Other</h2>
    <span class="big">${launches.filter((d) => d.stateId !== "US" && d.stateId !== "SU" && d.stateId !== "RU" && d.stateId !== "CN").length.toLocaleString("en-US")}</span>
  </div>
</div> -->

```js

Plot.plot({
  marks: [
    Plot.ruleY([0]),

    Plot.barY(eras_2025_edu, {
      x: "ERAS", 
      y: "num_candidate",
      tip: true,
      fill: "#ff8200"
    }),
  ]
})

```

```js
eras_2025_edu[eras_2025_edu.length - 1]["ERAS"]
```

```js
Inputs.table(
  eras_2025_edu.filter((d) => d.edu_status === "IMG" & d.ERAS === 2018 & d.month_name === "July")
)

```

```js
(3 / (eras_2025_edu[eras_2025_edu.length -1].num_application))

```
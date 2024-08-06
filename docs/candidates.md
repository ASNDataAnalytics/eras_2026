---
theme: midnight
toc: false
title: Nephrology Candidates
---

<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Roboto', sans-serif;
}

.observablehq {
  font-family: 'Roboto', sans-serif;
  font-size: 3em;
}

svg {
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
}

</style>

```js
const eras_2025_total = FileAttachment("./data/eras_2025_total.csv").csv({ typed: true });
const eras_2025_edu = FileAttachment("./data/eras_2025_edu.csv").csv({ typed: true});
  const july_regression = [{"Year":2014,"July":303,"Matched":306},{"Year":2015,"July":274,"Matched":254},{"Year":2016,"July":236,"Matched":276},{"Year":2017,"July":235,"Matched":284},{"Year":2018,"July":252,"Matched":285},{"Year":2019,"July":286,"Matched":291},{"Year":2020,"July":273,"Matched":291},{"Year":2021,"July":375,"Matched":345},{"Year":2022,"July":349,"Matched":335},{"Year":2023,"July":368,"Matched":359}];
```
<!-- ## ERAS 2025—Nephrology Candidates Through ${eras_2025_edu[eras_2025_edu.length - 1]["ERAS"]} -->
###### ERAS 2025—Nephrology Candidates


<!-- Cards with big numbers -->

<div class="grid grid-cols-4">
  <div class="card">
    <h2>Data Through</h2>
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

---

<!-- Visualizations Row 1 -->

<div class="grid grid-cols-2">
  <div class="card">
  <h2>fig 1</h2>
  ${
    resize((width) => Plot.plot({
      title: "Predicted Nephrology Match Outcome",
  width,
  grid: true,
  x: {label: "July Nephrology Candidates"},
  y: {label: "Matched Nephrology Fellows"},
  color: {legend: true},
  marginBottom: 50,
  marginLeft: 60,
  marks: [
    Plot.linearRegressionY(
      july_regression, 
      {x: "July", y: "Matched", stroke: "#ff8200"}
    ),
    Plot.dot(
      july_regression, 
      {x: "July", y: "Matched", tip: true}
    ),
    Plot.dot(
      [{x: 300, y: 300}], 
      {
        x: "x",
        y: "y",
        r:10,
        fill: "#ff8200",
        tip: true,
        title: (d) => `July Candidates: ${d.x}\nPredicted Matches: ${d.y.toLocaleString("en-US")}`
    })
  ]
  }))
}

</div>

  <div class="card">
  <h2>fig 1</h2>
  ${
    resize((width) => Plot.plot({
      title: "Predicted Nephrology Match Outcome",
  width,
  grid: true,
  x: {label: "July Nephrology Candidates"},
  y: {label: "Matched Nephrology Fellows"},
  color: {legend: true},
  marginBottom: 50,
  marginLeft: 60,
  marks: [
    Plot.linearRegressionY(
      july_regression, 
      {x: "July", y: "Matched", stroke: "#ff8200"}
    ),
    Plot.dot(
      july_regression, 
      {x: "July", y: "Matched", tip: true}
    ),
    Plot.dot(
      [{x: 300, y: 300}], 
      {
        x: "x",
        y: "y",
        r:10,
        fill: "#ff8200",
        tip: true,
        title: (d) => `July Candidates: ${d.x}\nPredicted Matches: ${d.y.toLocaleString("en-US")}`
    })
  ]
  }))
}

</div>
</div>

---

<!-- Visualizations Row 2 -->

<div class="grid grid-cols-2">
  <div class="card">
  <h2>fig 1</h2>
  ${
    resize((width) => Plot.plot({
      width,
      x: { tickFormat: "", label: "ERAS", labelOffset: 35 },
      marks: [
        Plot.ruleY([0]),
        Plot.barY(eras_2025_edu, {
          x: "ERAS", 
          y: "num_candidate",
          tip: true,
          fill: "#ff8200", 
          insetLeft: 10, 
          insetRight: 10
        })
      ],
      marginBottom: 60
    })
  )
}

</div>

  <div class="card">
  <h2>fig 1</h2>
  ${
    resize((width) => Plot.plot({
      width,
      x: { tickFormat: "", label: "ERAS", labelOffset: 35 },
      marks: [
        Plot.ruleY([0]),
        Plot.barY(eras_2025_edu, {
          x: "ERAS", 
          y: "num_candidate",
          tip: true,
          fill: "#ff8200", 
          insetLeft: 10, 
          insetRight: 10
        })
      ]
    })
  )
}

</div>
</div>



<!-- ```js
Inputs.table(eras_2025_total)
```

<br>

```js
Inputs.table(eras_2025_edu)
``` -->
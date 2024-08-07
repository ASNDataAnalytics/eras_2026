---
toc: false
theme: midnight
---

<!-- 00 Styling -->

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

p {
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
}

/* #observablehq-footer > div:nth-child(2) > a:nth-child(1){
  font-size: 3em;
} */

</style>

<!-- 01 Data -->

```js
const july_regression = [
  {"Year":2014,"July":303,"Matched":306},
  {"Year":2015,"July":274,"Matched":254},
  {"Year":2016,"July":236,"Matched":276},
  {"Year":2017,"July":235,"Matched":284},
  {"Year":2018,"July":252,"Matched":285},
  {"Year":2019,"July":286,"Matched":291},
  {"Year":2020,"July":273,"Matched":291},
  {"Year":2021,"July":375,"Matched":345},
  {"Year":2022,"July":349,"Matched":335},
  {"Year":2023,"July":368,"Matched":359},
  {"Year":2024,"July":313,"Matched":321}
  ];
  
const cum_apps_year = FileAttachment("./data/cum_apps_year.csv").csv({ typed: true });
const reg_result = FileAttachment("./data/reg_result.csv").csv({ typed: true });
```

<h4>ERAS 2025 Nephrology Fellowship Applications</h43>

<br>

<p>Data provided by the Electronic Residency Application System (ERAS) on the 
appointment year (AY) 2025 nephrology Match .</p>

<!-- 02 Viz -->

<div class="grid grid-cols-1" style="grid-auto-rows: 504px;">
  <div class="card">
    <h2>
      <b>Predicted Matches for AY 2025</b>
    </h2> 
  ${
    resize((width) => Plot.plot({
      title: "Predicted Nephrology Match Outcome",
      width,
      grid: true,
      x: {label: "July Nephrology Candidates"},
      y: {label: "Matched Nephrology Fellows"},
      color: {legend: true},
      marginBottom: 50,
      caption: "Sources: NRMP and ERAS",
      marginLeft: 60,
      marks: [
        Plot.linearRegressionY(
          july_regression, 
          {x: "July", y: "Matched", stroke: '#ff8200'}
        ),
        Plot.dot(
          july_regression, 
          {x: "July", y: "Matched", tip: true}
        ),
        Plot.dot(
          [{"July": 313, "Matched": 313}], 
          {
            x: "July",
            y: "Matched",
            r: 10,
            fill: "#ff8200",
            tip: true,
            title: (d) => `July Candidates: ${d.July}\nPredicted Matches: ${d.Matched.toLocaleString("en-US")}`
          })
        ]
      })
    )
  }

  </div>
</div>

```js
Inputs.table(reg_result)
```

---



---
toc: false
theme: midnight
header: <a href="https://data.asn-online.org"><img src="/asn_ko_button.png"></a>
footer: <a href="https://data.asn-online.org">ASN Data</a>
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

p {
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
}

.hero {
  display: flex;
  flex-direction: column;
  align-items: center;
  font-family: 'Roboto', sans-serif;
  margin: 4rem 0 8rem;
  color: "#0077c8";
  text-wrap: balance;
  text-align: center;
}

.hero h2 {
  margin: 0;
  max-width: 34em;
  font-size: 2em;
  font-style: initial;
  font-weight: 500;
  color: "#0077c8";
  line-height: 1.5;
}
#observablehq-footer > div:nth-child(2) > a:nth-child(1){
  font-size: 3em;
}

@media (min-width: 640px) {
  .hero h1 {
    font-size: 90px;
  }
}

</style>

<!-- <div class="hero"> -->
  <h4>ERAS 2025 Nephrology Fellowship Applications</h43>
<!-- </div> -->

<br>

<p>Data provided by the Electronic Residency Application System (ERAS) on the 
appointment year (AY) 2025 nephrology Match.</p>

<div class="grid grid-cols-21" style="grid-auto-rows: 504px;">
  <div class="card">${
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

```js
const aapl = FileAttachment("aapl.csv").csv({typed: true});
const penguins = FileAttachment("penguins.csv").csv({typed: true});
const eras_2025_edu = FileAttachment("./data/eras_2025_edu.csv").csv({ typed: true});
const eras_2025_total = FileAttachment("./data/eras_2025_total.csv.r").csv({ typed: true });

const july_regression = [{"Year":2014,"July":303,"Matched":306},{"Year":2015,"July":274,"Matched":254},{"Year":2016,"July":236,"Matched":276},{"Year":2017,"July":235,"Matched":284},{"Year":2018,"July":252,"Matched":285},{"Year":2019,"July":286,"Matched":291},{"Year":2020,"July":273,"Matched":291},{"Year":2021,"July":375,"Matched":345},{"Year":2022,"July":349,"Matched":335},{"Year":2023,"July":368,"Matched":359}]
```

---



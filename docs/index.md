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

<div class="hero">
  <h2>ERAS 2025 Nephrology Fellowship Applications</h1>
</div>

<div class="grid grid-cols-1" style="grid-auto-rows: 504px;">
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


<div class="grid grid-cols-4">
  <div class="card">
    Chart your own data using <a href="https://observablehq.com/framework/lib/plot"><code>Plot</code></a> and <a href="https://observablehq.com/framework/javascript/files"><code>FileAttachment</code></a>. Make it responsive using <a href="https://observablehq.com/framework/javascript/display#responsive-display"><code>resize</code></a>.
  </div>
  <div class="card">
    Create a <a href="https://observablehq.com/framework/routing">new page</a> by adding a Markdown file (<code>whatever.md</code>) to the <code>docs</code> folder.
  </div>
  <div class="card">
    Add a drop-down menu using <a href="https://observablehq.com/framework/javascript/inputs"><code>Inputs.select</code></a> and use it to filter the data shown in a chart.
  </div>
  <div class="card">
    Write a <a href="https://observablehq.com/framework/loaders">data loader</a> that queries a local database or API, generating a data snapshot on build.
  </div>
  <div class="card">
    Import a <a href="https://observablehq.com/framework/javascript/imports">recommended library</a> from npm, such as <a href="https://observablehq.com/framework/lib/leaflet">Leaflet</a>, <a href="https://observablehq.com/framework/lib/dot">GraphViz</a>, <a href="https://observablehq.com/framework/lib/tex">TeX</a>, or <a href="https://observablehq.com/framework/lib/duckdb">DuckDB</a>.
  </div>
  <div class="card">
    Ask for help, or share your work or ideas, on the <a href="https://talk.observablehq.com/">Observable forum</a>.
  </div>
  <div class="card">
    Visit <a href="https://github.com/observablehq/framework">Framework on GitHub</a> and give us a star. Or file an issue if you’ve found a bug!
  </div>
</div>

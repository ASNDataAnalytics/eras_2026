---
theme: midnight
toc: false
title: Nephrology Candidates
---


<!-- 01 Styling -->

<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Roboto', sans-serif;
}

.observablehq {
  font-family: 'Roboto', sans-serif;
  font-size: 3em;
}

.observablehq-link-active > a:nth-child(1) {
  color: #0077c8;
}

#observablehq-header {
  /* --theme-background-b: #cccccc; */
  background-color: #00468b;
  border-radius: 4px;
 }

svg {
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
}

</style>

<!-- 02 Data -->

```js
const eras_2025_total = FileAttachment("./data/eras_2025_total.csv").csv({ typed: true });
const eras_2025_edu = FileAttachment("./data/eras_2025_edu.csv").csv({ typed: true});
const app_year_cur_month = FileAttachment("./data/app_year_cur_month.csv").csv({ typed: true});
const candidates_med_status_yoy = FileAttachment("./data/candidates_med_status_yoy.csv").csv({ typed: true });
const candidates_pct_change = FileAttachment("./data/candidates_pct_change.csv").csv({ typed: true });
const cum_candidates_year = FileAttachment("./data/cum_candidates_year.csv").csv({ typed: true });
const monthly_totals = FileAttachment("./data/monthly_totals.csv").csv({ typed: true });
```

<!-- 02.01 Current ERAS Year and Application Month -->

```js
const current_month = eras_2025_edu[eras_2025_edu.length -1].month_name
const eras_year = eras_2025_edu[eras_2025_edu.length -1].ERAS
```


###### ERAS 2025—Nephrology Candidates

<!-- 03 Cards Showing Top-Line Candidate Numbers -->

<div class="grid grid-cols-4">
  <div class="card">
    <h2>Data Through</h2>
    <span class="big">${current_month}, ${eras_year}</span>
  </div>
  <div class="card">
    <h2>IMG Candidates</h2>
    <span class="big">${monthly_totals
      .filter((d) => d.edu_status === "IMG")
      .map((d) => d.tots_candidate)
      }
    </span>
  </div>
  <div class="card">
    <h2>US MD Candidates</h2>
    <span class="big">${monthly_totals
      .filter((d) => d.edu_status === "US MD")
      .map((d) => d.tots_candidate)}</span>
  </div>
  <div class="card">
    <h2>Osteopathic Candidates</h2>
    <span class="big">${monthly_totals
      .filter((d) => d.edu_status === "US DO")
      .map((d) => d.tots_candidate)}</span>
  </div>
</div>

---

<!-- Visualizations Row 1 -->

<div class="grid grid-cols-2">
  <div class="card">
  <h2><b>Cumulative Candidates Through ${
      eras_2025_total[eras_2025_total.length - 1]["month_name"]
      }</b>
  </h2>
  ${
    resize((width) => Plot.plot({
      width,
      marginBottom: 50,
      marginLeft: 60,
      caption: "Source: ERAS",
       x: { tickFormat: "", label: "ERAS", labelOffset: 35 },
       y: {label: "Candidates"},
       marginTop: 30,
      marks: [
        Plot.ruleY([0]),
        Plot.barY(app_year_cur_month, {
          x: "ERAS", 
          y: "num_candidate",
          tip: true,
          fill: "fill", 
          insetLeft: 10, 
          insetRight: 10,
          title: (d) => `ERAS: ${d.ERAS}\nCandidates: ${d.num_candidate.toLocaleString("en-US")}`
          })
        ]
      })
    )
  }

</div>

  <div class="card">
  <h2>
    <b>Candidates By Medical School ERAS 2024–ERAS 2025 Through ${
      eras_2025_total[eras_2025_total.length - 1]["month_name"]
      }
    </b>  
  </h2>
  ${
    resize((width) => Plot.plot({
      width,
      x: {
        axis: "top", 
        type: "ordinal", 
        tickFormat: "", 
        inset: 90, 
        label: "ERAS"
        },
      y: {
        axis: null, 
        inset: 20, 
        label: "Candidates"
        },
      color: {legend: true},
      marginBottom: 50,
      marginLeft: 60,
      caption: "Source: ERAS",
      marks: [
        Plot.line(
          candidates_med_status_yoy, 
          {
            x: "ERAS", 
            y: "num_candidate", 
            z: "edu_status", 
            stroke: "color", 
            tip: true
          }),
        Plot.text(
          candidates_med_status_yoy, 
          {
            x: "ERAS", 
            y: "num_candidate", 
            margin: 30
          })
        ]
    })
  )
}

</div>
</div>

---

<!-- Visualizations Row 2 -->

<div class="grid grid-cols-2">
  <div class="card">
  <h2>
    <b>
    Percent Change YOY Through ${
      eras_2025_total[eras_2025_total.length - 1]["month_name"]
      }
    </b>
  </h2>
  ${
   resize((width) => Plot.plot({
      width,
      x: { tickFormat: "", label: "ERAS", labelOffset: 35 },
      y: { tickFormat: "", label: "%", labelOffset: 35 },
      caption: "Source: ERAS",
      marks: [
        Plot.ruleY([0]),
        Plot.barY(candidates_pct_change, {
          x: "ERAS", 
          y: "pct_c",
          tip: true,
          fill: "color", 
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
   <h2>
    <b>
    Cumulative Candidates by ERAS Year  
    </b>
  </h2>
  ${
    resize((width) => Plot.plot({
      width,
      x: { tickFormat: "", label: "Month", labelOffset: 35 },
      y: {label: "Candidates", domain: [150, 550]},
      caption: "Source: ERAS",
      marks: [
        Plot.ruleY([0]),
        Plot.lineY(cum_candidates_year, {
          x: "month", 
          y: "tots_candidates",
          tip: true,
          stroke: "color", 
          insetLeft: 10, 
          insetRight: 10
        })
      ]
    })
  )
}

</div>
</div>


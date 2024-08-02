---
theme: dashboard
title: Nephrology Candidates
---

```js
const eras_2025_total = FileAttachment("./data/eras_2025_total.csv").csv({ typed: true });
const eras_2025_edu = FileAttachment("./data/eras_2025_edu.csv").csv({ typed: true});
```

```js
Inputs.table(eras_2025_total)
```

```js
Inputs.table(eras_2025_edu)
```
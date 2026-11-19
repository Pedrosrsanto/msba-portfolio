# Faker: Generating Realistic Fake Data in Python

**Course:** OPAN 6607 Programming II: Data Infrastructure, Georgetown MSBA (Fall 2026)
**Team:** Ashbala Amin, Chris Kim, HeeJee Shin, Pedro Sanchez, Tariq Firozvi
**Tools:** Python, Faker, pandas
**Deliverable:** Live-coded package presentation (September 2026) and a runnable demo script

---

## Why a business needs fake data

Analysts often can't touch the data they most need to build with:

- **Privacy:** real customer data is regulated (HIPAA, for example), and access can take weeks or never come
- **Testing:** code, dashboards and pipelines need realistic input before production data exists or is approved
- **Demos and training:** you can show a client a working dashboard, or train new staff, without exposing a single real record

[Faker](https://faker.readthedocs.io) is an open-source Python package that solves this. It generates realistic placeholder names, emails, addresses, dates, companies, card numbers and text, with 300+ generator methods across 110 locales.

## What we showed

**Demo 1: Basic generation (my demo).** One line per field, and the method names read like English: `fake.name()`, `fake.email()`, `fake.address()`, `fake.company()`, `fake.date_between(start_date='-2y')`.

**Demo 2: Locales.** The same loop with a locale code produces data formatted for each country: a Spanish name with two surnames and an "S.L." company, a Japanese address with the prefecture first, a German "AG & Co. OHG". That's useful for testing a global checkout form without collecting any real international records.

**Demo 3: Building a dataset.** A 1,000-row customer table (ID, name, state, region, signup date, order total) generated in under a second, written to CSV and summarized in pandas.

**Demo 4: Seeding and custom providers.**
- `Faker.seed(42)` gives the same data every run, so if a test fails, it's the code that broke, not the data
- A custom `ProductProvider` teaches Faker your own catalog, so `fake.product_name()` works like any built-in method

## Run it yourself

```bash
pip install faker pandas
python code/faker_demo.py
```

The script runs all four demos and writes `fake_customers.csv`.

## The limits we flagged

Faker values are random, not statistically realistic. It won't reproduce the correlations or distributions in your real data. Ages won't line up with signup dates and order sizes won't follow your real customer mix unless you build that in yourself. It's ideal for testing structure and pipelines, not for training models or drawing conclusions.

## Files

| File | Contents |
|---|---|
| `code/faker_demo.py` | All four demos as one runnable script |
| `report/Faker_Presentation.pdf` | Presentation slides |

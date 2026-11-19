"""
Faker: generating realistic fake data in Python
OPAN 6607 Programming II: Data Infrastructure, Georgetown MSBA (Fall 2026)

Runs the four demos from our package presentation:
  1. Basic generation
  2. Locales
  3. Building a 1,000-row customer dataset
  4. Seeding and custom providers

Usage:
    pip install faker pandas
    python faker_demo.py
"""

import pandas as pd
from faker import Faker
from faker.providers import BaseProvider


def demo_basic(fake):
    """Demo 1: one call per field, readable method names."""
    print("\n=== Demo 1: Basic generation ===")
    print("Name:        ", fake.name())
    print("Email:       ", fake.email())
    print("Phone:       ", fake.phone_number())
    print("Address:     ", fake.address().replace("\n", ", "))
    print("Company:     ", fake.company())
    print("Job:         ", fake.job())
    print("Date:        ", fake.date_between(start_date="-2y", end_date="today"))
    print("Credit card: ", fake.credit_card_number())
    print("Sentence:    ", fake.sentence())


def demo_locales():
    """Demo 2: same method names, data formatted for each country."""
    print("\n=== Demo 2: Locales ===")
    for locale in ["en_US", "es_ES", "ja_JP", "de_DE"]:
        f = Faker(locale)
        address = f.address().replace("\n", ", ")
        print(f"{locale} | {f.name()} | {address} | {f.company()}")


def demo_dataset(fake, n_rows=1000, path="fake_customers.csv"):
    """Demo 3: build a customer table, save it to CSV and summarize it."""
    print("\n=== Demo 3: Building a dataset ===")
    regions = ["Northeast", "Southeast", "Midwest", "Southwest", "West"]
    rows = []
    for i in range(n_rows):
        rows.append({
            "customer_id": 1000 + i,
            "name": fake.name(),
            "state": fake.state_abbr(),
            "region": fake.random_element(regions),
            "signup": fake.date_between(start_date="-3y", end_date="today"),
            "order_total": round(fake.pyfloat(min_value=10, max_value=500), 2),
        })

    df = pd.DataFrame(rows)
    df.to_csv(path, index=False)

    print(f"Rows written:   {len(df):,} -> {path}")
    print(f"Total revenue:  ${df['order_total'].sum():,.2f}")
    print(f"Average order:  ${df['order_total'].mean():,.2f}")
    print("\nRevenue by region:")
    print(df.groupby("region")["order_total"].sum().round(2).sort_values(ascending=False))
    return df


class ProductProvider(BaseProvider):
    """Custom provider: teach Faker our own product catalog."""
    items = ["Speaker", "Blender", "Jacket", "Lamp"]

    def product_name(self):
        return self.random_element(self.items)


def demo_seed_and_provider():
    """Demo 4: same seed gives the same data; custom providers act like built-ins."""
    print("\n=== Demo 4: Seeding and custom providers ===")
    Faker.seed(42)
    first = Faker().name()
    Faker.seed(42)
    second = Faker().name()
    print(f"Seed 42, run 1: {first}")
    print(f"Seed 42, run 2: {second}  (same: {first == second})")

    fake = Faker()
    fake.add_provider(ProductProvider)
    print("Custom product:", fake.product_name())


if __name__ == "__main__":
    fake = Faker()
    demo_basic(fake)
    demo_locales()
    demo_dataset(fake)
    demo_seed_and_provider()

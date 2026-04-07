"""
load_data.py
Generates or loads the raw hospital operations dataset.
"""
import pandas as pd
import numpy as np
from pathlib import Path


def generate_synthetic_data(n_records: int = 1000, seed: int = 42) -> pd.DataFrame:
    rng = np.random.default_rng(seed)
    data = {
        "patient_id": [f"P{str(i).zfill(5)}" for i in range(n_records)],
        "admission_date": pd.date_range("2023-01-01", periods=n_records, freq="6H"),
        "ward": rng.choice(["Emergency", "ICU", "General", "Surgical", "Maternity"], n_records),
        "length_of_stay_days": rng.integers(1, 30, n_records),
        "readmitted_30d": rng.choice([0, 1], n_records, p=[0.85, 0.15]),
        "age": rng.integers(18, 95, n_records),
        "gender": rng.choice(["M", "F"], n_records),
        "discharge_status": rng.choice(["Home", "Transfer", "Deceased", "Self-discharge"], n_records, p=[0.75, 0.1, 0.05, 0.1]),
    }
    return pd.DataFrame(data)


if __name__ == "__main__":
    out_path = Path("data/raw/hospital_data.csv")
    out_path.parent.mkdir(parents=True, exist_ok=True)
    df = generate_synthetic_data()
    df.to_csv(out_path, index=False)
    print(f"Saved {len(df)} records to {out_path}")

"""
clean_data.py
Cleans the raw hospital dataset: handles nulls, types, and outliers.
"""
import pandas as pd
from pathlib import Path


def clean(df: pd.DataFrame) -> pd.DataFrame:
    df = df.copy()
    df["admission_date"] = pd.to_datetime(df["admission_date"])
    df["length_of_stay_days"] = df["length_of_stay_days"].clip(lower=0)
    df.dropna(subset=["patient_id", "admission_date"], inplace=True)
    return df


if __name__ == "__main__":
    raw = pd.read_csv("data/raw/hospital_data.csv")
    cleaned = clean(raw)
    out = Path("data/processed/hospital_data_cleaned.csv")
    out.parent.mkdir(parents=True, exist_ok=True)
    cleaned.to_csv(out, index=False)
    print(f"Cleaned data saved: {out} ({len(cleaned)} rows)")

# Customer-Churn-Analysis
# Data Cleaning With Python : Before vs After (Python - Pandas)

## Overview
Real-world subscription fitness app data. 30,685 monthly usage rows + 4,200 customers.

## Before vs After
| Issue | Before | After | Fix |
| Duplicates | 160 rows | 0 | drop_duplicates() |
| Missing minutes | 506 nulls | 0 + flag | groupby + median |
| Casing | 6 values | 3 values | str.lower() |
| Cancel Reason | 2814 blanks | 382 unknown, 2432 active | fillna('unknown') |

## Framework
Problem -> Detect -> Decision -> Fix -> Verify

## Numbers: 160, 503, 101, 382

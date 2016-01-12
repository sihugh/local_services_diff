# local_services_diff

Script to check for new URLs in local.direct.gov.uk services data that I might want to monitor

Clone the repo and run ./diff_local_service_csv.sh

This downloads the CSV file containing links to local services from
[local.direct.gov.uk](http://local.direct.gov.uk/Data/local_authority_service_details.csv)
and compares it with the previous one.

## Output

It generates a few simple files: 

diff_of_csvs_[date]
- Comparison of the downloaded CSV with the previously downloaded CSV

urls_from_diff_[date]
- Lines from the above file containing http

non_gov_urls_from_diff_[date]
- The above file but filtered for ".gov.uk" URLs only





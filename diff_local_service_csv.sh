#!/bin/bash
mkdir -p working history csvs

mv ./csvs/services.csv ./csvs/last-services.csv

curl -o ./csvs/services.csv http://local.direct.gov.uk/Data/local_authority_service_details.csv

cp ./csvs/services.csv ./csvs/$(date +%F)-services.csv 

diff ./csvs/last-services.csv  ./csvs/services.csv > ./working/diff_of_csvs

grep -i http ./working/diff_of_csvs | sort > ./working/urls_from_diff
echo Changed services count... 
wc -l ./working/urls_from_diff

grep -v ".gov.uk" ./working/urls_from_diff > ./working/non_gov_urls_from_diff
echo Non-gov urls affected...
wc -l ./working/non_gov_urls_from_diff

# It turns out that an 'X' does not represent a removed service
#grep -i ",x" ./working/diff_of_csvs | sort > ./working/removed_services_from_diff
#echo X rows affected...
#wc -l ./working/removed_services_from_diff

for existing in ./working/*; do
  cp $existing ./history/${existing##*/}_$(date +%F)
done


### script for conversion of json to csv file
import json
import csv

## header for csv file
schema = ['id','name','country_id']

with open('states_csvfile.csv', 'w') as csv_file:
	writer = csv.writer(csv_file, delimiter=',')
	writer.writerow([g for g in schema])

	with open('states.json') as f:
		data = json.loads(f.read())

	for state in data['states']:
	  line = state['id'],state['name'],state['country_id']
	  writer.writerow(line)

###Important links


"""understanding working of json

import json

people_string = '''
{
  "states": [
    {
      "name": "Alabama",
      "abbreviation": "AL"
    },
    {
      "name": "Alaska",
      "abbreviation": "AK"
    },
    {
      "name": "Wyoming",
      "abbreviation": "WY"
    }
  ]
}
'''

data = json.loads(people_string)
print(type(data['states'])) ## here you find states is acting as list

for state in data['states']:
  # print(state) ## to get printed data for each line
  print(state['name']) ## to print each column name
  del state['abbreviation'] ## to delete the key from from json

## now convert the data back into the original one
new_string = json.dumps(data, indent=2)
print(new_string)
"""

#################
import json

with open('states.json') as f:
  data = json.loads(f)

for state in data['states']:
  print(state['name'], state['abbreviation'])

with open('new_states_file.json', 'w') as f:
  json.dumps(data, f, indent=2)

































































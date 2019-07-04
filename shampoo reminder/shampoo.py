from datetime import date
import yaml

conf=yaml.safe_load(open('todate.yaml'))
todaydate=date.today()
shampoodate=conf['lastshampooed']

diff=date.today()-shampoodate

if diff.days == conf['threshold']:
	print("it's shampoo day motherfucker")
	updateconf=yaml.safe_load(open('todate.yaml'))
	updateconf['lastshampooed']=date.today()
	yaml.dump(updateconf, open('todate.yaml','w'))
else:
	pass
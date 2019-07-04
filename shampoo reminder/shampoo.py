from datetime import date
import yaml
from plyer import notification

conf=yaml.safe_load(open('todate.yaml'))
todaydate=date.today()
shampoodate=conf['lastshampooed']

diff=date.today()-shampoodate

if diff.days == conf['threshold']:
	notification.notify(
		title="Its shampoo day my dood",
		message="Yup you gotta shampoo today and take a break from fapping",
		app_icon=None,
		timeout=10
	)
	updateconf=yaml.safe_load(open('todate.yaml'))
	updateconf['lastshampooed']=date.today()
	yaml.dump(updateconf, open('todate.yaml','w'))
else:
	pass
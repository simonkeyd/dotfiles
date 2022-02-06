#!/usr/bin/python3
import openweathermap as owm

api_key = "d362e1f0789b5d15fa71f278486b20ba"
city_id = "3024635"
units = "metric"
temp_symbol = "\ue350"

api_get_res = owm.get_api(api_key, city_id, units)
#print(api_get_res)
#print(api_get_res.get('weather_icon'), api_get_res.get('desc'), temp_symbol, str(api_get_res.get('temp')) + "°C", api_get_res.get('wind_icon'), str(api_get_res.get('wind_speed')) + "km/h")
print(api_get_res.get('weather_icon'), str(api_get_res.get('temp')) + "°C", api_get_res.get('wind_icon'), str(api_get_res.get('wind_speed')) + "km/h")

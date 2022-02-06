#!/usr/bin/python3
import requests
import json
def get_weather_icon(icon_code):
    icon_dict = {
            "01d":"\ue30d",
            "01n":"\ue32b",
            "02d":"\ue30c",
            "02n":"\ue379",
            "03d":"\ue33d",
            "03n":"\ue33d",
            "04d":"\ue33d",
            "04n":"\ue33d",
            "09d":"\ue309",
            "09n":"\ue333",
            "10d":"\ue308",
            "10n":"\ue333",
            "11d":"\ue305",
            "11n":"\ue322",
            "13d":"\ue30a",
            "13n":"\ue304",
            "50d":"\ue304",
            "50n":"\ue304"
        }
    return icon_dict.get(icon_code, "Invalid icon code")

def get_wind_icon(wind_deg):
    wind_dict = {
            "": [15, 0],
            "": [1, 2],
            "": [3, 4],
            "": [5, 6],
            "": [7, 8],
            "": [9, 10],
            "": [11, 12],
            "": [13, 14],
            "": [16]
        }
    for wind_icon, wind_degrees in wind_dict.items():
        if wind_deg // 22.5 in wind_degrees:
            return wind_icon

def get_api(key, city_id, units):
    api_url = "https://api.openweathermap.org/data/2.5/weather"
    api_get_result = requests.get(api_url + "?appid=" + key + "&id=" + city_id + "&units=" + units)
    api_get_json = api_get_result.json()
    api_wind_deg = api_get_json.get('wind').get('deg', 360)
    api_dict_result = {
            "desc": api_get_json.get('weather')[0].get('description'),
            "weather_icon": get_weather_icon(api_get_json.get('weather')[0].get('icon')),
            "temp": round(api_get_json.get('main').get('temp')),
            "wind_speed": round(api_get_json.get('wind').get('speed')),
            "wind_deg": api_wind_deg,
            "wind_icon": get_wind_icon(api_wind_deg)
        }
    return(api_dict_result)

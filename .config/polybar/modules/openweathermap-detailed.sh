#!/bin/sh
get_icon() {
    case $1 in
        01d) icon="\ue30d";;
        01n) icon="\ue32b";;
        02d) icon="\ue30c";;
        02n) icon="\ue379";;
        03*) icon="\ue33d";;
        04*) icon="\ue33d";;
        09d) icon="\ue309";;
        09n) icon="\ue333";;
        10d) icon="\ue308";;
        10n) icon="\ue333";;
        11d) icon="\ue305";;
        11n) icon="\ue322";;
        13d) icon="\ue30a";;
        13n) icon="\ue304";;
        50d) icon="\ue304";;
        50n) icon="\ue304";;
        *) icon="\ue304";
    esac
    echo $icon
}

KEY="d362e1f0789b5d15fa71f278486b20ba"
CITY="3024635"
UNITS="metric"
SYMBOL="\ue350"

API="https://api.openweathermap.org/data/2.5"

weather=$(curl -sf "$API/weather?appid=$KEY&id=$CITY&units=$UNITS")

if [ -n "$weather" ]; then
    weather_desc=$(echo "$weather" | jq -r ".weather[0].description")
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

    echo -e "%{T6}$(get_icon $weather_icon)%{T1} $weather_desc, $weather_temp°C%{T}"
fi

let openweathermap = document.getElementById("OpenWeatherMap");
async function getData() {
    try {
        const response = await fetch(`https://api.igdb.com/v4/games`, {
            method: 'POST',
            mode: 'no-cors',
            headers: {
                "access_token": "access12345token",
                "expires_in": 5587808,
                "token_type": "bearer",
                'Accept': 'application/json',
                'Client-ID': 'Client ID',
                'Authorization': 'Bearer access_token',
            }
        })
        const data = await response.json();

        console.log(data)
        openweathermap.innerHTML += `
            <a href="#">${data.name}, ${data.sys.country}</a></br>
            <img src="https://openweathermap.org/img/w/${data.weather[0].icon}.png">
            <a href="#">${data.main.temp} &deg;C</a></br>
            <a href="#">feels like ${data.main.feels_like} &deg;C, ${data.weather[0].main}, ${data.weather[0].description}</a></br>
            <a href="#">Wind degree ${data.wind.deg}, Pressure ${data.main.pressure}</a></br>
            <a href="#">Wind speed ${data.wind.speed}, Humidity ${data.main.humidity}</a>
        `;
    } catch (err) {
        console.error(err);
    }
}
getData();
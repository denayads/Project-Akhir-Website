let jsoncpphero = document.getElementById("JsonCPHHero");
async function getGame() {
    try {
        const response = await fetch(
            "https://api.igdb.com/v4/game_videos",
            {
                method: 'POST',
                mode: "no-cors",
                headers: {
                    'Accept': 'application/json',
                    'Client-ID': 'll6d4123uogojg5jgxgv16awmer0m2',
                    'Authorization': 'Bearer lhm9j5ph1943raqsr219qv808106zi',
                },
                body: "fields checksum,game,name,video_id;"
            })
        const data = await response.json();
        console.log(data);
        //jsoncpphero.innerHTML += `
        //    <a href="#">${data.name}, ${data.sys.country}</a></br>
        //    <img src="https://openweathermap.org/img/w/${data.weather[0].icon}.png">
        //    <a href="#">${data.main.temp} &deg;C</a></br>
        //    <a href="#">feels like ${data.main.feels_like} &deg;C, ${data.weather[0].main}, ${data.weather[0].description}</a></br>
        //    <a href="#">Wind degree ${data.wind.deg}, Pressure ${data.main.pressure}</a></br>
        //    <a href="#">Wind speed ${data.wind.speed}, Humidity ${data.main.humidity}</a>
        //`;
    } catch (err) {
        console.error(err);
    }
}
getGame()
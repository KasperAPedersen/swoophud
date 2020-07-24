window.addEventListener('message', function(event){
    let data = event.data; // Save the event data to the data variable.
    if(data.status) { // If data.enabled is true.
        document.getElementById("swoop").style.display = "none"; // Set swoop display to block.
    } else {
        document.getElementById("swoop").style.display = "block"; // Set swoop display to block.
        document.getElementById('job').innerHTML = `${data.job}`;
        document.getElementById('money').innerHTML = `${data.money}`;
        document.getElementById('bankMoney').innerHTML = `${data.bankMoney}`;
        document.getElementById('health').innerHTML = `${Math.floor(data.health)}`;
        document.getElementById('armor').innerHTML = `${Math.floor(data.armor)}`;
        document.getElementById('hunger').innerHTML = `${Math.floor(data.hunger)}`;
        document.getElementById('thirst').innerHTML = `${Math.floor(data.thirst)}`;
    }
});
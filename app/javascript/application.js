// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener('turbo:load', () => {
    const alert = document.querySelector('.alert');
    const notice = document.querySelector('.notice');

    if (alert) {
        setTimeout(() => {
            alert.style.display = 'none';
        }, 3000);
    }
    else if (notice) {
        setTimeout(() => {
            notice.style.display = 'none';
        }, 3000);
    }
});

document.addEventListener('turbo:load', () => {
    const startingMinutes = 30;
    let time = startingMinutes * 60;

    const countdownEl = document.getElementById('timer');

    setInterval(updateCountdown, 1000);

    function updateCountdown() {
        const minutes = Math.floor(time / 60);
        let seconds = time % 60;

        seconds = seconds < 10 ? '0' + seconds : seconds;

        countdownEl.innerHTML = `${minutes}:${seconds}`;
        time--;

        const btn = document.getElementsByClassName('end-button');
        if (time < 0) {
            btn[0].click();
        }
    }
});

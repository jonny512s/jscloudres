    const counter = document.querySelector(".counter-number");
    counter.innerHTML = 'Loading views...'; // Initial loading message
    async function updateCounter() {
        let response = await fetch("https://dtsbjqsswgfgzl6uvilaaljt4a0kukyo.lambda-url.us-east-1.on.aws/");
        let data = await response.json();
        counter.innerHTML = `Site View Count: ${data.views}`;
    }
    updateCounter();

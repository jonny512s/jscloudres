    const counter = document.querySelector(".counter-number");
    counter.innerHTML = 'Loading views...'; // Initial loading message
    async function updateCounter() {
        let response = await fetch("https://vodcluk3rhvrk5xqsi5obehah40jrhlm.lambda-url.us-east-1.on.aws/");
        let data = await response.json();
        counter.innerHTML = `Site View Count: ${data.views}`;
    }
    updateCounter();

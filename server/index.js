document.addEventListener('DOMContentLoaded', (event) => {
    const counter = document.querySelector(".counter-number");
    counter.innerHTML = 'Loading views...'; // Initial loading message

    async function updateCounter(attempt = 1) {
        try {
            let response = await fetch("https://dtsbjqsswgfgzl6uvilaaljt4a0kukyo.lambda-url.us-east-1.on.aws/");
            if (!response.ok && attempt < 3) { // If response is not OK and less than 3 attempts
                setTimeout(() => updateCounter(attempt + 1), 2000); // Retry after 2 seconds
                return;
            }
            let data = await response.json();
            counter.innerHTML = `Site View Count: ${data}`;
        } catch (error) {
            counter.innerHTML = 'Could not load views'; // Error message if fetching fails
            console.error('Error fetching counter data:', error);
        }
    }

    updateCounter();
});

document.addEventListener('DOMContentLoaded', (event) => {
    const counter = document.querySelector(".counter-number");
    counter.innerHTML = 'Loading views...'; // Initial loading message
    async function updateCounter(attempt = 1) {
        try {
            const cacheBuster = new Date().getTime();
            let response = await fetch(`https://vodcluk3rhvrk5xqsi5obehah40jrhlm.lambda-url.us-east-1.on.aws/?${cacheBuster}`, {
                headers: {
                'cache-control': 'no-cache'
            }
        });
            if (!response.ok && attempt < 3) { // If response is not OK and less than 3 attempts
                setTimeout(() => updateCounter(attempt + 1), 2000); // Retry after 2 seconds
                return;
            }

            let data = await response.json();
            // Extracting the 'views' value from the response
            counter.innerHTML = `Site View Count: ${data}`;
        } catch (error) {
            counter.innerHTML = 'Could not load views'; // Error message if fetching fails
            console.error('Error fetching counter data:', error);
        }
    }
    updateCounter();
});
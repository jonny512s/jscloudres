    const counter = document.querySelector(".counter-number");
    counter.innerHTML = 'Loading views...'; // Initial loading message
    async function updateCounter() {
        try {
            const cacheBuster = new Date().getTime();
            let response = await fetch(`https://vodcluk3rhvrk5xqsi5obehah40jrhlm.lambda-url.us-east-1.on.aws/?cacheBust=${cacheBuster}`);
            let data = await response.json();
            counter.innerHTML = `Site View Count: ${data}`;
        } catch (error) {
            counter.innerHTML = 'Could not load views'; // Error message if fetching fails
            console.error('Error fetching counter data:', error);
        }
    }
    updateCounter();

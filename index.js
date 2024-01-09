const counter = document.querySelector(".counter-number");
//lambda function trigger
async function updateCounter(){
    //lambda function URL
    let response = await fetch("https://dtsbjqsswgfgzl6uvilaaljt4a0kukyo.lambda-url.us-east-1.on.aws/");
    let data = await response.json();
    counter.innerHTML = `Site View Count: ${data}`;
}
updateCounter();
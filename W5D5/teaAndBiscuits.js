const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


function teaAndBicsuits() {
    reader.question('Would you like some tea?', (res) => {
        console.log(`You replied ${res}.`);
    });
    
    reader.question('Would you like some biscuits?', (res) => {
        console.log(`You replied ${res}.`);
    });

    const first = (res === 'yes') ? 'do' : 'don\'t'; 
    const second = (res2 === 'yes') ? 'do' : 'don\'t'; 
    console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
    reader.close();
};

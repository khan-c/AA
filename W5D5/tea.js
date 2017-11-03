const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.question('Would you like some tea?', function (answer1) {
  console.log(`You replied ${answer1}.`);
  reader.question('Would you like some biscuits?', function (answer2) {
    console.log(`You replied ${answer2}.`);

    const first = (answer1 === 'yes') ? 'do' : 'don\'t';
    const second = (answer2 === 'yes') ? 'do' : 'don\'t';

    console.log(`So you ${first} want tea and you ${second} want biscuits.`);
    reader.close();
  });
});

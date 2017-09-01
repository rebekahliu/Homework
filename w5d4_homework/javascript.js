window.setTimeOut(function() {
  console.log("hi");},
  3000);

function hammertime(time) {
  return window.setTimeOut(
    alert(`${time} is hammertime!`),
    time
  )
}

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {
  let first, second;

  reader.question('Would you like some tea?', (res) => {
    first = res;
    console.log(`You replied ${res}.`);

    reader.question('Would you like some biscuits?', (res) => {
      second = res;
      console.log(`You replied ${res}.`);

      const firstRes = (first === 'yes') ? 'do' : "don't";
      const secondRes = (second === 'yes') ? 'do' : "don't";

      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();

    });
  });
}

function madLib(verb, adjective, noun) {
  console.log("We shall " + verb + " the " + adjective + " " + noun + ".")
};

function isSubstring(searchString, subString) {
  return searchString.indexOf(subString) !== -1;
}

function fizzbuzz(arr) {
  const fizzed = [];

  arr.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      fizzed.push(el);
    }
  });

  return fizzed;
};

function isPrime(num) {
  for(let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfPrimes(n) {
  let sum = 0;
  let primecount = 0;
  let i = 2;

  while (primecount < n) {
    if (isPrime(i)) {
      sum += i;
      primecount++;
    }
    i++;
  }
  return sum;
}
function toTitle(name) {
  "Mx. ${name} Jingleheimer Schmidt";
}

function titleize(names, toTitle) {
  names.map((name) => toTitle(name));
  return names;
}

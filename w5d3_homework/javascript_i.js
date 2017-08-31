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
  return `Mx. ${name} Jingleheimer Schmidt`;
}

function titleize(names, callback) {
  let originalNames = names
  let titles = originalNames.map((name) => callback(name));
  return titles;
}

var Elephant = function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log (`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!`);
};

Elephant.prototype.grow = function() {
  console.log (this.height += 12);
};

Elephant.prototype.addTrick(trick) = function() {
  this.trick.push(trick);
};

Elephant.prototype.play = function() {
  console.log (`$(this.name) is $()`)
}

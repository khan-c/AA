// Part One

function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}!`;
}

function isSubstring(searchString, subString) {
  for (let i = 0; i < (searchString.length - 1); i++) {
    for (let j = (i + 1); j < searchString.length; j++) {
      if (subString === searchString.substring(i, j)) {
        return true;
      }
    }
  }
  return false;
}

function fizzBuzz(array) {
  let fb_array = []
  for (let i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 && array[i] % 5 === 0) {
      continue;
    } else if (array[i] % 3 === 0 || array[i] % 5 === 0) {
      fb_array.push(array[i]);
    }
  }
  return fb_array;
}

function isPrime(number) {
  if (number < 2) {
    return false;
  } else {
    for (let i = 2; i < number; i++) {
      if (number % i === 0) { return false; }
    }
  }
  return true;
}

function firstNPrimes(n) {
  let primes = [];
  let i = 0;
  let x = 2;
  while (i < n) {
    if (isPrime(x)) {
      primes.push(x);
      i++;
      x++;
    } else {
      x++;
    }
  }
  return primes
}

function sumOfNPrimes(n) {
  let primes_arr = firstNPrimes(n);
  let sum = 0
  primes_arr.forEach( num => sum += num );
  return sum;
}

// Part Two

function titleize(array, callback) {
  let title_array = array.map(function(name) {
    return "Mx. " + name + " Jingleheimer Schmidt";
  });
  callback(title_array);
}

function printCallBack(array) {
  array.forEach(string => console.log(string) );
}

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRR!!!!!'`);
}

Elephant.prototype.grow = function () {
  this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function () {
  let r = Math.floor(Math.random() * this.tricks.length);
  let trick = this.tricks[r];
  console.log(`${this.name} is ${trick}!`);
}

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
}

// herd.forEach(elephant => paradeHelper(elephant))

// TODO WHYYYY???
function dinerBreakfast() {
  let order = ['cheesy scrambled eggs'];
  console.log(`I'd like ${order.toString()} please.`);

  return function (food) {
    order.push(food);
    let order_str = `I'd like ${order.join(' and ')} please.`;
    console.log(order_str);
  };
}

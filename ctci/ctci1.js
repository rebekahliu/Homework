//Cracking the Coding Interview Ch. 1 Arrays and Strings

// O(n)
// use array/hash to keep track of which letters have been picked
const isUnique = function(string) {
  let ch_hash = {};
  for (let i = 0; i < string.length; i++) {
    console.log(ch_hash);
    if (ch_hash[string[i]] === true) {
      return false;
    }
    ch_hash[string[i]] = true;
  }
  return true;
};

function quickSort(array) {
  if (array.length < 2) {
    return array;
  }

  var first = array[0];
  var left = [];
  var right = [];


  for (let i = 1; i < array.length; i++) {
    if (array[i] > first) {
      right.push(array[i]);
    } else {
      left.push(array[i]);
    }
  }

  return quickSort(left).concat(first, quickSort(right));
}

// O(nlogn)
// split into arrays sort and compare arrays
function isPermutation(string1, string2) {
  if (string1.length !== string2.length) {
    return false;
  }

  var array1 = quickSort(string1.split(""));
  var array2 = quickSort(string2.split(""));

  for (let i = 0; i < string1.length; i++) {
    if (array1[i] !== array2[i]) {
      return false;
    }
  }

  return true;
}

// O(n)
// /\s+/g g flag means all instances that match this regex expression are replaced
function URLify(string) {
  return string.trim().replace(/\s+/g, '20%');
}

//O(n)
// permutations can only have one letter an odd number of times
function palindromePermutation(string) {
  var letters = {};
  for (let i=0; i < string.length; i++) {
    var letter = string[i];
    if (string.charCodeAt(i) >= 97 && string.charCodeAt(i) <= 122) {
      if (letters[letter]) {
        letters[letter] += 1;
      } else {
        letters[letter] = 1;
      }
    }
  }

  var numOdd = 0;
  Object.keys(letters).map((n) => letters[n]).forEach((value) => {
    if (value % 2 === 1) {
      numOdd += 1;
    }
  });

  if (numOdd > 1) {
    return false;
  } else {
    return true;
  }
}

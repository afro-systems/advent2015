// Required Reading: fs(library), readFileSync(method), reduce(function), indexOf(array method)

//      fs: https://developer.mozilla.org/en-US/docs/Learn/Server-side/Node_server_without_framework
//  reduce: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce


// Built in libary to interact with the filesystem
var fs = require('fs');

// Load the file and split it into an array
var input = fs.readFileSync('C:\\Users\\alext\\Development\\advent2015\\level1\\advent01.txt', 'utf-8').split('');

// floor = 0; foreach (direction in input) { if direction is '(' add 1 to floor, else subtract 1 }
var result = input.reduce(
    (floor, direction) => direction === '(' ? ++floor : --floor, 0
);

// Write to console the result
var msg = "Santa is on floor " + result + '.'
console.log(msg);



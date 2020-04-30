// Required Reading: fs(library), readFileSync(method), map(function), indexOf(array method)

//      fs: https://developer.mozilla.org/en-US/docs/Learn/Server-side/Node_server_without_framework
//     map: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map
// indexOf: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf

// Built in libary to interact with the filesystem
var fs = require('fs');

// Load the file and split it into an array
var input = fs.readFileSync('C:\\Users\\alext\\Development\\advent2015\\level1\\advent01.txt', 'utf-8').split('');

// floor = 0; foreach (direction in input) { if direction is '(' add 1 to floor, else subtract 1 }
let floor = 0
var result = input.map(direction => direction === '(' ? ++floor : --floor).indexOf(-1) + 1;

// Write to console the result
var msg = "Santa moved " + result + ' times.'
console.log(msg);
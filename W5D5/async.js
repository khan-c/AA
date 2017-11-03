// Simple Timeout
window.setTimeout(function() {
  alert('Hammertime');
}, 5000);

// hammerTime
const hammerTime = function hammerTime(time) {
  window.setTimeout(function() {
    alert(`${time} is hammertime!`);
  }, 1000);
};

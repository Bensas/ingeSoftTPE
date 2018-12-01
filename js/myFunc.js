function getUrlParameter(name) {
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
  var results = regex.exec(location.search);
  return results === null
    ? ""
    : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function formatTwoDigits(int) {
  return ("0" + int).slice(-2);
}

function formatDate(date) {
  return (
    formatTwoDigits(date.getDate()) +
    "/" +
    formatTwoDigits(date.getMonth()) +
    "/" +
    date.getFullYear()
  );
}

function formatTime(date) {
  return (
    formatTwoDigits(date.getHours()) + ":" + formatTwoDigits(date.getMinutes())
  );
}

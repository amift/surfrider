function timeSince(seconds) {
  var timeStamp = new Date(1970, 0, 1); // Epoch
  timeStamp.setSeconds(seconds);

  var now = new Date(),
    secondsPast = (now.getTime() - timeStamp) / 1000;
  if (secondsPast < 60) {
    return parseInt(secondsPast) + 's';
  }
  if (secondsPast < 3600) {
    return parseInt(secondsPast / 60) + 'm';
  }
  if (secondsPast <= 86400) {
    return parseInt(secondsPast / 3600) + 'h';
  }
  if (secondsPast > 86400) {
    var day = timeStamp.getDate();
    var month = timeStamp.toDateString().match(/ [a-zA-Z]*/)[0].replace(" ", "");
    var year = timeStamp.getFullYear() == now.getFullYear() ? "" : " " + timeStamp.getFullYear();
    return day + " " + month + year;
  }
}

function trimText(text){
  var div = document.createElement("div");
  div.innerHTML = text;
  return div.textContent || div.innerText || "";
}

  

export { timeSince, trimText };
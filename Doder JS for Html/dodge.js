const gameContainer = document.getElementById("game-container");
const player = document.getElementById("player");

let playerX = 175;
let playerY = 450;

let leftPressed = false;
let rightPressed = false;

document.addEventListener("keydown", keyDownHandler, false);
document.addEventListener("keyup", keyUpHandler, false);

function keyDownHandler(e) {
  if (e.keyCode === 37) {
    leftPressed = true;
  } else if (e.keyCode === 39) {
    rightPressed = true;
  }
}

function keyUpHandler(e) {
  if (e.keyCode === 37) {
    leftPressed = false;
  } else if (e.keyCode === 39) {
    rightPressed = false;
  }
}

function movePlayer() {
  if (leftPressed && playerX > 0) {
    playerX -= 5;
  } else if (rightPressed && playerX < 350) {
    playerX += 5;
  }
  player.style.left = playerX + "px";
}

setInterval(movePlayer, 10);// add your own code after this or just copy some of mine on Dodger JavaScript

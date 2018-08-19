function start() {
  const all = document.querySelectorAll("td");
  all.forEach((element) => {
    element.classList.remove("active");
  });

  const player1 = document.querySelector("#player1_race td");
  const player2 = document.querySelector("#player2_race td");

  player1.classList.add("active");
  player2.classList.add("active");
}

function finish(winner) {
  setTimeout(() => {
    if (confirm(`${winner} wins, do you want to restart the game ?`)) {
      start();
    }
  }, 0);
}

document.addEventListener("keyup", (event) => {
  const playerOne = document.querySelector("#player1_race td.active");
  const playerTwo = document.querySelector("#player2_race td.active");
  if (event.key === "p") {
    playerOne.classList.remove("active");
    playerOne.nextElementSibling.classList.add("active");
  } else if (event.key === "q") {
    playerTwo.classList.remove("active");
    playerTwo.nextElementSibling.classList.add("active");
  }
  if (!document.querySelector("#player1_race td.active").nextElementSibling) {
    finish("player1");
  } else if (!document.querySelector("#player2_race td.active").nextElementSibling) {
    finish("player2");
  }
});

start();

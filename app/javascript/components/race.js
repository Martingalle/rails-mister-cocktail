function start() {
  const all = document.querySelectorAll("td");
  all.forEach((element) => {
    element.classList.remove("active");
  });

  const cocktail = document.querySelector("#cocktail_race td");
  const beer = document.querySelector("#beer_race td");

  if (cocktail)
    cocktail.classList.add("active");
  if (beer)
  beer.classList.add("active");

  document.addEventListener("keyup", (event) => {
    const playerOne = document.querySelector("#cocktail_race td.active");
    const playerTwo = document.querySelector("#beer_race td.active");
    if (playerOne && playerTwo ){
      if (event.key === "c") {
        playerOne.classList.remove("active");
        playerOne.nextElementSibling.classList.add("active");
      } else if (event.key === "b") {
        playerTwo.classList.remove("active");
        playerTwo.nextElementSibling.classList.add("active");
      }
      if (!document.querySelector("#cocktail_race td.active").nextElementSibling) {
        finish("Cocktail");
      } else if (!document.querySelector("#beer_race td.active").nextElementSibling) {
        finish("Beer");
      }
    }
  });
}

function finish(winner) {
  setTimeout(() => {
    if (confirm(`${winner} wins, do you want to restart the game ?`)) {
      start();
    }
  }, 0);
}


export { start };

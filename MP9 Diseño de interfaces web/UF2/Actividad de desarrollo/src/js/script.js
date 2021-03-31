'use strict';

const gameForm = document.getElementById('game-form');
const gameTable = document.getElementById('game-table');
const outputTable = document.getElementById('game-output');

let hasGameStarted = false;

function gameStartHandler(event) {
  event.preventDefault();

  if (hasGameStarted) {
    gameResetHandler();
  }

  hasGameStarted = true;

  const arrayOfPlayers = [];

  const numberOfPlayers = getNumberOfPlayers();

  for (let index = 1; index < numberOfPlayers + 1; index++) {
    const imagePath = `img/car${index}.png`;

    arrayOfPlayers.push({ playerNumber: index, score: 0, imagePath });
  }

  arrayOfPlayers.forEach((player) => {
    const carContainerElement = document.createElement('li');
    carContainerElement.classList.add('car-container');

    const labelElement = document.createElement('label');
    labelElement.textContent = `Player ${player.playerNumber}`;

    const carLaneElement = document.createElement('div');
    carLaneElement.id = `car-lane-${player.playerNumber}`;
    carLaneElement.classList.add('car-lane');

    const carImageElement = document.createElement('img');
    carImageElement.id = `player-${player.playerNumber}`;
    carImageElement.classList.add('car');
    carImageElement.src = player.imagePath;
    carImageElement.alt = `Car of player ${player.playerNumber}`;
    carImageElement.style.marginLeft = '0px';

    const finishLineElement = document.createElement('div');
    finishLineElement.classList.add('finish-line');

    carContainerElement.appendChild(labelElement);

    carContainerElement.appendChild(carLaneElement);
    carLaneElement.appendChild(carImageElement);

    carContainerElement.appendChild(finishLineElement);

    gameTable.appendChild(carContainerElement);
  });

  raceHandler(arrayOfPlayers);
}

function gameResetHandler() {
  hasGameStarted = false;

  gameTable.innerHTML = '';
}

async function raceHandler(players) {
  let winner = undefined;

  const carLaneWidth = document
    .getElementById(`car-lane-1`)
    .getBoundingClientRect().width;

  // debugger;

  winnerLoop: while (!winner) {
    for (const player of players) {
      await sleep(100);

      const playerElement = document.getElementById(
        `player-${player.playerNumber}`
      );

      const turnCarAdvantage = calculateCarAdvantage();

      player.score += turnCarAdvantage;

      if (player.score > 99) {
        player.score = 100;
      }

      // playerElement.animate([])
      playerElement.style.marginLeft = `${player.score}%`;

      console.log(player);

      if (player.score > 99) {
        winner = player;
        break winnerLoop;
      }
    }
  }

  createOutputTable(players);
}

function createOutputTable(players) {
  // Sort by score
  const playersSortedByScore = players.sort(function (a, b) {
    return a.score - b.score;
  });

  outputTable.hidden = false;

  const tableBody = outputTable.getElementsByTagName('tbody')[0];

  for (const player of playersSortedByScore) {
    const tableRow = tableBody.insertRow(0);

    const playerNumberTableData = tableRow.insertCell();
    playerNumberTableData.textContent = player.playerNumber;

    const playerScoreTableData = tableRow.insertCell();
    playerScoreTableData.textContent = player.score;
  }
}

function getNumberOfPlayers() {
  return Number(document.getElementById('number-of-players-select').value);
}

function calculateCarAdvantage() {
  const randomNumberBetween1And10 = Math.floor(Math.random() * 10) + 1;

  return randomNumberBetween1And10;
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

gameForm.addEventListener('submit', gameStartHandler);

gameForm.addEventListener('reset', gameResetHandler);

// TODO: remove
// gameForm.submit();

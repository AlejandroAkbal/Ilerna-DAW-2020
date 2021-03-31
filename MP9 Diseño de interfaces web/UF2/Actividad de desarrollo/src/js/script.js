'use strict';

//  4, 7, 11

const gameForm = document.getElementById('game-form');
const gameTable = document.getElementById('game-table');
const outputTable = document.getElementById('game-output');

let hasGameStarted = false;

function gameStartHandler(event) {
  event.preventDefault();

  gameResetHandler();

  hasGameStarted = true;
  formButtonHandler();

  const arrayOfPlayers = [];

  const numberOfPlayers = getNumberOfPlayers();

  // Populate array with objects
  for (let index = 1; index < numberOfPlayers + 1; index++) {
    const imagePath = `img/car${index}.png`;

    arrayOfPlayers.push({ playerNumber: index, score: 0, imagePath });
  }

  // Create DOM game table
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
  formButtonHandler();

  gameTable.innerHTML = '';

  outputTable.hidden = true;

  outputTable.getElementsByTagName('tbody')[0].innerHTML = '';
}

async function raceHandler(players) {
  let winner = undefined;

  const scoreToWin = getScoreToWin();

  const sleepMS = 100;

  winnerLoop: while (!winner) {
    for (const player of players) {
      await sleep(sleepMS);

      const playerElement = document.getElementById(
        `player-${player.playerNumber}`
      );

      const turnCarAdvantage = calculateCarAdvantage();

      player.score += turnCarAdvantage;

      if (player.score > scoreToWin) {
        player.score = scoreToWin;
      }

      playerElement.animate([{ marginLeft: `${player.score}%` }], {
        duration: sleepMS,
        easing: 'ease-in-out',
        fill: 'both',
      }).onfinish = () => {
        playerElement.style.marginLeft = `${player.score}%`;
      };

      console.log(player);

      if (player.score >= scoreToWin) {
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

function formButtonHandler() {
  const gameFormSubmitButton = document.getElementById('submit-btn');
  const gameFormResetButton = document.getElementById('reset-btn');

  if (hasGameStarted) {
    gameFormSubmitButton.hidden = true;
    gameFormResetButton.hidden = false;
    return;
  }

  gameFormSubmitButton.hidden = false;
  gameFormResetButton.hidden = true;
}

function getNumberOfPlayers() {
  return Number(document.getElementById('number-of-players-select').value);
}

function getScoreToWin() {
  return Number(document.getElementById('score-to-win-input').value);
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

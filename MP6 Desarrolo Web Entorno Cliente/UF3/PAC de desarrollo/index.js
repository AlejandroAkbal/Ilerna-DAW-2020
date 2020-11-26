'use strict';

function getRandomIntegerByMax(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

class SlotMachine {
  coins = undefined;

  playHistory = [];

  slotsElements = undefined;

  imageArray = [
    'aguacate.png',
    'ajo.png',
    'cebolla.png',
    'pepino.png',
    'puerro.png',
    'tomate.png',
    'zanahoria.png',
  ];

  listElement = undefined;

  constructor(playElement, stopElement, slotsElements, listElement) {
    this.initialize();

    this.slotsElements = slotsElements;
    this.listElement = listElement;

    playElement.addEventListener('click', this.play.bind(this));
    stopElement.addEventListener('click', this.stop.bind(this));
  }

  initialize() {
    do {
      this.coins = parseInt(prompt('Con cuantas monedas quieres jugar', 50));
    } while (isNaN(this.coins) || this.coins < 1);
  }

  getRandomImage() {
    const randomInteger = getRandomIntegerByMax(this.imageArray.length);

    return this.imageArray[randomInteger];
  }

  play() {
    if (this.coins < 1) {
      const message = 'No tienes suficientes monedas';

      alert(message);
      throw new Error(message);
    }

    let coinsToWin = 0;
    let coinsToLose = 0;

    // Remove one coin by playing
    coinsToLose++;

    const randomSelectedImages = [
      this.getRandomImage(),
      this.getRandomImage(),
      this.getRandomImage(),
    ];

    // Update IMG elements with the random images
    for (const [index, slotElement] of this.slotsElements.entries()) {
      slotElement.src = `./media/img/${randomSelectedImages[index]}`;
    }

    // Count duplicated images
    const itemsCountedFromArray = {};
    randomSelectedImages.forEach((x) => {
      itemsCountedFromArray[x] = (itemsCountedFromArray[x] || 0) + 1;
    });

    const zanahoriaCount = itemsCountedFromArray['zanahoria.png'] || 0;
    let hortalizasIgualesCount = 0;

    delete itemsCountedFromArray['zanahoria.png'];

    // Extract highest value from duplicated items
    for (const item in itemsCountedFromArray) {
      const itemValue = itemsCountedFromArray[item];

      if (itemValue > hortalizasIgualesCount) {
        hortalizasIgualesCount = itemValue;
      }
    }

    if (zanahoriaCount === 3) {
      coinsToWin += 10;
    } else if (hortalizasIgualesCount === 3) {
      coinsToWin += 5;
    } else if (zanahoriaCount === 2) {
      coinsToWin += 4;
    } else if (zanahoriaCount === 1 && hortalizasIgualesCount === 2) {
      coinsToWin += 3;
    } else if (hortalizasIgualesCount === 2) {
      coinsToWin += 2;
    } else if (zanahoriaCount === 1) {
      coinsToWin++;
    }

    console.log(coinsToWin);

    this.coins += coinsToWin - coinsToLose;

    this.playHistory.push({
      coinsToWin,
      coinsToLose,
      coinResult: coinsToWin - coinsToLose,
      coinsTotal: this.coins,
    });
  }

  stop() {
    alert(`Monedas: ${this.coins}`);

    for (historyObject of this.playHistory) {
      // TODO: create table dinamically
    }

    this.listElement.classList.toggle('hidden');

    // TODO: is this "Mostrar en formato lista el historial de monedas ganadas y perdidas en cada tirada." ?
    // console.log(this.playHistory);
  }
}

const playElement = document.getElementById('play');
const stopElement = document.getElementById('stop');

const slotsElements = [
  document.getElementById('slot-1'),
  document.getElementById('slot-2'),
  document.getElementById('slot-3'),
];

const listElement = document.getElementById('list');

new SlotMachine(playElement, stopElement, slotsElements, listElement);

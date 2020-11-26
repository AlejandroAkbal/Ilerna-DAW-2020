(() => {
  //#region Monedas
  let coins;

  do {
    coins = parseInt(prompt('Con cuantas monedas quieres jugar', 50));
  } while (isNaN(coins) || coins < 1);

  // coins = 50;

  //#endregion

  //#region Imagen aleatoria

  const imageArray = [
    'aguacate.png',
    'ajo.png',
    'cebolla.png',
    'pepino.png',
    'puerro.png',
    'tomate.png',
    'zanahoria.png',
  ];

  function getRandomIntegerByMax(max) {
    return Math.floor(Math.random() * Math.floor(max));
  }

  function getRandomImage() {
    const randomInteger = getRandomIntegerByMax(imageArray.length);

    return imageArray[randomInteger];
  }

  //#endregion

  const playHistory = [];

  const slotsElements = [
    document.getElementById('slot-1'),
    document.getElementById('slot-2'),
    document.getElementById('slot-3'),
  ];

  //#region Functions

  function playSlotMachine() {
    let coinsToWin = 0;
    let coinsToLose = 0;

    if (coins < 1) {
      const message = 'No tienes suficientes monedas';

      alert(message);
      throw new Error(message);
    }

    // Remove one coin by playing
    coinsToLose++;

    const randomSelectedImages = [
      getRandomImage(),
      getRandomImage(),
      getRandomImage(),
    ];

    // Update IMG elements with the random images
    for (const [index, slotElement] of slotsElements.entries()) {
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

    coins += coinsToWin - coinsToLose;

    playHistory.push({
      coinsToWin,
      coinsToLose,
      coinResult: coinsToWin - coinsToLose,
      coinsTotal: coins,
    });
  }

  function stopSlotMachine() {
    alert(`Monedas: ${coins}`);

    // TODO: is this "Mostrar en formato lista el historial de monedas ganadas y perdidas en cada tirada." ?
    console.log(playHistory);
  }

  //#endregion

  document.getElementById('play').addEventListener('click', playSlotMachine);
  document.getElementById('stop').addEventListener('click', stopSlotMachine);
})();

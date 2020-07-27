//
// This is only a SKELETON file for the 'React' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class InputCell {
  constructor(value) {
    this.value = value;
    this.listeners = [];
  }

  setValue(value) {
    this.value = value;

    this.listeners.forEach((listener) => listener());
  }

  addCallback(cb) {
    this.listeners.push(cb);
  }

  removeCallback(cb) {}
}

export class ComputeCell {
  constructor(inputCells, fn) {
    this.value = fn(inputCells);

    inputCells.forEach((cell) =>
      cell.addCallback(() => this.update(inputCells, fn))
    );
  }

  update(cells, fn) {
    this.value = fn(cells);
  }

  addCallback(cb) {}

  removeCallback(cb) {}
}

export class CallbackCell {
  constructor(fn) {}
}

const inputCell = new InputCell(1);
const timesTwo = new ComputeCell([inputCell], (inputs) => inputs[0].value * 2);

const timesThirty = new ComputeCell(
  [inputCell],
  (inputs) => inputs[0].value * 30
);

const sum = new ComputeCell(
  [timesTwo, timesThirty],
  (inputs) => inputs[0].value + inputs[1].value
);

inputCell.setValue(3);

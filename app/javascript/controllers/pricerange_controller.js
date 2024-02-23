import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["pricePointer","currentPrice"];

  connect() {
    console.log("connected");
  }

  updatePrice() {
    console.log("moving the range");
    const rangeInput = this.pricePointerTarget.value;
    console.log(rangeInput);
    this.currentPriceTarget.textContent = rangeInput;
  }
}

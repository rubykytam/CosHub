import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate", "daysDifference","unitPrice"];

  calculatePrice() {
    const startDate = new Date(this.startDateTarget.value);
    const endDate = new Date(this.endDateTarget.value);
    let daysDifference = (Math.ceil((endDate - startDate) / (1000 * 60 * 60 * 24)))+1;
    if (isNaN(daysDifference) || daysDifference < 0) {
      daysDifference = 0; // Set daysDifference to 0
    }
    const unitPrice = this.unitPriceTarget.dataset.totalpriceUnitprice;
    const totalPrice = unitPrice * daysDifference;

    this.daysDifferenceTarget.textContent = `Number of Days: ${daysDifference}; Total Price: ${totalPrice}`;
  }
}

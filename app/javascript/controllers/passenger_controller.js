import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static targets = [""]

  connect() {
    console.log("passenger controller connected")
    const numberOfPassenger = document.getElementById("number_passengers").value

    for (let index = 0; index < numberOfPassenger; index++) {  
      this.appendNewPassenger(index+1) // print index from 1
    }
  }

  add() {
    let numberOfPassenger = document.getElementById("number_passengers")
    numberOfPassenger.value++;

    this.appendNewPassenger(numberOfPassenger.value)
  }

  appendNewPassenger(index) {
    const template = document.querySelector('template')
    const section = document.getElementById("passenger_section")
    const passenger_node = document.importNode(template.content, true)

      const passenger_number = passenger_node.querySelector(".index")
      passenger_number.innerHTML = index

      const passenger_name_input = passenger_node.getElementById("passengers_new_name_")
      passenger_name_input.id = `passengers_new_name_${index}`
      passenger_name_input.name = `booking[passengers_attributes][${index}][name]`

      const passenger_email_input = passenger_node.getElementById("passengers_new_email_")
      passenger_email_input.id = `passengers_new_email_${index}`
      passenger_email_input.name = `booking[passengers_attributes][${index}][email]`

      
      section.appendChild(passenger_node)
  }
}

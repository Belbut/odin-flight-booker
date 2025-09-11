import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-passenger"
export default class extends Controller {
  static targets = ["btn"]

  connect() {
    console.log("passenger controller connected")
    const template = document.querySelector('template')
    const section = document.getElementById("passenger_section")

    let numberOfPassenger = document.getElementById("number_passengers").value

    for (let index = 0; index < numberOfPassenger; index++) {  
      const passenger_node = document.importNode(template.content, true)

      const passenger_number = passenger_node.querySelector(".index")
      passenger_number.innerHTML = index + 1

      const passenger_name_input = passenger_node.getElementById("passengers_new_name_")
      passenger_name_input.id = `passengers_new_name_${index}`

      const passenger_email_input = passenger_node.getElementById("passengers_new_email_")
      passenger_email_input.id = `passengers_new_email_${index}`
      
      section.appendChild(passenger_node)
    }
  }
}

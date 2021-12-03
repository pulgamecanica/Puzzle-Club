import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
document.addEventListener("DOMContentLoaded", function(event){
	let list = document.querySelector("#pagination").children;
	for (let item of list) {
		console.log(item.dataset.tournamentid);
		item.addEventListener("click", function(){pagination(item.dataset.tournamentid);}, false);
	}
	function pagination(id) {
		let current = document.querySelector(".active");
		current.className = current.className.replace("active", "");
		current.style.display = "none";
		document.querySelector("#slide-" + id).style.display = "block";
		document.querySelector("#slide-" + id).className += " active";
		console.log("Tournament id: " + id.toString());
	}
});
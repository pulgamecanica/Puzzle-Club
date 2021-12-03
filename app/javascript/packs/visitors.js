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
		let current_id = parseInt(current.dataset.id);
		let last_id;
		document.querySelectorAll(".slider-slide").forEach(element => last_id = parseInt(element.dataset.id));
		if (id === "before_button")	{
			if (current_id > 0)
				pagination((current_id - 1).toString());
		}
		else if (id === "after_button") {
			if (current_id < last_id)
				pagination((current_id + 1).toString());
		}
		else
		{
			current.className = current.className.replace("active", "");
			current.style.display = "none";
			let active = document.querySelector("#slide-" + id);
			active.style.display = "block";
			active.className += " active";
			console.log("Tournament id: " + id.toString());
		}
	}
});
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
Rails.start()
Turbolinks.start()
ActiveStorage.start()
document.addEventListener('turbolinks:load', function () {
	let list = document.querySelector("#pagination").children;
	for (let item of list) {
		console.log(item.dataset.tournamentid);
		item.addEventListener("click", function(){pagination(item.dataset.tournamentid);}, false);
	}
	let puzzles = document.querySelectorAll(".puzzle-contender-image");
	puzzles.forEach(
		element =>
			element.addEventListener("click", function(){
				open_vote(document.querySelector("#vote-" + element.dataset.contenderid));
			}, false)
	);
	let exit_list = document.querySelectorAll(".escape-puzzle");
	exit_list.forEach(element => element.addEventListener("click", close_vote, false));
	document.onkeydown = function(event) {
		if (event.keyCode == 27) {
			close_vote();
		}
	};
	function open_vote(vote_container) {
		vote_container.style.display = "block";
		vote_container.className += " vote-active";
	}
	function close_vote() {
		let element = document.querySelector(".vote-active");
		element.className = element.className.replace("vote-active", "");
		element.style.display = "none";
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
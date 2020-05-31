$(document).ready(function(){
	window.addEventListener('message', function(event){
		$(".swoop").css("display", event.data.status? "none":"block");
		$("#money").text(event.data.money);
		$("#bankMoney").text(event.data.bankMoney);
		$("#health").text(event.data.health + "%");
		$("#armor").text(event.data.armor + "%");
		$("#hunger").text(Math.floor((100 - event.data.hunger)) + "%");
		$("#thirst").text(Math.floor((100 - event.data.thirst)) + "%");
		$("#job").text(event.data.job);
	});
});
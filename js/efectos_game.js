$(document).on("ready", efectos);

function efectos(){
	
	$("#transicion").click(function(evento){
		evento.preventDefault();
		$("#canvas").load("html/game.html", function(){
			$(this).css("display","none");
			$(this).fadeIn(2000);
		});
	});
}
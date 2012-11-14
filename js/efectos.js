$(document).on("ready", efectos);

function efectos(){
	
	$("#uno").click(function(evento){
		evento.preventDefault();
		$("#contenido").load("html/seccion1.html", function(){
			$(this).css("display","none");
			$(this).fadeIn(1000);
		});
	});
		
	$("#dos").click(function(evento){
		evento.preventDefault();
		$("#contenido").load("html/seccion2.html", function(){
			$(this).css("display","none");
			$(this).fadeIn(1000);
		});
	});
}
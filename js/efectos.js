$(document).on("ready", efectos);

function efectos(){

	$(".botonX").click(function(){
		$(".ads").toggle("up");
	});
	
	$("#uno").click(function(evento){
		evento.preventDefault();
		$("#carga").load("html/seccion1.html", function(){
			$(this).css("display","none");
			$(this).fadeIn(1000);
		});
	});

	$("#dos").click(function(evento){
		evento.preventDefault();
		$("#carga").load("html/seccion2.html", function(){
			$(this).css("display","none");
			$(this).fadeIn(1000);
		});
	});
		
}
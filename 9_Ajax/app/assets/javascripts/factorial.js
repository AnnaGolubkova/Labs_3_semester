function show_result(data){
	var result = document.getElementById("result");
	result.innerHTML = "<div class='row'><div class='cell'></div><div class='cell'></div></div>"
	data.value.forEach(function(item, i, arr){
		result.innerHTML += "<div class='row'><div class='cell'>" + 
		item[0] + "</div>" + "<div class='cell'>" + item[1] + "</div></div>"
		})

}
$(document).ready(function(){
	$("#factorial_form").bind("ajax:success",
	function(xhr, data, status) {
	// data is already an object
	show_result(data)
	})
})
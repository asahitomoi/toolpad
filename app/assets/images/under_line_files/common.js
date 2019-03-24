$(function(){
/*
$('#top4 li').hide();
// リストをシャッフルする
var items = $('#top4 li').get().sort(function() {
    return Math.round(Math.random()) - 0.5;
}).slice(0, 3); // ランダムで3つだけ抽出して表示
$(items).show();​
*/
});


$.fn.extend({
	randomdisplay : function(num) {
		return this.each(function() {
			var chn = $(this).children().hide().length;
			for(var i = 0; i < num && i < chn; i++) {
				var r = parseInt(Math.random() * (chn - i)) + i;
				$(this).children().eq(r).show().prependTo($(this));
			}
		});
	}
});

$(function(){
	$("[randomdisplay]").each(function() {
		$(this).randomdisplay($(this).attr("randomdisplay"));
	});
});


$(function(){	
	setTimeout(function(){
    	$('#sns').load("/sns.txt");
  	}, 3000);


});



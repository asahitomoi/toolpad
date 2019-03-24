//■■ギャラリーの実装

var imgCatTxt=0;
var indexLMSnum=0;
var arrayLMS=["L","M","S"];
var arrayimgCatNameS=["png","jpg"];
var indexNum=1;
var scrollTop=0;
//var flag=""; //バナーなのかパーセントなのかバナーかつパーセントなのかのフラグ。
var pNum=10;　//割引パーセント
var bNum=1; //バナーサイズの種類
//var itemNum=8;　//素材の数デバッグよう
//var imgID="e_new_1";　//素材のIDデバッグ用

//alert(itemN);

$(function(){
	

	
		//LMS 画像のサイズを変更すんよ。
	$("ul#LMS li").click(function(){
		//何番目のliをクリックしたかを取得。
		indexLMSnum=$("ul#LMS li").index(this);
		$("#LMS li").removeClass();
		var listNumLMS=indexLMSnum+1;
		$("ul#LMS li:nth-child("+listNumLMS+")").addClass("on");
		changeIMG();
		selectCheck();
	});


	//画像の差し替え関数
	function changeIMG(){	
		 $('#changMainList li p img').each(function(){			
			$(this).attr('src',$(this).attr('src').replace(/[A-Z]/,arrayLMS[indexLMSnum])); 			 
			 });
		$('#mainpList li p img').each(function(){			
			$(this).attr('src',$(this).attr('src').replace(/[A-Z]/,arrayLMS[indexLMSnum])); 			 
			 });
	}
	
	
	
	
	//ポップアップ表示
	$("#mainList p,ul#fileDownload li:nth-child(4)").click(function(){
		imgCatTxt=0;
		indexNum=1;
		$("#glayLayer").fadeIn('fast');
		scrollTop=$(window).scrollTop();//スクロールの高さ取得
		$("#overLayer").fadeIn('fast').css("top",scrollTop+"px");
		changeIMG();
		selectCheck();
		nextBackShowHide();
	});



	//JPG Download ボタンを押したとき　ポップアップ表示
	$("ul#fileDownload li:nth-child(3)").click(function(){
		imgCatTxt=1;
		$("#glayLayer").fadeIn('fast');
		scrollTop=$(window).scrollTop();//スクロールの高さ取得
		$("#overLayer").fadeIn('fast').css("top",scrollTop+"px");
		
		changeCatTxt();	
		changeIMG();
		nextBackShowHide();

	});
	

	//POPバリエーションボタンを押したとき
	$("#overLayer ul.variation li").click(function(){
		//何番目のliをクリックしたかを取得。
		indexNum=$("#overLayer ul.variation li").index(this);
		changeIMG();
		selectCheck();
		nextBackShowHide();
		
	});

	//popup を閉じる
	$("#glayLayer,#btnClose").click(function(){
		$("#glayLayer,#overLayer").fadeOut('fast');
		//初期化
		imgCatTxt=0;
		indexNum=1;
		indexLMSnum=0;
		pNum=10;　//割引パーセント
		bNum=1;
		$("#LMS li").removeClass();
		$("#bannerSize li").removeClass();
		$("#changeDiscount li").removeClass();
		$("ul#LMS li:nth-child(1)").addClass("on");
		$("#bannerSize li:nth-child(1)").addClass("on");
		$("#changeDiscount li:nth-child(1)").addClass("on");
		changeCatTxt();

	});	


     //背景色の変更
	 
	 /*
	 $("#changBg ul#bg li").click(function(){	 
		 $("#changBg ul#bg li").removeClass("on");
		 $(this).addClass("on");
		 var colorbg = $(this).css("background");
		 $("#overLayer").css("background","none");
		$("#overLayer").css("background",colorbg);
	 });
*/

 $("#changBg ul#bg li").click(function(){	 
		 $("#changBg ul#bg li").removeClass("on");
		 $(this).addClass("on");
 });
 
$("#changBg ul#bg li:nth-child(1)").click(function(){	
$("#overLayer").css("background","#fff");
});
$("#changBg ul#bg li:nth-child(2)").click(function(){	
$("#overLayer").css("background","url(../img/bg_01.jpg)");
});
$("#changBg ul#bg li:nth-child(3)").click(function(){	
$("#overLayer").css("background","url(../img/bg_02.jpg)");
});
$("#changBg ul#bg li:nth-child(4)").click(function(){	
$("#overLayer").css("background","#42d2d4");
});
$("#changBg ul#bg li:nth-child(5)").click(function(){	
$("#overLayer").css("background","#e78f89");
});
 $("#changBg ul#bg li:nth-child(6)").click(function(){	
$("#overLayer").css("background","#363636");
});

 

	//jpg png ボタンを押したら切り替え
	$("#changeImg").click(function(){
		replaceJPGPNG();	
	
		return false;
	});
	
		//JPG,PNG切り替え関数。
	function replaceJPGPNG(){
		if(imgCatTxt==0){
			imgCatTxt=1;
			
		 $('#changMainList li p img').each(function(){		
			$(this).attr('src',$(this).attr('src').replace(/\png/g,"jpg")); 			 
			 });			 
		 $('#mainpList li p img').each(function(){		
			$(this).attr('src',$(this).attr('src').replace(/\png/g,"jpg")); 			 
			 });	 	
		}else{
			imgCatTxt=0;
		 $('#changMainList li p img').each(function(){	
			$(this).attr('src',$(this).attr('src').replace(/\jpg/g,"png")); 			 
			 });
		 $('#mainpList li p img').each(function(){	
			$(this).attr('src',$(this).attr('src').replace(/\jpg/g,"png"));			 
			 });			
		}
		changeCatTxt();
	}

	//テキスト差し替え関数
	function changeCatTxt(){
		if(imgCatTxt==1){
			$("#imgCat").removeClass("jpgVar").html("PNG");		
			$("#changeImg").html('<img src="img/btn_jpg01.gif" alt="jpg"><img src="img/btn_png02.gif" alt="png画像">');
			var txtNow = $(".info").html();
        	$(".info").html(txtNow.replace("透過PNG",'JPG'));
		}else{
			$("#imgCat").addClass("jpgVar").html("JPG");
			$("#changeImg").html('<img src="img/btn_jpg02.gif" alt="jpg"><img src="img/btn_png01.gif" alt="png画像">');
			var txtNow = $(".info").html();
        	$(".info").html(txtNow.replace("JPG",'透過PNG'));
		}
	}

	
	
	//ダウンロードボタンのURL生成
	$("ul#download li:nth-child(1) a").attr("href",'b/'+imgID+'/'+imgID+'jpgset.zip');
	$("ul#download li:nth-child(2) a").attr("href",'b/'+imgID+'/'+imgID+'pngset.zip');
	$("ul#download02 li a").attr("href",'b/'+imgID+'/'+imgID+'pat.zip');

	
});




// ■■Download　ポップアップ
var sec=5; //初期値を5秒にする。
var fileType="";
var newscroll=0;
$(function(){
	
	
	
		//illustrator Ai ボタンをクリック
	$("ul#fileDownload li:nth-child(1)").click(function(){
		var randnum = Math.floor( Math.random() * 3+1 ); 
		$("#waitIMG").attr('src','img/wait2.jpg');
		$("p.pr").hide();
		$("#fileDown").append("<p class='pr'>ECサイト・ネットショップ素材を無料でダウンロードできるサイト<br><a href='http://design-ec.com/'>「EC design（デザイン）」</a>はこちら</p>");
		fileType="ai";
		newscroll=$(window).scrollTop();//スクロールの高さ取得
		$("#fileDown").css("top",newscroll+"px");
		$("#fileDownCover,#fileDown").show();
		
		$("#dlBtnboxBtn a").text("illustrator Ai");
		cdTimer();
	});
	


	//EPS ボタンをクリック
	$("#fileDownload li:nth-child(2)").click(function(){
		var randnum = Math.floor( Math.random() * 3+1 ); 
		$("#waitIMG").attr('src','img/wait1.jpg');
		$("p.pr").hide();
		$("#fileDown").append("<p class='pr'>飾り枠、飾り罫などのフレーム素材をアーカイブするサイト<br><a href='http://frames-design.com/'>「フレームデザイン」</a>はこちら</p>");
		fileType="eps";
		newscroll=$(window).scrollTop();//スクロールの高さ取得
		$("#fileDown").css("top",newscroll+"px");
		$("#fileDownCover,#fileDown").show();
		$("#dlBtnboxBtn a").text("EPS");
		cdTimer();
	});
	

	/*illustrator Ai ボタンをクリック
	$("ul#fileDownload li:nth-child(1)").click(function(){
		var randnum = Math.floor( Math.random() * 3+1 ); 
		$("#waitIMG").attr('src','img/wait'+randnum+'.gif');
		fileType="ai";
		newscroll=$(window).scrollTop();//スクロールの高さ取得
		$("#fileDown").css("top",newscroll+"px");
		$("#fileDownCover,#fileDown").show();
		
		$("#dlBtnboxBtn a").text("illustrator Ai");
		cdTimer();
	});
	
	*/

	/*EPS ボタンをクリック
	$("#fileDownload li:nth-child(2)").click(function(){
		var randnum = Math.floor( Math.random() * 3+1 ); 
		$("#waitIMG").attr('src','img/wait'+randnum+'.gif');
		fileType="eps";
		newscroll=$(window).scrollTop();//スクロールの高さ取得
		$("#fileDown").css("top",newscroll+"px");
		$("#fileDownCover,#fileDown").show();
		$("#dlBtnboxBtn a").text("EPS");
		cdTimer();
	});
	
	*/
	
	//閉じる
	$("#fileDownCover,#fileDownClose").click(function(){
		$("#dlBtnbox p").show();
		$("#dlBtnbox p span").html("5");
		sec=5;
		$("#dlBtnboxBtn").hide();
		$("#fileDownCover").hide();
		$("#fileDown").hide();
	});
	
	function cdTimer(){
		dltimer = setInterval(function(){
	     // 実行される処理
		 	if(sec>0){
				sec=sec-1;
				$("div#dlBtnbox p span").html(sec);
			}else{
				clearInterval(dltimer);
				$("#dlBtnbox p").hide();
				$("#dlBtnboxBtn").show();
				$("#dlBtnboxBtn a").attr('href','b/'+imgID+'/'+imgID+'_'+fileType+'.zip')
			}
		}, 1000);
	}
});
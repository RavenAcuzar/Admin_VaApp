 $(document).ready(function () {

    

 	$(".ts-sidebar-menu li a").each(function () {
 		if ($(this).next().length > 0) {
 			$(this).addClass("parent");
 		};
 	})
 	var menux = $('.ts-sidebar-menu li a.parent');
 	$('<div class="more"><i class="fa fa-angle-down"></i></div>').insertBefore(menux);
 	$('.more').click(function () {
 		$(this).parent('li').toggleClass('open');
 	});

	$('.parent').click(function (e) {
		e.preventDefault();
 		$(this).parent('li').toggleClass('open');
 	});
 	$('.menu-btn').click(function () {
 		$('nav.ts-sidebar').toggleClass('menu-open');
 	});
	 
	 //$("#input-43").fileinput({
	 //   showPreview: false,
	 //   allowedFileExtensions: ["zip", "rar", "gz", "tgz"],
	 //   elErrorContainer: "#errorBlock43"
	 //   	// you can configure `msgErrorClass` and `msgInvalidFileExtension` as well
     //});
 	var currentYear = new Date().getFullYear();
 	var previousYear = new Date().getFullYear() - 1;


 	$("#pYear").text(previousYear);
 	$("#cYear").text(currentYear);
 	$("#pYear1").text(previousYear);
 	$("#cYear1").text(currentYear);
 	$("#pYear2").text(previousYear);
 	$("#cYear2").text(currentYear);

 	$(function () {
 	    $("#ContentPlaceHolder1_txtStartDate").datepicker();
 	});
 	$(function () {
 	    $("#ContentPlaceHolder1_txtEndDate").datepicker();
 	});

	 $("#chkCompanyTitle").click(function () {
	     if (this.checked) {
	         $(".colCompanyTitle").hide();
	     }
	     else {
	         $(".colCompanyTitle").show();
	     }
	 });
	 $("#chkName").click(function () {
	     if (this.checked) {
	         $(".colName").hide();
	     }
	     else {
	         $(".colName").show();
	     }
	 });
	 $("#chkIRID").click(function () {
	     if (this.checked) {
	         $(".colIRID").hide();
	     }
	     else {
	         $(".colIRID").show();
	     }
	 });
	 $("#chkPassword").click(function () {
	     if (this.checked) {
	         $(".colPassword").hide();
	     }
	     else {
	         $(".colPassword").show();
	     }
	 });
	 $("#chkEmail").click(function () {
	     if (this.checked) {
	         $(".colEmail").hide();
	     }
	     else {
	         $(".colEmail").show();
	     }
	 });
	 $("#chkImage").click(function () {
	     if (this.checked) {
	         $(".colImage").hide();
	     }
	     else {
	         $(".colImage").show();
	     }
	 });
	 $("#chkContactNumber").click(function () {
	     if (this.checked) {
	         $(".colContactNumber").hide();
	     }
	     else {
	         $(".colContactNumber").show();
	     }
	 });
	 $("#chkDescription").click(function () {
	     if (this.checked) {
	         $(".colDescription").hide();
	     }
	     else {
	         $(".colDescription").show();
	     }
	 });
	 $("#chkCorporateStaff").click(function () {
	     if (this.checked) {
	         $(".colCorporateStaff").hide();
	     }
	     else {
	         $(".colCorporateStaff").show();
	     }
	 });
	 $("#chkCreatedOn").click(function () {
	     if (this.checked) {
	         $(".colCreatedOn").hide();
	     }
	     else {
	         $(".colCreatedOn").show();
	     }
	 });
	 $("#chkCreatedBy").click(function () {
	     if (this.checked) {
	         $(".colCreatedBy").hide();
	     }
	     else {
	         $(".colCreatedBy").show();
	     }
	 });
	 $("#chkUpdatedOn").click(function () {
	     if (this.checked) {
	         $(".colUpdatedOn").hide();
	     }
	     else {
	         $(".colUpdatedOn").show();
	     }
	 });
	 $("#chkUpdatedBy").click(function () {
	     if (this.checked) {
	         $(".colUpdatedBy").hide();
	     }
	     else {
	         $(".colUpdatedBy").show();
	     }
	 });
	 $("#chkStatus").click(function () {
	     if (this.checked) {
	         $(".colStatus").hide();
	     }
	     else {
	         $(".colStatus").show();
	     }
	 });
	 $("#chkAction").click(function () {
	     if (this.checked) {
	         $(".colAction").hide();
	     }
	     else {
	         $(".colAction").show();
	     }
	 });
	 $("#chkTitle").click(function () {
	     if (this.checked) {
	         $(".colTitle").hide();
	     }
	     else {
	         $(".colTitle").show();
	     }
	 });
	 $("#chkID").click(function () {
	     if (this.checked) {
	         $(".colID").hide();
	     }
	     else {
	         $(".colID").show();
	     }
	 });
	 $("#chkType").click(function () {
	     if (this.checked) {
	         $(".colType").hide();
	     }
	     else {
	         $(".colType").show();
	     }
	 });
	 $("#chkRegion").click(function () {
	     if (this.checked) {
	         $(".colRegion").hide();
	     }
	     else {
	         $(".colRegion").show();
	     }
	 });
	 $("#chkDepartment").click(function () {
	     if (this.checked) {
	         $(".colDepartment").hide();
	     }
	     else {
	         $(".colDepartment").show();
	     }
	 });


	 var imageLoader = document.getElementById('ContentPlaceHolder1_imageLoader');
	 if (imageLoader != null)
	 {
	     imageLoader.addEventListener('change', handleImage, false);
	 }

	 function handleImage(e) {
	     e.preventDefault();
	     var myimg = new Image();
	     var reader = new FileReader();
	     reader.onload = function (event) {
	         myimg.onload = function () {
	             document.getElementById('ContentPlaceHolder1_imgDisplay').src = event.target.result
	             getImgData(event.target.result);
	         }
	         myimg.src = event.target.result;
	     }
	     reader.readAsDataURL(e.target.files[0]);
	 }

	 function getImgData(myImg)
	 {
	     document.getElementById("ContentPlaceHolder1_hiddenImgVal").value = myImg;
	 }

	 $(function () {
	     $('#ContentPlaceHolder1_txtDateJoined').datepicker();
	 })
 });

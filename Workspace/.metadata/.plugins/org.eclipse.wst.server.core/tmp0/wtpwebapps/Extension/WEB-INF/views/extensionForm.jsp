<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� Ȯ���� ����</title>
<style>
hr {
	height: 2px;
	background-color: black;
}

h2 {
	margin-left: 5px;
}

#extensionList {
	border: 1px solid black;
	border-radius: 0.5em;
	height: auto;
	margin-left: 140px;
	margin-top: 10px;
	min-height: 300px;
	width: 500px;
}

#customExtension {
	border-radius: 0.5em;
}

.addDiv {
	border: 1px solid black;
	border-radius: 0.5em;
	margin-left: 5px;
	padding-left: 10px;
	padding-right: 10px;
	display: inline-block;
}

.btn {
	margin-left: 10px
}
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
	$(function() {
		load();
		$(".check").click(function() { //���� Ȯ���� üũ �� üũ���� �̺�Ʈ
			var name = $(this).val();
			var type = "F";
			//var params = "name=" + name + "&type=" + type;
			if ($(this).prop("checked") == true) {
				url = "extensionAdd/" + name + "/" + type;
			} else {
				url = "extensionDelete/" + name;
			}
			checkAjax(url);
		});

		$("#customAdd").click(function() {
			var name = $("#customExtension").val();
			var type = "C"
			var url = "extensionAdd/" + name + "/" + type;
			if ($("#inputCount").val() > 200) {
				alert("�� �̻� �߰� �� �� �����ϴ�.");
				return;
			}
			if (name == "") {
				alert("Ȯ���ڸ� �Է����ּ���.");
				return;
			}
			checkAjax(url);
			var name = $("#customExtension").val("");
		});

		$(document).on("click", ".btn", function() {
			var name = $(this).prop("id");
			var url = "extensionDelete/" + name;
			$("#" + name + "Div").remove();
			checkAjax(url);
		});
	});

	function addExtension(name) {
		$("#extensionList")
				.append(
						"<div class='addDiv' id='" + name + "Div'>"
								+ name
								+ "<input type='button' class='btn' id='" + name + "' value='X'></div>");
	}

	function checkAjax(url) {
		var name = $("#customExtension").val();

		$.ajax({
			type : "post",
			url : url
		}).done(function(args) {
			if (args == "err") {
				alert("�ߺ� �� Ȯ���ڰ� �����մϴ�.");
				return;
			} else if (args == "fixingErr") {
				alert("���� Ȯ���ڴ� Ŀ���� Ȯ���ڷ� �߰� �� �� �����ϴ�.");
				return;
			} else if (args == "addSuccess") {
				addExtension(name);
			}
			count();
		});
	}

	function load() {
		count();
		$.ajax({
			type : "post",
			url : "extensionSelect",
		}).done(function(args) {
			if (args !== null) {
				for (var i = 0; i < args.length; i++) {
					if (args[i].type == "F") {
						$("#" + args[i].name).prop("checked", true);
					} else {
						addExtension(args[i].name);
					}
				}
			}
		});
	}

	function count() {
		$.ajax({
			type : "post",
			url : "count",
		}).done(function(args) {
			$("#count").html("&nbsp;" + args + "/200");
			$("#inputCount").val(args);
		});
	}
</script>
</head>
<body>
	<input type="hidden" id="inputCount">
	<form method="post" enctype="multipart/form-data" action="fileUpload">
		<input type="file" name="file">
		<input type="submit" value="���� ���">
	</form>
	<h2>�� ���� Ȯ���� ����</h2>
	<hr>
	����Ȯ���ڿ� ���� Ư�� ������ ������ ÷���ϰų� �������� ���ϵ��� ����
	<br> ���� Ȯ���� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="checkbox" class="check" id="bat" value="bat" /> bat
	&nbsp;
	<input type="checkbox" class="check" id="cmd" value="cmd" /> cmd
	&nbsp;
	<input type="checkbox" class="check" id="com" value="com" /> com
	&nbsp;
	<input type="checkbox" class="check" id="cpl" value="cpl" /> cpl
	&nbsp;
	<input type="checkbox" class="check" id="exe" value="exe" /> exe
	&nbsp;
	<input type="checkbox" class="check" id="scr" value="scr" /> scr
	&nbsp;
	<input type="checkbox" class="check" id="js" value="js" /> js &nbsp;
	<br>
	<br> Ŀ���� Ȯ���� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" id="customExtension" name="customExtension"
		maxlength="20" />
	<input type="button" id="customAdd" value="+�߰�" />
	<div id="extensionList">
		<div id="count">&nbsp;0/200</div>
	</div>
</body>
</html>
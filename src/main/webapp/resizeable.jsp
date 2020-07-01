<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="ZEUS">
<meta name="author"
	content="zihoony.kim, S, J, and Bootstrap contributors">
<!-- <meta name="generator" content="Jekyll v4.0.1"> -->
<link rel="shortcut icon" href="/img/zeus_logo_transparent.png">
<title>Zeus</title>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">


<style>
body {
	padding-top: 7rem;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

* {
	box-sizing: border-box;
}

table {
	border-collapse: collapse;
}

td, th {
	padding: 5px 15px;
	text-align: left;
}

table, th, td {
	border: 1px solid #000;
}
</style>


<!-- 상단 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<a class="navbar-brand" href="/index.jsp"> <img
		src="/img/zeus_logo_transparent.png" alt="logo" style="width: 1.5rem;">
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#">Home<span
					class="sr-only">(current)</span></a></li>

			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Dropdown </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>

			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a></li>
		</ul>


		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2 p-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>


		<div class="">
			<ul class="navbar-nav">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
					onclick="window.location.href='/cart/cart.jsp'">Basket</button>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
					onclick="window.location.href='/dashboard/mypage.jsp'">My
					Page</button>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
					onclick="window.location.href='/signin/signout.jsp'">Sign
					Out</button>

				<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
					onclick="window.location.href='/signup/signup.jsp'">Sign
					Up</button>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
					onclick="window.location.href='/signin/signin.jsp'">Sign
					In</button>
			</ul>
		</div>
	</div>
</nav>


</head>


<body>

	<table id="tableId">
		<thead>
			<tr>
				<th><input type="checkbox" /></th>
				<th>Size</th>
				<th>File</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" /></td>
				<td>10Mb</td>
				<td>C:\Users\BrainBell\Desktop\Empty\abc.txt</td>
			</tr>
		</tbody>
	</table>
</body>








<div class="fixed-bottom">CopyRight @ Zeus GP. All rights reserved.</div>
</body>

<script>
	var tables = document.getElementsByTagName('table');

	for (var i = 0; i < tables.length; i++) {
		resizableGrid(tables[i]);
	}

	/* 단일 테이블 지정. ID를 줘야함.
	var table = document.getElementById('tableId');
	resizableGrid(table);
	 */

	function resizableGrid(table) {

		var row = table.getElementsByTagName('tr')[0],

		cols = row ? row.children : undefined;
		if (!cols)
			return;

		table.style.overflow = 'hidden';

		var tableHeight = table.offsetHeight;

		for (var i = 0; i < cols.length; i++) {
			var div = createDiv(tableHeight);
			cols[i].appendChild(div);
			cols[i].style.position = 'relative';
			setListeners(div);
		}

		function setListeners(div) {
			var pageX, curCol, nxtCol, curColWidth, nxtColWidth;

			div.addEventListener('mousedown', function(e) {
				curCol = e.target.parentElement;
				nxtCol = curCol.nextElementSibling;
				pageX = e.pageX;

				var padding = paddingDiff(curCol);

				curColWidth = curCol.offsetWidth - padding;
				if (nxtCol)
					nxtColWidth = nxtCol.offsetWidth - padding;
			});

			div.addEventListener('mouseover', function(e) {
				e.target.style.borderRight = '2px solid #0000ff';
			})

			div.addEventListener('mouseout', function(e) {
				e.target.style.borderRight = '';
			})

			document.addEventListener('mousemove', function(e) {
				if (curCol) {
					var diffX = e.pageX - pageX;

					if (nxtCol)
						nxtCol.style.width = (nxtColWidth - (diffX)) + 'px';

					curCol.style.width = (curColWidth + diffX) + 'px';
				}
			});

			document.addEventListener('mouseup', function(e) {
				curCol = undefined;
				nxtCol = undefined;
				pageX = undefined;
				nxtColWidth = undefined;
				curColWidth = undefined
			});
		}

		function createDiv(height) {
			var div = document.createElement('div');
			div.style.top = 0;
			div.style.right = 0;
			div.style.width = '5px';
			div.style.position = 'absolute';
			div.style.cursor = 'col-resize';
			div.style.userSelect = 'none';
			div.style.height = height + 'px';
			return div;
		}

		function paddingDiff(col) {

			if (getStyleVal(col, 'box-sizing') == 'border-box') {
				return 0;
			}

			var padLeft = getStyleVal(col, 'padding-left');
			var padRight = getStyleVal(col, 'padding-right');
			return (parseInt(padLeft) + parseInt(padRight));

		}

		function getStyleVal(elm, css) {
			return (window.getComputedStyle(elm, null).getPropertyValue(css))
		}

	};
</script>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>


</html>


<head>
    <style>
        #list:hover{
            color:black !important;
        }
    </style>
</head>
<body>
    <noscript>
    <meta http-equiv="refresh" content="1; url=JSDisableErrorPage.jsp">
    </noscript>
<div class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" id="webname" href="#" style="font-size:24px; color: white;font-family: serif;">Mining Engine<p style="font-size: 10.2pt;font-style: italic;font-family: sans;">Past Data, Present Analysis, Future Prediction</p></a>
        </div>
        <div class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
            <ul class="nav navbar-nav">


            </ul>
            <ul class="nav navbar-nav navbar-right">
                <!--                <li class="list"><a href="help.jsp" title="Help" id="list" style="height:55px;color: white;">Help</a></li>-->

                <li class="list"><a href="Registration.jsp" title="Sign Up" id="list"  style="height:55px;color: white;">Sign Up</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
</body>
<script>

    $(function() {
        $('.list').bind("mouseover", function() {
            var bcolor = $(this).css("background-color");
            $(this).css("background", "#e7e7e7");
            $(this).bind("mouseout", function() {
                $(this).css("background", bcolor);
            });
        });
    });




</script>
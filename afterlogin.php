<?php

if($_SESSION['username']){

include 'connection.php';
$setstatus="UPDATE `user_info` SET `status_web`='ONLINE' WHERE `username` = '$username'";
$connection->query($setstatus);
  ?>
<html>
<head>
  <link rel="stylesheet" href="css/awesome/css/font-awesome.min.css">
  <script type="text/javascript" src="js/snack.js"></script>
  <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
  <link rel="stylesheet" href="css/style.css">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>


	<title>Admin Panel</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <script src="http://bio.mq.edu.au/Tools/jquery/plugins/riklomas-quicksearch/jquery.quicksearch.js"></script>
  





  <script>
   var TRange=null;

function findString () {
  var str=document.getElementById('searcher').value;
 if (parseInt(navigator.appVersion)<4) return;
 var strFound;
 if (window.find) {

  // CODE FOR BROWSERS THAT SUPPORT window.find

  strFound=self.find(str);
  if (!strFound) {
   strFound=self.find(str,0,1);
   while (self.find(str,0,1)) continue;
  }
 }
 else if (navigator.appName.indexOf("Microsoft")!=-1) {

  // EXPLORER-SPECIFIC CODE

  if (TRange!=null) {
   TRange.collapse(false);
   strFound=TRange.findText(str);
   if (strFound) TRange.select();
  }
  if (TRange==null || strFound==0) {
   TRange=self.document.body.createTextRange();
   strFound=TRange.findText(str);
   if (strFound) TRange.select();
  }
 }
 else if (navigator.appName=="Opera") {
  alert ("Opera browsers not supported, sorry...")
  return;
 }
 if (!strFound) alert ("String '"+str+"' not found!")
 return;
}
  </script>



  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">





<script>
  document.getElementById("defaultOpen").click();
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += "active";
    if(cityName=="Technical Quiz"){
       document.body.style.backgroundImage = "url('img/quizCSE2.jpg')";
       document.body.style.repeat = "no-repeat";
  }
  if(cityName=="Web Designing"){
       document.body.style.backgroundImage = "url('img/WebDesign.jpg')";
       document.body.style.repeat = "no-repeat";
  }

  if(cityName=="Chaos (Hackathon)"){
       document.body.style.backgroundImage = "url('img/Chaos2.jpg')";
       document.body.style.repeat = "no-repeat";
  }

}
</script>



</head>
<body onload="myFunction();">




<br>
<section>
<nav class="navbar navbar-inverse" style="max-width: 100%;">
  <div class="container">
    <!-- <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div> -->
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>

      <li><a href="filter.php">Filter Based Search</a></li>
      <li><a href="upcoming.php">Upcoming Events</a></li>
      <li><a href="userinfo.php">User Info</a></li>
      <li><a href="mail.php">Mail</a></li>
    </ul>
    <div id="searchForm" class="navbar-form navbar-left">
      <div class="input-group">
        <input type="text" id="searcher" class="form-control" placeholder="Search on this page" name="searcher">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit" onclick="findString();" style="height: 2.4em;">
        <i class="glyphicon glyphicon-search"></i>
        </div>
      </div>
    </div>

     <ul class="nav navbar-nav navbar-right">

      <li><a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav></section>

<!-- <div style="max-width: 100%;"> -->
<div class="container">
  <!-- <div id="row"> -->
<div id="content">

	<div id="col-lg-7 col-md-6 col-sm-10">

<div class="tab">
  <button class="tablinks active" onclick="openCity(event, 'CaseInfo')" id="defaultOpen" active>CaseInfo</button>
  <!-- <button class="tablinks" onclick="openCity(event, 'CaseProceeding')">CaseProceeding</button> -->

  <button class="tablinks" onclick="openCity(event, 'DateInfo')">DateInfo</button>
  <button class="tablinks" onclick="openCity(event, 'LatestProceeding')">LatestProceeding</button>
  <button class="tablinks" onclick="openCity(event, 'Lawyer')">Lawyer</button>
  <button class="tablinks" onclick="openCity(event, 'PetitionerRespondentInfo')">PetitionerRespondentInfo</button>
  <button class="tablinks" onclick="openCity(event, 'CaseUpdateLog')">CaseUpdateLog</button>
  <button class="tablinks" onclick="openCity(event, 'graph')"><i class="fa fa-bar-chart" aria-hidden="true"></i></button>


  <!-- <button class="tablinks" onclick="openCity(event, 'CaseUpdateLog')">S</button> -->

</div>
</div>
</div></div>
</div>
<!-- </div> -->

<div class="container" style="background-color: rgba(255,255,255,0.5); border-radius: 1%; box-shadow: 2px 2px 5px black;">
<div id="row">
  <div id="col-lg-7 col-md-6 col-sm-10">

<div id="CaseInfo" class="tabcontent content">



<br>

	<?php

		include 'connection.php';

// 		$connection = new mysqli($host, $username, $password, $db);
// // Check connection
// if ($connection->connect_error) {
//     die("Connection failed: " . $connection->connect_error);
// }

 $sql = "SELECT * FROM `case_info`";
 $result = $connection->query($sql);

if ($result->num_rows > 0) {
    // output data of each row


  ?>
  <table style="margin: 0 auto; color: black; margin-bottom: 2%;" border="1" bordercolor="black">

        <tr style="padding: 2vmax; margin:2vmax;">
          <th style="padding-left: 1vmax; padding-right: 1vmax;">File Number</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Case Number</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Year</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Case Type</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Court Name</th>
          <th style="padding-left:  1vmax; padding-right: 1vmax;">Lawyer</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Location</th>

        </tr>



      <?php
      $count=1;
    while($row = $result->fetch_assoc()) {
?>
        <tr style="padding: 1%; margin:1%;">

         <td style="padding:1%;"> <?php echo "<a href=\"report.php?fileNumber=".$row['file_number']."\" target=\"_blank\">".$row['file_number']."</a>";?> </td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["case_number"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["year"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["case_type"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["court_name"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["lawyer"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["location"]; ?></td>
        </tr>
        <?php
        $count++;
    }
} else {
    echo "0 results";
}

?>
</table>



</div>




<div id="CaseUpdateLog" class="tabcontent context">



<br>

	<?php

		include 'connection.php';

// 		$connection = new mysqli($host, $username, $password, $db);
// // Check connection
// if ($connection->connect_error) {
//     die("Connection failed: " . $connection->connect_error);
// }

 $sql = "SELECT * FROM `case_update_log` order by `case_update_log`.`time` desc";
$result = $connection->query($sql);

if ($result->num_rows > 0) {
    // output data of each row


  ?>
  <table style="margin: 0 auto; color: black; margin-bottom: 2%;" border="1" bordercolor="black">

        <tr style="padding: 2vmax; margin:2vmax;">
        	<th style="padding-left: 1vmax; padding-right: 1vmax;">Time</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">File Number</th>

          <th style="padding-left: 1vmax; padding-right: 1vmax;">User Name</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">User Group</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Action</th>

        </tr>



      <?php
      $count=1;
    while($row = $result->fetch_assoc()) {
?>
        <tr style="padding: 1%; margin:1%;">
        	<td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["time"]; ?></td>

          <td style="padding:1%;"> <?php echo "<a href=\"report.php?fileNumber=".$row['file_number']."\" target=\"_blank\">".$row['file_number']."</a>";?> </td>

          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["username"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["user_group"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["action"]; ?></td>

        </tr>
        <?php
        $count++;
    }
} else {
    echo "0 results";
}

?>
</table>



</div>






<div id="LatestProceeding" class="tabcontent context">



<br>

  <?php

    include 'connection.php';
//     $connection = new mysqli($host, $username, $password, $db);
// // Check connection
// if ($connection->connect_error) {
//     die("Connection failed: " . $connection->connect_error);
// }

 $sql = "SELECT * FROM `latest_proceeding`";
$result = $connection->query($sql);

if ($result->num_rows > 0) {
    // output data of each row


  ?>
  <table style="margin: 0 auto; color: black; margin-bottom: 2%;" border="1" bordercolor="black">

        <tr style="padding: 2vmax; margin:2vmax;">
          <th style="padding-left: 1vmax; padding-right: 1vmax;">File Number</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Proceeding Number</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Proceeding Date</th>

          <th style="padding-left: 1vmax; padding-right: 1vmax;">Decision</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Description</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Next Hearing On</th>


        </tr>



      <?php
      $count=1;
    while($row = $result->fetch_assoc()) {
?>
        <tr style="padding: 1%; margin:1%;">
          <td style="padding:1%;"> <?php echo "<a href=\"report.php?fileNumber=".$row['file_number']."\" target=\"_blank\">".$row['file_number']."</a>";?> </td>

          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["proceeding_number"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["proceeding_date"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["decision"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["description"]; ?></td>

          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["next_hearing_on"]; ?></td>



        </tr>
        <?php
        $count++;
    }
} else {
    echo "0 results";
}

?>
</table>



</div>


<div id="DateInfo" class="tabcontent context">



<br>

  <?php

    include 'connection.php';

//     $connection = new mysqli($host, $username, $password, $db);
// // Check connection
// if ($connection->connect_error) {
//     die("Connection failed: " . $connection->connect_error);
// }

 $sql = "SELECT * FROM `date_info`";
$result = $connection->query($sql);

if ($result->num_rows > 0) {
    // output data of each row


  ?>
  <table style="margin: 0 auto; color: black; margin-bottom: 2%;" border="1" bordercolor="black">

        <tr style="padding: 2vmax; margin:2vmax;">
          <th style="padding-left: 1vmax; padding-right: 1vmax;">File Number</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Case Filed On</th>

          <th style="padding-left: 1vmax; padding-right: 1vmax;">Notice Recieved On</th>

          <th style="padding-left: 1vmax; padding-right: 1vmax;">First Hearing On</th>

        </tr>



      <?php
      $count=1;
    while($row = $result->fetch_assoc()) {
?>
        <tr style="padding: 1%; margin:1%;">
          <td style="padding:1%;"> <?php echo "<a href=\"report.php?fileNumber=".$row['file_number']."\" target=\"_blank\">".$row['file_number']."</a>";?> </td>


          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["case_filed_on"]; ?></td>

          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["notice_received_on"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["first_hearing_on"]; ?></td>


        </tr>
        <?php
        $count++;
    }
} else {
    echo "0 results";
}

?>
</table>



</div>



<div id="LatestProceeding" class="tabcontent context">



<br>

  <?php

    include 'connection.php';

//     $connection = new mysqli($host, $username, $password, $db);
// // Check connection
// if ($connection->connect_error) {
//     die("Connection failed: " . $connection->connect_error);
// }

 $sql = "SELECT * FROM `latest_proceeding`";
$result = $connection->query($sql);

if ($result->num_rows > 0) {
    // output data of each row


  ?>
  <table style="margin: 0 auto; color: black; margin-bottom: 2%;" border="1" bordercolor="black">

        <tr style="padding: 2vmax; margin:2vmax;">
          <th style="padding-left: 1vmax; padding-right: 1vmax;">File Number</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Proceeding Number</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Proceeding Date</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Decision</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Next Hearing On</th>



        </tr>



      <?php
      $count=1;
    while($row = $result->fetch_assoc()) {
?>
        <tr style="padding: 1%; margin:1%;">
         <td style="padding:1%;"> <?php echo "<a href=\"report.php?fileNumber=".$row['file_number']."\" target=\"_blank\">".$row['file_number']."</a>";?> </td>

          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["proceeding_number"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["proceeding_date"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["decision"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["next_hearing_on"]; ?></td>



        </tr>
        <?php
        $count++;
    }
} else {
    echo "0 results";
}

?>
</table>



</div>



<div id="Lawyer" class="tabcontent context">



<br>

  <?php

    include 'connection.php';

//     $connection = new mysqli($host, $username, $password, $db);
// // Check connection
// if ($connection->connect_error) {
//     die("Connection failed: " . $connection->connect_error);
// }

 $sql = "SELECT * FROM `lawyer`";
$result = $connection->query($sql);

if ($result->num_rows > 0) {
    // output data of each row


  ?>
  <table style="margin: 0 auto; color: black; margin-bottom: 2%;" border="1" bordercolor="black">

        <tr style="padding: 2vmax; margin:2vmax;">
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Lawyer Name</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Email</th>



        </tr>



      <?php
      $count=1;
    while($row = $result->fetch_assoc()) {
?>
        <tr style="padding: 1%; margin:1%;">
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["lawyer_name"]; ?></td>

          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["email"]; ?></td>



        </tr>
        <?php
        $count++;
    }
} else {
    echo "0 results";
}

?>
</table>



</div>






<div id="PetitionerRespondentInfo" class="tabcontent context">



<br>

  <?php

    include 'connection.php';

//     $connection = new mysqli($host, $username, $password, $db);
// // Check connection
// if ($connection->connect_error) {
//     die("Connection failed: " . $connection->connect_error);
// }

 $sql = "SELECT * FROM `petitioner_respondent_info`";
$result = $connection->query($sql);

if ($result->num_rows > 0) {
    // output data of each row


  ?>
  <table style="margin: 0 auto; color: black; margin-bottom: 2%;" border="1" bordercolor="black">

        <tr style="padding: 2vmax; margin:2vmax;">
          <th style="padding-left: 1vmax; padding-right: 1vmax;">File Number</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Petitioner's Name</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Petitioner's Email</th>

          <th style="padding-left: 1vmax; padding-right: 1vmax;">Petitioner's Address</th>

          <th style="padding-left: 1vmax; padding-right: 1vmax;">Respondent's Name</th>
          <th style="padding-left: 1vmax; padding-right: 1vmax;">Respondent's Email</th>

          <th style="padding-left: 1vmax; padding-right: 1vmax;">Respondent's Address</th>


        </tr>



      <?php
      $count=1;
    while($row = $result->fetch_assoc()) {
?>
        <tr style="padding: 1%; margin:1%;">
          <td style="padding:1%;"> <?php echo "<a href=\"report.php?fileNumber=".$row['file_number']."\" target=\"_blank\">".$row['file_number']."</a>";?> </td>

          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["petitioner_name"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["petitioner_email"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["petitioner_address"]; ?></td>


          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["respondent_name"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["respondent_email"]; ?></td>
          <td style="padding-left: 2vmax; padding-right: 1vmax;"><?php echo $row["respondent_address"]; ?></td>



        </tr>
        <?php
        $count++;
    }
} else {
    echo "0 results";
}

?>
</table>
</div>

<div id="graph" class="tabcontent context">
  <?php
  include 'connection.php';

  $totalCasesSQL = "SELECT count(file_number) as number_of_cases from
  `case_info`";

  $totalPendingSQL = "SELECT count(file_number) as number_of_cases from
  `latest_proceeding` WHERE decision = 'PENDING' OR decision = 'ADJOURNMENT'";

  $totalDisposedSQL = "SELECT count(file_number) as number_of_cases from
  `latest_proceeding` WHERE decision = 'FINAL JUDGEMENT'";

  $totalCasesResult = $connection->query($totalCasesSQL);
  //echo $totalCasesResult->fetch_assoc()['number_of_cases'];

  $totalPendingResult = $connection->query($totalPendingSQL);
  //echo $totalPendingResult->fetch_assoc()['number_of_cases'];

  $totalDisposedResult = $connection->query($totalDisposedSQL);
  //echo $totalDisposedResult->fetch_assoc()['number_of_cases'];

  ?>
<div class="container" class="chart-container" style="padding-right: 5%;">
    <canvas id="barChart"></canvas>
    <hr>
    <canvas id="pieChart"></canvas>
  </div>
<script>
    let myBarChart = document.getElementById('barChart').getContext('2d');
    let myPieChart  = document.getElementById('pieChart').getContext('2d');

    let data_array = [];
    data_array.push(<?php echo $totalCasesResult->fetch_assoc()['number_of_cases']?>);
    data_array.push(<?php echo $totalPendingResult->fetch_assoc()['number_of_cases']?>);
    data_array.push(<?php echo $totalDisposedResult->fetch_assoc()['number_of_cases']?>);

    // Global Options
    Chart.defaults.global.defaultFontFamily = 'Lato';
    Chart.defaults.global.defaultFontSize = 18;
    Chart.defaults.global.defaultFontColor = '#777';

    let caseCountBarChart = new Chart(myBarChart, {
      type:'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
      data:{
        labels:['Total Cases', 'Total Pending',
        'Total Disposed Off'],
        datasets:[{
          label:'Count',
          data: data_array,
          //backgroundColor:'green',
          backgroundColor:[
            'rgba(255, 99, 132, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(153, 102, 255, 0.6)',
            'rgba(255, 159, 64, 0.6)',
            'rgba(255, 99, 132, 0.6)'
          ],
          borderWidth:1,
          borderColor:'#777',
          hoverBorderWidth:2,
          hoverBorderColor:'#000'
        }]
      },
      responsive:true,
      maintainAspectRatio: false,
      options:{
        title:{
          display:true,
          text:'Court Case Statistics',
          fontSize:25
        },
        legend:{
          display:false, //legend is irrelevant here
          position:'right',
          labels:{
            fontColor:'#000'
          }
        },
        layout:{
          padding:{
            left:0,
            right:0,
            bottom:0,
            top:0
          }
        },
        tooltips:{
          enabled:true
        }
      }
    });

// PI chart starts here
    let caseCountPieChart = new Chart(myPieChart, {
      type:'pie', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
      data:{
        labels:['Total Cases Added', 'Total Pending Cases',
        'Total Disposed Off Cases'],
        datasets:[{
          label:'Count',
          data: data_array,
          //backgroundColor:'green',
          backgroundColor:[
            'rgba(255, 99, 132, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(153, 102, 255, 0.6)',
            'rgba(255, 159, 64, 0.6)',
            'rgba(255, 99, 132, 0.6)'
          ],
          borderWidth:1,
          borderColor:'#777',
          hoverBorderWidth:2,
          hoverBorderColor:'#000'
        }]
      },
      options:{
        title:{
          display:true,
          text:'Court Case Statistics',
          fontSize:25
        },
        legend:{
          display:true, //legend is irrelevant here
          position:'right',
          labels:{
            fontColor:'#000'
          }
        },
        layout:{
          padding:{
            left:0,
            right:0,
            bottom:0,
            top:0
          }
        },
        tooltips:{
          enabled:true
        }
      }
    });

    var resizeId;
        $(window).resize(function() {
            clearTimeout(resizeId);
            resizeId = setTimeout(afterResizing, 100);
        });


        function afterResizing(){
          //barChart, pieChart
            var canvasheight=document.getElementById("barChart").height;
            if(canvasheight <=250)
            {
                window.caseCountPieChart.options.legend.display=false;
                window.caseCountBarChart.options.legend.display=false;
            }
            else
            {
                window.caseCountPieChart.options.legend.display=true;
                window.caseCountBarChart.options.legend.display=true;
            }
            window.caseCountPieChart.update();
            window.caseCountBarChart.update();

        }
</script>
</div>
<!--div for graph ends here -->

</div>
</div></div>
</div>
</div>

<?php

if(!isset($_POST['days'])){

$day_int = 1;
  }
if(isset($_POST['days'])){
$day = $_POST['days'];
$day_int = (int)$day;
}
?>


<!-- Use a button to open the snackbar -->
<!-- <button onclick="myFunction()">Show Snackbar</button> -->

<!-- The actual snackbar -->
<?php
$sql = "SELECT file_number, next_hearing_on, lawyer, proceeding_number FROM latest_proceeding natural join case_info WHERE next_hearing_on <= (DATE_ADD(CURRENT_DATE,INTERVAL + $day_int DAY)) and next_hearing_on >= CURDATE()";

$result = $connection->query($sql);

if ($result->num_rows > 0) {

  while($row = $result->fetch_assoc()){

?>


<div id="snackbar">Case of File Number: <?php echo $row['file_number']; ?> appraoching on <?php echo $row['next_hearing_on'];?><br></div>

<?php
}
}else{
  ?>
   <div id="snackbar">No upcoming Cases....<br> Click on <a href="upcoming.php" style="color: aqua;">Upcoming Events </a>to know more.</div>
  <?php
}

?>


</body>
</html>

<?php
}
else{
  header("location:index.php");
}
?>

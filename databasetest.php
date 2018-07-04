<?php
  include 'connection.php';

  $totalCasesSQL = "SELECT count(file_number) as number_of_cases from
  `case_info`";

  $totalPendingSQL = "SELECT count(file_number) as number_of_cases from
  `latest_proceeding` WHERE decision = 'PENDING' OR decision = 'ADJOURNMENT'";

  $totalDisposedSQL = "SELECT count(file_number) as number_of_cases from
  `latest_proceeding` WHERE decision = 'FINAL JUDGEMENT'";

  $totalCasesResult = $connection->query($totalCasesSQL);
  echo $totalCasesResult->fetch_assoc()['number_of_cases'];

  $totalPendingResult = $connection->query($totalPendingSQL);
  echo $totalPendingResult->fetch_assoc()['number_of_cases'];

  $totalDisposedResult = $connection->query($totalDisposedSQL);
  echo $totalDisposedResult->fetch_assoc()['number_of_cases'];
?>

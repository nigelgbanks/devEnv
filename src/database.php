<html>
   <head>
   </head>
   <body>
    <h1>Databases</h1>
    <?php
    $connection = mysqli_connect('database', 'root', 'password');
    $results = mysqli_query($connection, "SHOW DATABASES");
    while ($row = mysqli_fetch_assoc($results)) {
        echo $row['Database'] . "</br>";
    }
    ?>
   </body>
</html>
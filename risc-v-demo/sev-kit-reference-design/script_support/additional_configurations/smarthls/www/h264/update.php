<html>
<head>
	<title>HLS Image Processing Demo</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="pfsoc.css">
</style>
</head>
<body>		
<!--    <img src="microchip_logo.png" alt="Microchip" width="150" height="100"></br> -->
        <img src="mchp_logo2.png" alt="Microchip" width="187" height="100"></br>
	<h1 align=center style="background-color:powderblue;color:blue">H.264 GUI</h1>

<?php
$brightness = $_REQUEST['brightness'];
$contrast = $_REQUEST['contrast'];
$qf = $_REQUEST['qf'];
$cbred = $_REQUEST['cbred'];
$cbgreen = $_REQUEST['cbgreen'];
$cbblue = $_REQUEST['cbblue'];
$resolution = $_REQUEST['resolution'];
$datapath = $_REQUEST['datapath'];
$thresh = $_REQUEST['thresh'];
$invert = ($_REQUEST['invert'] == "on") ? "on" : "off";
$sobel = ($_REQUEST['sobel'] == "on") ? "on" : "off";
$watermark = ($_REQUEST['watermark'] == "on") ? "on" : "off";
$rotozoom = ($_REQUEST['rotozoom'] == "on") ? "on" : "off";
?>
<table align=center>
<tr></tr>
<tr align=center> <td>
<h2> Please wait while camera configurations are being updated... </h2>
</td></tr>
<tr> 
	<td> <b>Brightness : <?php echo $brightness ?> </td>
	<td> <b>Color Red  : <?php echo $cbred ?> </td>
</tr>
<tr> 
	<td> <b>Contrast   : <?php echo $contrast ?> </td>
	<td> <b>Color Green: <?php echo $cbgreen ?> </td>
</tr>
<tr> 
	<td> <b>Quality Factor: <?php echo $qf ?> </td>
	<td> <b>Color Blue: <?php echo $cbblue ?> </td>
</tr>
<tr> 
	<td> <b>DataPath: <?php echo $datapath ?> </td>
</tr>
<tr> 
	<td> <b>Invert: <?php echo $invert ?> </td>
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
<tr> 
	<td> <b>Threshold: <?php echo $thresh ?> </td>
</tr>
</table>
<?php
    if( $resolution == 1) {
		$hreso = 432;
		$vreso = 240;
	} elseif( $resolution == 2) {
		$hreso = 640;
		$vreso = 480;
	} elseif( $resolution == 3) {
		$hreso = 960;
		$vreso = 544;
	} elseif( $resolution == 4) {
		$hreso = 1280;
		$vreso = 720;
	} elseif( $resolution == 5) {
		$hreso = 1920;
		$vreso = 1072;
	} else {
		$hreso = 1280;
		$vreso = 720;
	}

	$nPixels = $hreso * $vreso;
	$hreso_cmd = "devmem2 0x40001078 w $hreso >/dev/null";
	$vreso_cmd = "devmem2 0x4000107C w $vreso >/dev/null";


	$qhp = "devmem2 0x40001074 w ".$qf." >/dev/null";
	$myfile = fopen("update.sh", "w") or die("Unable to open file!");
	$txt = "/usr/bin/v4l2-ctl -d /dev/video0 --set-ctrl=quality_factor=".$qf." --set-ctrl=brightness=".$brightness." --set-ctrl=contrast=".$contrast." --set-ctrl=gain_red=".$cbred." --set-ctrl=gain_green=".$cbgreen." --set-ctrl=gain_blue=".$cbblue."\n";
	fwrite($myfile, $txt);
	$txt = "$hreso_cmd"."\n";
	fwrite($myfile, $txt);
	$txt = "$vreso_cmd"."\n";
	fwrite($myfile, $txt);
	// The order is important as this is how the main() function expects to parse the options
	fwrite($myfile, "echo -e \\\n");
	fwrite($myfile, "\"".$nPixels."\\n\"\\\n");
	fwrite($myfile, "\"".$sobel."\\n\"\\\n");
	fwrite($myfile, "\"".$invert."\\n\"\\\n");
	fwrite($myfile, "\"".$thresh."\\n\"\\\n");
	fwrite($myfile, "\"".$watermark."\\n\"\\\n");
	fwrite($myfile, "\"".$rotozoom."\\n\"\\\n");
	fwrite($myfile, "> ./hls.hls_pipeline.config");
	fclose($myfile);
?>

<?php
	if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')   
		$url = "https://";   
	else  
		$url = "http://";   
	$url.= $_SERVER['HTTP_HOST'];   
	$url.= $_SERVER['REQUEST_URI'];    
	$ip_server = $_SERVER['SERVER_ADDR'];
	echo shell_exec("sudo /srv/www/test/h264/update.sh >/srv/www/test/h264/update.messages.log 2>/srv/www/test/h264/update.error.log &");

	$resp='URL=http://'.$ip_server.'/test/h264/index.htm?';
	$resp.='v_datapath='.$datapath;
	$resp.='&v_resolution='.$resolution;
	$resp.='&v_bright='.$brightness;
	$resp.='&v_contrast='.$contrast;
	$resp.='&v_qf='.$qf;
	$resp.='&v_red='.$cbred.'&v_green='.$cbgreen.'&v_blue='.$cbblue;
	$resp.='&stream=started';
	$resp.='&v_sobel='.$sobel;
	$resp.='&v_invert='.$invert;
	$resp.='&v_thresh='.$thresh;
	$resp.='&v_watermark='.$watermark;
	$resp.='&v_rotozoom='.$rotozoom;
	
	header('Refresh: 2; '.$resp);
	exit();
?>

</body>
</html>

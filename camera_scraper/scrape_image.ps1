# Created by Elliot Simon <ellsim@dtu.dk>
# August 11, 2021
# Scrapes live camera image every N-seconds from Unifi network camera and saves to date\datetime.jpeg
# Modify CAMERA_IP_ADDRESS and start-sleep -seconds to your own needs

Write-Host "Image scrape tool created by: Elliot Simon, ellsim@dtu.dk" 
    while(1)
{
    $filename = (Get-Date).ToString("yyyy-MM-dd-HH-mm-ss") + ".jpg"
	$date = (Get-Date).ToString("yyyy-MM-dd")

	$folderpath = "D:\camera_images\" + $date 
	New-Item -ItemType Directory -Path $folderpath -Force

	$filepath = $folderpath + "\" + $filename
	
    $url = "http://CAMERA_IP_ADDRESS/snap.jpeg"
    $client = New-Object System.Net.WebClient
    $client.DownloadFile($url, $filepath)
	Write-Host "Image saved to: " $filepath
    start-sleep -seconds 15
}
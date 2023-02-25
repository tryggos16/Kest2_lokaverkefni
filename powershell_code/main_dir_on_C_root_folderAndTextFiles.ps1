$gogn = Import-Csv C:\Users\Tryggvi\Documents\Gogn_and_group_dir.csv


foreach($data in $gogn) {
    $path = $data.GroupFolder
    New-Item -Path C:\Windows\System32\Gogn -Name $data.GroupFolder -ItemType Directory
    New-Item -Path C:\Windows\System32\Gogn\$path -Name $data.fileName -ItemType 'file' -Value $data.value
  
}
 

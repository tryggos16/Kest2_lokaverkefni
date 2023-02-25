$gogn = Import-Csv C:\Users\Tryggvi\Documents\Gogn_and_group_dir.csv
$access = Import-Csv C:\Users\Tryggvi\Documents\AllowAccessesGroupFolder.csv

# Creating the "Gogn" dir
New-Item -Path C: -Name Gogn -ItemType Directory


# creates the new folders by the Group and stores them in the "Gogn" dir
# then creates text files inside the Group folders with a value

foreach($data in $gogn) {
    $path = $data.GroupFolder
    New-Item -Path C:\Windows\System32\Gogn -Name $data.GroupFolder -ItemType Directory
    New-Item -Path C:\Windows\System32\Gogn\$path -Name $data.fileName -ItemType 'file' -Value $data.value
    
}
 

# Grants access to the folders for those in the apropeit Group

foreach($data in $access) {
    $folderPath = $data.FolderPath

    $group = $data.Group

    $accessesType = "FullControl"

    $allowOrDeny = "Allow"

    $argList = $group,$accessesType,$allowOrDeny

    $acl = Get-Acl $folderPath

    $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule -ArgumentList $argList

    $acl.setAccessRule($accessRule)

    $acl | Set-Acl $folderPath
    
    
}

